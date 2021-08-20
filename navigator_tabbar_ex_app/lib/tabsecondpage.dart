import 'package:flutter/material.dart';
import 'package:navigator_tabbar_ex_app/animalItem.dart';

class TabSecondPage extends StatefulWidget {
  final List<Animal> list;
  const TabSecondPage({Key? key, required this.list}) : super(key: key);

  @override
  _TabSecondPageState createState() => _TabSecondPageState();
}

class _TabSecondPageState extends State<TabSecondPage> {
  //controller부터 만들고 시작
  final nameController = TextEditingController();
  //radio 버튼 0,1,2 으로 줄것임
  int _radioValue = 0;
  //날수있나요 없나요 해당 부분을 변수로 줄것
  bool flyExist = false;
  //imagePath를 담아둘 변수
  var _imagePath;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          // 필요없는거 같지만 써봄!
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextField(
                  controller: nameController,
                  keyboardType: TextInputType.text,
                  maxLines: 1,
                ),
                //radio button
                Row(
                  //간격 균등하게 만들기 : spaceAround
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Radio(
                      //radio는 그룹중 1개만!
                      value: 0,
                      groupValue: _radioValue, //처음 0번
                      onChanged: _radioChange, //클릭되었을때는 함수!
                    ),
                    Text('양서류'),
                    Radio(
                      value: 1,
                      groupValue: _radioValue,
                      onChanged: _radioChange,
                    ),
                    Text('파충류'),
                    Radio(
                      value: 2,
                      groupValue: _radioValue,
                      onChanged: _radioChange,
                    ),
                    Text('포유류'),
                  ],
                ),
                //checkBox
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text('날 수 있나요?'),
                    Checkbox(
                        value: flyExist, //현재 값은 false
                        onChanged: (check) {
                          setState(() {
                            flyExist = check!;
                          });
                        }),
                  ],
                ),

                // 이미지들
                Container(
                  //container는 차일드 하나뿐이 못쓰나 , width, height를 사용 가능
                  height: 100,
                  child: ListView(
                    scrollDirection: Axis.horizontal, //좌,우로 움직이는 리스트뷰
                    children: [
                      GestureDetector(
                        child: Image.asset(
                          'images/cow.png',
                          width: 80,
                        ),
                        onTap: () {
                          _imagePath =
                              'images/cow.png'; //선택한 값이 imagePath로 들어감!
                        },
                      ),
                      GestureDetector(
                        child: Image.asset(
                          'images/pig.png',
                          width: 80,
                        ),
                        onTap: () {
                          _imagePath = 'images/pig.png';
                        },
                      ),
                      GestureDetector(
                        child: Image.asset(
                          'images/bee.png',
                          width: 80,
                        ),
                        onTap: () {
                          _imagePath = 'images/bee.png';
                        },
                      ),
                      GestureDetector(
                        child: Image.asset(
                          'images/cat.png',
                          width: 80,
                        ),
                        onTap: () {
                          _imagePath = 'images/cat.png';
                        },
                      ),
                      GestureDetector(
                        child: Image.asset(
                          'images/fox.png',
                          width: 80,
                        ),
                        onTap: () {
                          _imagePath = 'images/fox.png';
                        },
                      ),
                      GestureDetector(
                        child: Image.asset(
                          'images/monkey.png',
                          width: 80,
                        ),
                        onTap: () {
                          _imagePath = 'images/monkey.png';
                        },
                      ),
                    ],
                  ),
                ),

                //버튼
                ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.blue)),
                    onPressed: () {
                      //버튼 눌렀을때 얼러트!
                      //값을 다 주고 버튼을 눌렀을때
                      //데이터 만들기
                      var animal = Animal(
                          animalName: nameController.text,
                          kind: getKind(_radioValue),
                          imagePath: _imagePath,
                          flyExist: flyExist);

                      //눌렀을때 배열을 만들어 둠! -> 이를 가지고 얼러트다이얼로그 만들기
                      AlertDialog dialog = AlertDialog(
                        title: Text('동물 추가하기'),
                        content: Text(
                          '이 동물은 ${animal.animalName} 입니다.'
                          '이 동물의 종류는 ${animal.kind} 입니다. \n'
                          '이 동물을 추가하시겠습니까?',
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
                                widget.list.add(animal);
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
                    child: Text('동물 추가하기')),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _radioChange(int? value) {
    setState(() {
      // setState는 프로그램 로직과관련 X, 화면 띄우는것과 관련
      _radioValue = value!;
    });
  }

  getKind(int radioValue) {
    switch (radioValue) {
      case 0:
        return "양서류"; //flutter에 스위치는 브레이크없음 , 기본적으로 한가지만 처리
      case 1:
        return "파충류";
      case 2:
        return "포유류";
    }
  } //getKind
} //---------
