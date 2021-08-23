import 'package:crud_app/Delete.dart';
import 'package:crud_app/Insert.dart';
import 'package:crud_app/Select.dart';
import 'package:crud_app/Update.dart';
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
        //제일 처음 뜨는 화면
        '/': (context) {
          return Select();
        },
        '/insert': (context) {
          return Insert();
        },
        '/update': (context) {
          return Update(
            rcode: '',
            rname: '',
            rdept: '',
            rphone: '',
          );
        },
        '/delete': (context) {
          return Delete(
            rcode: '',
            rdept: '',
            rname: '',
            rphone: '',
          );
        }
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
