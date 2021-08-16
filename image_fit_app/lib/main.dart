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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Image fitting"),
      ),
      body: Center(
        child: Column(
          children: [
            Image.asset(
              'images/turtle.gif',
              width: 50,
              height: 100,
            ),
            Image.asset(
              'images/turtle.gif',
              width: 50,
              height: 100,
              //50과 100 크기에 꽉 채워서 맞춤! (width,height를 가득채워 그림)
              fit: BoxFit.fill,
            ),
            Image.asset(
              'images/turtle.gif',
              width: 50,
              height: 100,
              //가장많이 사용: contain : 그림 비율에 맞춤 *****
              fit: BoxFit.contain,
            ),
            Image.asset(
              'images/turtle.gif',
              width: 50,
              height: 100,
              // 사용 빈도 적음
              fit: BoxFit.cover,
            ),
            Image.asset(
              'images/turtle.gif',
              width: 50,
              height: 100,
              //width 기준으로 맞춤
              fit: BoxFit.fitWidth,
            ),
            Image.asset(
              'images/turtle.gif',
              width: 50,
              height: 100,
              //전체 이미지 나오게 스스로 맞춤
              fit: BoxFit.scaleDown,
            ),
          ],
        ),
      ),
    );
  }
}
