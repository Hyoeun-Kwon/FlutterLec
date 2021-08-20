import 'package:flutter/material.dart';
import 'package:textfield_login_app/fitstPage.dart';

class SecondPage extends StatefulWidget {
  const SecondPage({Key? key}) : super(key: key);

  @override
  _SecondPageState createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text(FirstPage.userId),
        backgroundColor: Colors.black,
      ),
      body: Center(
        child: CircleAvatar(
          backgroundImage: AssetImage(
            'images/git_cat.jpg',
          ),
          radius: 50.0,
        ),
      ),
    );
  }
}
