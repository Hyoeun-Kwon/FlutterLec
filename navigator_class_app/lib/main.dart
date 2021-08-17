import 'package:flutter/material.dart';
import 'package:navigator_class_app/screen.dart';
import 'package:navigator_class_app/screen1st.dart';
import 'package:navigator_class_app/screen2nd.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //Material이 Controller 역할을 함
      initialRoute: '/',
      routes: {
        //제일 처음 뜨는 화면
        '/': (context) {
          return Screen(); //Screen을 만들거임
        },
        '/1st': (context) {
          return Screen1st();
        },
        '/2nd': (context) {
          return Screen2nd();
        }
      },
    );
  }
}
