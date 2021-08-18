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

/*
context : Widget에 대한 meta정보(모든정보 들어가있음)나 widget tree의 위치를 나타냄.
*/

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Alert Dialog with Gesture'),
      ),
      body: Center(
        child: GestureDetector(
          onTap: () {
            _showDialog(context); //gesture : context를 같이 넘겨 줘야함 (위치 알고있음)
          },
          child: Text('Hello world'),
        ),
      ),
    );
  }
}

void _showDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Alert Title'),
        content: Text('Hello World를 Touch 했습니다.'),
        //actions는 없어도 됨!(버튼을 넣어주기 위해 사용)
        actions: [
          ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.blue),
              ),
              onPressed: () {
                //종료하면 화면 날리는 것이므로 pop!
                Navigator.of(context).pop();
              },
              child: Text('종료')),
        ],
      );
    },
  );
}
