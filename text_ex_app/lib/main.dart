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

//StatelessWidget 이므로 한번 가져오고 안바뀜!
class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Text Exercise 01"),
        centerTitle: false,
        backgroundColor: Colors.lightGreen,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Divider(
              height: 30.0,
              color: Colors.grey[700],
              thickness: 0.5,
            ),
            Text("유비"),
            Text("관우"),
            Text("장비"),
            // SizedBox(
            //   height: 50.0,
            // ),
            Divider(
              height: 30.0,
              color: Colors.grey[700],
              thickness: 0.5,
            ),
            Text(
              "조조",
              // Dictionary = key: value
              style: TextStyle(
                color: Colors.blue,
                letterSpacing: 1.0,
                fontSize: 28.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text("여포"),
            Text("동탁"),
            Divider(
              height: 30.0,
              color: Colors.grey[700],
              thickness: 0.5,
            ),
          ],
        ),
      ),
    );
  }
}
