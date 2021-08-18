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

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key); //생성자

  @override
  _MyHomePageState createState() => _MyHomePageState(); //private
}

//전역 변수 사용 (내가 쓸 변수는 override 위에 전역변수로 사용하는게 좋음)
var switchValue = false; //true, false

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Switch'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Switch(
                value: switchValue,
                //switch 모양 바꿨을때 어떻게 할거야?
                onChanged: (value) {
                  setState(() {
                    switchValue = value;
                    print(switchValue);
                    //여기 까지만 하면 바뀌는 부분이 저장 안됨 -> setState에 저장
                  });
                }),
          ],
        ),
      ),
    );
  }
}
