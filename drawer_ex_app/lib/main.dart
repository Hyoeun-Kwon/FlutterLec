import 'package:drawer_ex_app/mail.dart';
import 'package:drawer_ex_app/receivedmail.dart';
import 'package:drawer_ex_app/sendmail.dart';
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
          return Mail();
        },
        '/sendMail': (context) {
          return SendMail();
        },
        '/receivedMail': (context) {
          return ReceivedMail();
        }
      },
    );
  }
}
