import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
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
        title: Text("Text Row"),
        centerTitle: false,
        backgroundColor: Colors.blue,
      ),
      body: Center( //지우거나 , 추가하거나 다 노란전구! (tool)를 잘 사용하자
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("James"),
            SizedBox(
              width: 20,
            ),
            Text("Cathy"),
            SizedBox(
              width: 20,
            ),
            Text("Kenny"),
          ],
        ),
      ),
    );
  }
}
