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
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  //switch 상태 , 컬러 변수
  var switchValue = false;
  Color _color = Colors.blue;
  late Color _tempColor; //late : 지금은 값을 줄 수 없으나 나중에 값을 주겠다! ? 써도 OK
  // Color? _tempColor; 도 가능하나 ?(optional)보다는 late 사용이 좋다 (현재)

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Changed Button color on Switch"),
        centerTitle: false,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () {},
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(_color)),
                child: Text('Flutter')),
            Switch(
                value: switchValue,
                onChanged: (value) {
                  if (value == true) {
                    //value 는 switch 에 대한 값 켜졌냐 꺼졋냐
                    _tempColor = Colors.red;
                  } else {
                    _tempColor = Colors.blue;
                  }
                  //setState를 한번 사용하기위해 : tempColor를 준것 뿐!
                  setState(() {
                    _color = _tempColor;
                    switchValue = value;
                  });
                }),
          ],
        ),
      ),
    );
  }
}
