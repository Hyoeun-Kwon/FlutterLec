import 'package:flutter/material.dart';
import 'flagItem.dart';

//class Name이 중요한거지 file Name 이 중요하지 않다!
class FirstPage extends StatelessWidget {
  //생성자로 넘어온 데이터 못바꾸게 하기
  final List<Flag> list; //변수이름 list
  //required this.list 는 생성자의 키값임!
  const FirstPage({Key? key, required this.list}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('First Page'),
      // ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: ListView.builder(
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
                        list[position].imagePath,
                        height: 100,
                        width: 100,
                        fit: BoxFit.contain,
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      //텍스트
                      Text('${list[position].flagName[0]}_____'),
                    ],
                  ),
                ),
                onTap: () {
                  //context: 위치,
                  _showDialog(context, list[position].flagName);
                },
              ); //return이므로 ;
            },
            itemCount: list.length,
          ),
        ),
      ),
    );
  }
}

//click 시 데이터가 하나씩 가므로 kind, name 각 하나씩 받으면 됨
void _showDialog(BuildContext context, String name) {
  showDialog(
      context: context,
      builder: (BuildContext context) {
        //context 가져가는 이유 : 얼러트를 어디 위치에 띄울지
        return AlertDialog(
          title: Text('국가명'),
          content: Text('이 국기는 $name의 국기 입니다.'), //스트링인터폴레이션
          actions: [
            ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.blue),
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('종료')),
          ],
        );
      });
}
