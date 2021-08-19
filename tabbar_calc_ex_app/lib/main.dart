import 'package:flutter/material.dart';
import 'package:tabbar_calc_ex_app/firstPage.dart';
import 'package:tabbar_calc_ex_app/secondPage.dart';

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

  @override
  void dispose() {
    // TODO: implement dispose
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('탭바를 이용한 덧셈계산 비교'),
      ),
      body: TabBarView(
        children: [FirstPage(), SecondPage()],
        controller: tabController,
      ),
      bottomNavigationBar: TabBar(
        labelColor: Colors.blueAccent,
        tabs: [
          Tab(
            icon: Icon(
              Icons.calculate,
              color: Colors.blue,
            ),
            text: '맞춤계산 #1',
          ),
          Tab(
            icon: Icon(
              Icons.calculate_outlined,
              color: Colors.red,
            ),
            text: '맞춤계산 #2',
          ),
        ],
        controller: tabController,
      ),
    );
  }
}
