import 'package:flutter/material.dart';
import 'package:listview_ex_app/flagItem.dart';

class SecondPage extends StatefulWidget {
  final List<Flag> list;
  const SecondPage({Key? key, required this.list}) : super(key: key);

  @override
  _SecondPageState createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  final quizController = TextEditingController(); // 변수 = 생성자 로 사용
  final answerController = TextEditingController();

  var _imagePath;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            TextField(
              controller: quizController,
              keyboardType: TextInputType.text,
              maxLines: 1,
            ),
            TextField(
              controller: answerController,
              keyboardType: TextInputType.text,
              maxLines: 1,
            ),

            ListView.builder(
              scrollDirection: Axis.horizontal, //좌,우로 움직이는 리스트뷰
              //ListView.builder 는 List를 만드는 애
              itemBuilder: (context, position) {
                //context: 뷰 자체위치 (pixel)
                //position: 클릭했을때 전해주는거(변수명 달라도 됨!), 데이터 번호
                //click시 alert띄울것
                return GestureDetector(
                  child: Card(
                    //List 각각이 카드임! (이미지 + 텍스트)
                    child: Row(
                      children: [
                        //이미지
                        Image.asset(
                          widget.list[position].imagePath,
                          height: 100,
                          width: 100,
                          fit: BoxFit.contain,
                        ),

                        SizedBox(
                          width: 20,
                        ),
                        //텍스트
                        Text('${widget.list[position].flagName[0]}_____'),
                      ],
                    ),
                  ),
                  onTap: () {
                    _imagePath = 'images/america.png'; //선택한 값이 imagePath로 들어감!
                  },
                ); //return이므로 ;
              },
              itemCount: widget.list.length,
            ),
            // Container(
            //   //container는 차일드 하나뿐이 못쓰나 , width, height를 사용 가능
            //   height: 100,
            //   child: ListView(
            //     scrollDirection: Axis.horizontal, //좌,우로 움직이는 리스트뷰
            //     children: [
            //       GestureDetector(
            //         child: Image.asset(
            //           'images/america.png',
            //           width: 80,
            //         ),
            //         onTap: () {
            //           _imagePath =
            //               'images/america.png'; //선택한 값이 imagePath로 들어감!
            //         },
            //       ),
            //       GestureDetector(
            //         child: Image.asset(
            //           'images/austria.png',
            //           width: 80,
            //         ),
            //         onTap: () {
            //           _imagePath = 'images/austria.png';
            //         },
            //       ),
            //       GestureDetector(
            //         child: Image.asset(
            //           'images/belgium.png',
            //           width: 80,
            //         ),
            //         onTap: () {
            //           _imagePath = 'images/belgium.png';
            //         },
            //       ),
            //       GestureDetector(
            //         child: Image.asset(
            //           'images/canada.png',
            //           width: 80,
            //         ),
            //         onTap: () {
            //           _imagePath = 'images/canada.png';
            //         },
            //       ),
            //       GestureDetector(
            //         child: Image.asset(
            //           'images/france.png',
            //           width: 80,
            //         ),
            //         onTap: () {
            //           _imagePath = 'images/france.png';
            //         },
            //       ),
            //       GestureDetector(
            //         child: Image.asset(
            //           'images/greece.png',
            //           width: 80,
            //         ),
            //         onTap: () {
            //           _imagePath = 'images/greece.png';
            //         },
            //       ),
            //       GestureDetector(
            //         child: Image.asset(
            //           'images/korea.png',
            //           width: 80,
            //         ),
            //         onTap: () {
            //           _imagePath = 'images/korea.png';
            //         },
            //       ),
            //       GestureDetector(
            //         child: Image.asset(
            //           'images/italy.png',
            //           width: 80,
            //         ),
            //         onTap: () {
            //           _imagePath = 'images/italy.png';
            //         },
            //       ),
            //       GestureDetector(
            //         child: Image.asset(
            //           'images/romania.png',
            //           width: 80,
            //         ),
            //         onTap: () {
            //           _imagePath = 'images/romania.png';
            //         },
            //       ),
            //     ],
            //   ),
            // ),
            //버튼
            ElevatedButton(
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.blue)),
                onPressed: () {
                  //버튼 눌렀을때 얼러트!
                  //값을 다 주고 버튼을 눌렀을때
                  //데이터 만들기
                  var country = Flag(
                    flagName: answerController.text,
                    imagePath: _imagePath,
                  );
                  //눌렀을때 배열을 만들어 둠! -> 이를 가지고 얼러트다이얼로그 만들기
                  AlertDialog dialog = AlertDialog(
                    title: Text('문제 추가하기'),
                    content: Text(
                      //'이 국가의 문제는 ${country[position].flagName[0]}_____ 입니다.'
                      '문제의 정답은 는 ${country.flagName} 입니다. \n'
                      '이 문제를 추가하시겠습니까?',
                      style: TextStyle(fontSize: 17.0),
                    ),
                    //alert에 버튼 달기
                    actions: [
                      ElevatedButton(
                          style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all(Colors.blue)),
                          onPressed: () {
                            //값 저장
                            //list도 widget
                            widget.list.add(country);
                            //얼러트 없애기
                            Navigator.of(context).pop();
                          },
                          child: Text('예')),
                      ElevatedButton(
                          style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all(Colors.red)),
                          onPressed: () {
                            //얼러트 없애기
                            Navigator.of(context).pop();
                          },
                          child: Text('아니오')),
                    ],
                  );

                  //실제 다이얼로그 띄우는 부분
                  showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return dialog;
                      });
                }, //onPress
                child: Text('문제 추가하기')),
          ],
        ),
      ),
    );
  }
}
