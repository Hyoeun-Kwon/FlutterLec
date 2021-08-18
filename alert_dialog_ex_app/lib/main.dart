import 'package:alert_dialog_ex_app/firstpage.dart';
import 'package:alert_dialog_ex_app/secondpage.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) {
          return FirstPage();
        },
        '/second': (context) {
          return SecondPage();
        },
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
