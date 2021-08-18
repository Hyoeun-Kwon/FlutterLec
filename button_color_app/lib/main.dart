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

//버튼 클릭시 색상 즉 위젯이 바뀐다 -> stateful
class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
//버튼 클릭시 색상 즉 위젯이 바뀌므로 상태를 변수로 만들어 두는게 좋음!
// 상태 변수는 작게 적어주는 게 좋음
// 초기 값 없이 작성 불가능! null 값 때문에 만약 하기 위해서는
//String? buttonText1;   로 가능
  String buttonText = "Hello";
  Color _color = Colors.blue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Change button color & text'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                //처음색상이면 -> Text와 컬러 바꿔야해
                if (_color == Colors.blue) {
                  setState(() {
                    //화면 변화를 주기 위해 : setState (제일 많이 씀!)
                    buttonText = 'Flutter';
                    _color = Colors.amber;
                  });
                } else {
                  setState(() {
                    buttonText = 'Hello';
                    _color = Colors.blue;
                  });
                }
              },
              // Text 변경 되야하므로 변수 값
              child: Text('$buttonText'),
              style: ButtonStyle(
                  // Color 변경 되야하므로 변수 값
                  backgroundColor: MaterialStateProperty.all(_color)),
            ),
          ],
        ),
      ),
    );
  }
}
