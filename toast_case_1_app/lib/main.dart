import 'package:flutter/material.dart';
//toast를 사용하기 위해 import 하기
//import 'package:fluttertoast/fluttertoast.dart';
import 'package:toast_case_1_app/myToast.dart';

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

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Teast message case 1'),
      ),
      //class로 toast 함수 실행
      body: MyToast(),
    );
  }
}
