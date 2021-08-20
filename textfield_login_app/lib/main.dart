import 'package:flutter/material.dart';
import 'package:textfield_login_app/fitstPage.dart';
//import 'package:textfield_login_app/screen.dart';
import 'package:textfield_login_app/secondPage.dart';

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
        '/2nd': (context) {
          return SecondPage();
        }
      },
    );
  }
}
