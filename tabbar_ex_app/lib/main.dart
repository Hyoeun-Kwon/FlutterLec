import 'package:flutter/material.dart';
import 'package:tabbar_ex_app/fitstPage.dart';
import 'package:tabbar_ex_app/secondPage.dart';

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

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tabController = TabController(length: 2, vsync: this);
  }

  //앱 종료 될때
  @override
  void dispose() {
    // TODO: implement dispose
    tabController.dispose(); // 안해주면 쓰레기가 쌓임!
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('피카츄 이미지 탭바'),
        centerTitle: false,
      ),
      body: TabBarView(
        children: [FirstPage(), SecondPage()],
        controller: tabController,
      ),
      bottomNavigationBar: TabBar(
        labelColor: Colors.blueAccent,
        tabs: [
          Tab(
            icon: Icon(Icons.lock_clock, color: Colors.blue),
            text: 'pikaChu Scene #1',
          ),
          Tab(
            icon: Icon(Icons.lock_clock, color: Colors.red),
            text: 'pikaChu Scene #2',
          ),
        ],
        controller: tabController,
      ),
    );
  }
}
