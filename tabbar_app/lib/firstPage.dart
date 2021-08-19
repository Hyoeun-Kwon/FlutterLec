import 'package:flutter/material.dart';

//class Name이 중요한거지 file Name 이 중요하지 않다!
class FirstPage extends StatelessWidget {
  const FirstPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('First Page'),
      // ),
      body: Center(
        child: Text('첫번째 페이지'),
      ),
    );
  }
}
