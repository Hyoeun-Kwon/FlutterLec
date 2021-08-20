//Tab Controller는 main 에 들어감
import 'package:flutter/material.dart';
import 'package:navigator_tabbar_ex_app/animalItem.dart';
import 'package:navigator_tabbar_ex_app/tabsecondpage.dart';

class SecondPage extends StatefulWidget {
  const SecondPage({Key? key}) : super(key: key);

  @override
  _SecondPageState createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage>
    with SingleTickerProviderStateMixin {
  //with는 extension 이고, SingleTicker~ 는 Tab
  late TabController controller; // tabbar 컨트롤러 만들기
  List<Animal> animalList = [];

  //build 하기 전에
  //앱 시작할 때
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller =
        TabController(length: 2, vsync: this); //2개고, vsync : 첫,두번째 모두에 구현

    //화면이 뜨기 전에 이미지 구현
    animalList.add(Animal(
        animalName: '벌',
        kind: '곤충',
        imagePath: 'images/bee.png',
        flyExist: true));

    animalList.add(Animal(
        animalName: '고양이',
        kind: '포유류',
        imagePath: 'images/cat.png',
        flyExist: false));

    animalList.add(Animal(
        animalName: '젖소',
        kind: '포유류',
        imagePath: 'images/cow.png',
        flyExist: false));
    animalList.add(Animal(
        animalName: '강아지',
        kind: '포유류',
        imagePath: 'images/dog.png',
        flyExist: false));

    animalList.add(Animal(
        animalName: '여우',
        kind: '포유류',
        imagePath: 'images/fox.png',
        flyExist: false));

    animalList.add(Animal(
        animalName: '원숭이',
        kind: '포유류',
        imagePath: 'images/monkey.png',
        flyExist: false));

    animalList.add(Animal(
        animalName: '돼지',
        kind: '포유류',
        imagePath: 'images/pig.png',
        flyExist: false));

    animalList.add(Animal(
        animalName: '늑대',
        kind: '포유류',
        imagePath: 'images/wolf.png',
        flyExist: false));
  }

//앱 종료 될때
  @override
  void dispose() {
    // TODO: implement dispose
    controller.dispose(); // 안해주면 쓰레기가 쌓임!
    super.dispose();
  }

  //앱 만들때
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tab Bar Test'),
      ),
      body: TabBarView(
        //TabBar는 클릭했을때 갈 페이지를 알아야 함
        //2개를 import! (탭바에 2개 관리할거야)
        children: [
          TabFirstPage(
            list: animalList, //list라는 이름으로 animalList를 줄거야
          ),
          TabSecondPage(
            list: animalList,
          )
        ], //생성자임 (flutter는 생성자로 넘긴다!)
        controller: controller, // controller는 내가 정의해둔 controller
      ),

      //bottom~ : 모양 만드는 것
      bottomNavigationBar: TabBar(
        //tabBar는 기본색상이 하양임!
        labelColor: Colors.blueAccent,
        tabs: [
          Tab(
            icon: Icon(
              Icons.looks_one,
              color: Colors.blue,
            ),
            text: 'Page #1',
          ),
          Tab(
            icon: Icon(
              Icons.looks_two,
              color: Colors.red,
            ),
            text: 'Page #2',
          ),
        ],
        controller: controller,
      ),
    );
  }
}

//class Name이 중요한거지 file Name 이 중요하지 않다!
class TabFirstPage extends StatelessWidget {
  //생성자로 넘어온 데이터 못바꾸게 하기
  final List<Animal> list; //변수이름 list
  //required this.list 는 생성자의 키값임!
  const TabFirstPage({Key? key, required this.list}) : super(key: key);

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
                      //텍스트
                      Text(list[position].animalName)
                    ],
                  ),
                ),
                onTap: () {
                  //context: 위치,
                  _showDialog(
                      context, list[position].kind, list[position].animalName);
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
void _showDialog(BuildContext context, String kind, String name) {
  showDialog(
      context: context,
      builder: (BuildContext context) {
        //context 가져가는 이유 : 얼러트를 어디 위치에 띄울지
        return AlertDialog(
          title: Text('$name'),
          content: Text('이 동물은 $kind 입니다.'), //스트링인터폴레이션
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
