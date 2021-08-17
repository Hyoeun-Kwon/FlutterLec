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
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);
  //Key? key : 생성자
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Scaffold는 안드로이드 방식
      backgroundColor: Colors.red[200],
      appBar: AppBar(
        title: Text("Image 01"),
        backgroundColor: Colors.red,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: CircleAvatar(
                backgroundImage: AssetImage('images/pika1.png'),
                radius: 50.0,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: CircleAvatar(
                backgroundImage: AssetImage('images/pika2.png'),
                radius: 50.0,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: CircleAvatar(
                backgroundImage: AssetImage('images/pika3.png'),
                radius: 50.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
