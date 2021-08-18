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
  //textController
  TextEditingController text1Controller = TextEditingController();
  TextEditingController text2Controller = TextEditingController();

  //입력받은 값 1,2
  String inputValue1 = "";
  String inputValue2 = "";
  int num1 = 0;
  int num2 = 0;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text('덧셈 구하기'),
          centerTitle: false,
        ),
        body: Center(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextField(
                  controller: text1Controller,
                  decoration:
                      InputDecoration(labelText: '첫번째 숫자를 입력하세요'), //hint
                  keyboardType: TextInputType.number, //keyboard가 숫자만 올라오게 하기
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextField(
                  controller: text2Controller,
                  decoration: InputDecoration(labelText: '두번째 숫자를 입력하세요'),
                  keyboardType: TextInputType.number,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: ElevatedButton(
                    onPressed: () {
                      if ((text1Controller.text == '' ||
                              text1Controller.text.isEmpty) &&
                          (text2Controller.text == '' ||
                              text2Controller.text.isEmpty)) {
                        errorSnackBar(context);
                      } else {
                        // 내용이 있으면 계산
                        setState(() {
                          inputValue1 = text1Controller.text;
                          inputValue2 = text2Controller.text;
                          num1 = int.parse(inputValue1);
                          num2 = int.parse(inputValue2);
                        });
                      }
                    },
                    child: Text('덧셈 계산')),
              ),
              Padding(
                padding: const EdgeInsets.all(30.0),
                child: Text(
                  '입력하신 숫자의 합은 ${num1 + num2} 입니다.',
                  style: TextStyle(
                      color: Colors.red,
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

void errorSnackBar(BuildContext context) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text('숫자를 입력하세요!'),
      duration: Duration(seconds: 2),
      backgroundColor: Colors.red,
    ),
  );
}
