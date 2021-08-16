import 'package:flutter/material.dart';

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
      //debug모드 해제
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //Scaffold는 appBar와 body의 트리 구조임
      // layout 이름 : Scaffold
      appBar: AppBar(
        title: Text("Text App"),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        // Center 위젯이므로 유비라는 글씨가 가운데 있게됨!
        // Center는 child 이므로 1개만
        child: Column(
          // Column은 children 이므로 List -> 여러개 가능
          mainAxisAlignment: MainAxisAlignment.center, // 가운데 정렬!?
          children: [
            Text("유비"),
            SizedBox(
              //height와 width로 간격 주기
              //모든건 ,로 연결
              height: 50.0,
            ),
            Text("장비"),
            Text("관우"),
          ],
        ),
      ),
    );
  }
}
