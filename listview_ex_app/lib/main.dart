import 'package:flutter/material.dart';
import 'package:listview_ex_app/firstPage.dart';
import 'package:listview_ex_app/flagItem.dart';
import 'package:listview_ex_app/secondPage.dart';

import 'flagItem.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

//Tab Controller는 main 에 들어감
class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  //with는 extension 이고, SingleTicker~ 는 Tab
  late TabController controller; // tabbar 컨트롤러 만들기
  List<Flag> flagList = [];
  // for문을 위한 flagName
  List<String> flagname = [
    'america',
    'austria',
    'belgium',
    'canada',
    'china',
    'estonia',
    'france',
    'germany',
    'greece',
    'hungary',
    'italy',
    'korea',
    'latvia',
    'lithuania',
    'luxemburg',
    'netherland',
    'romania',
    'turkey'
  ];

  List<String> flagKoname = [
    '아메리카',
    '오스트리아',
    '벨기에',
    '캐나다',
    '차이나',
    '에스토니아',
    '프랑스',
    '독일',
    '그리스',
    '헝가리',
    '이탈리아',
    '한국',
    '라티비아',
    '리투아니아',
    '룸셈부르크',
    '네덜란드',
    '로마',
    '터키'
  ];

  //build 하기 전에
  //앱 시작할 때
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller =
        TabController(length: 2, vsync: this); //2개고, vsync : 첫,두번째 모두에 구현

    //for문으로 이름 넣어보기
    for (var i = 0; i < flagname.length; i++) {
      flagList.add(Flag(
          flagName: "${flagKoname[i]}",
          imagePath: "images/${flagname[i]}.png"));
    }

    //화면이 뜨기 전에 이미지 구현
    // flagList.add(Flag(
    //   flagName: '아메리카',
    //   imagePath: 'images/america.png',
    // ));

    // flagList.add(Flag(
    //   flagName: '오스트리아',
    //   imagePath: 'images/austria.png',
    // ));

    // flagList.add(Flag(
    //   flagName: '벨기에',
    //   imagePath: 'images/belgium.png',
    // ));

    // flagList.add(Flag(
    //   flagName: '캐나다',
    //   imagePath: 'images/canada.png',
    // ));

    // flagList.add(Flag(
    //   flagName: '차이나',
    //   imagePath: 'images/china.png',
    // ));

    // flagList.add(Flag(
    //   flagName: '에스토니아',
    //   imagePath: 'images/estonia.png',
    // ));

    // flagList.add(Flag(
    //   flagName: '프랑스',
    //   imagePath: 'images/france.png',
    // ));

    // flagList.add(Flag(
    //   flagName: '젊은이',
    //   imagePath: 'images/germany.png',
    //   ));

    //   flagList.add(Flag(
    //     flagName: '그리스',
    //     imagePath: 'images/greece.png',
    //   ));

    //   flagList.add(Flag(
    //     flagName: '헝가리',
    //     imagePath: 'images/hungary.png',
    //   ));

    //   flagList.add(Flag(
    //     flagName: '이탈리아',
    //     imagePath: 'images/italy.png',
    //   ));

    //   flagList.add(Flag(
    //     flagName: '한국',
    //     imagePath: 'images/korea.png',
    //   ));
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
        title: Text('국가명 맞추기'),
      ),
      body: TabBarView(
        //TabBar는 클릭했을때 갈 페이지를 알아야 함
        //2개를 import! (탭바에 2개 관리할거야)
        children: [
          FirstPage(
            //list: flagList, //list라는 이름으로 animalList를 줄거야
            list: flagList,
          ),
          SecondPage(
            list: flagList,
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
