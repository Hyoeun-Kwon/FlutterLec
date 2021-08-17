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
        title: Text("Snack Bar"),
      ),
      //class로 부를거임!
      body: MySnackBar(),
    );
  }
}

//stl을 통해 다른 클래스 만들기
class MySnackBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed: () {
          //눌렀을 때 : SnackBar
          // flutter는 toast가 외부 모듈임, 기본적 snackBar 안드로이드는 toast인데 반대!
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text("ElevatedButton is Clicked"), //snackBar를 눌렀을때 글씨
            duration: Duration(seconds: 2), //지속시간
            //snackbar색상 기본: 검정
            backgroundColor: Colors.amber,
          )); // ScaffoldMessenger는 함수임 그래서 ; 사용
        },
        child: Text('Snackbar Button'),
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.blue)),
      ),
    );
  }
}
