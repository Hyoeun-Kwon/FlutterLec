import 'package:flutter/material.dart';
import 'package:tabbar_app/firstPage.dart';
import 'package:tabbar_app/secondPage.dart';
import 'package:tabbar_app/animalItem.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
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

  //build 하기 전에
  //앱 시작할 때
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller =
        TabController(length: 2, vsync: this); //2개고, vsync : 첫,두번째 모두에 구현
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
        children: [FirstPage(), SecondPage()], //생성자임 (flutter는 생성자로 넘긴다!)
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
