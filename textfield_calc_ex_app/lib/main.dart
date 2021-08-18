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
  //6개 Text Conroller
  TextEditingController num1Controller = TextEditingController();
  TextEditingController num2Controller = TextEditingController();
  TextEditingController addController = TextEditingController();
  TextEditingController subController = TextEditingController();
  TextEditingController mulController = TextEditingController();
  TextEditingController divController = TextEditingController();

  // 입력받는 2개의 숫자
  int num1 = 0;
  int num2 = 0;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        //키보드 올라왔을때 아무곳 누르면 닫히게 하기 
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text('간단한 계산기'),
        ),

        //키보드가 올라왔을때 침범 당하는 부분은 : body 임 -> 바디에서 처리
        //Center에서 노랑 전구 -> widget을 추가하여 SingleChildScrollView를 넣어줌
        body: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  TextField(
                    controller: num1Controller,
                    decoration: InputDecoration(labelText: '첫번째 숫자를 입력하세요'),//hint
                    keyboardType: TextInputType.number,//키보드 숫자만 올라오게 하기
                    autofocus: true,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextField(
                    controller: num2Controller,
                    decoration: InputDecoration(labelText: '두번째 숫자를 입력하세요'),
                    keyboardType: TextInputType.number,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                          onPressed: () {
                            setState(() {
                              // 덧셈, 뺄셈, 곱셈, 나눗셈
                              if (num1Controller.text.isEmpty ||
                                  num2Controller.text.isEmpty) {
                                errorMessage(context);
                              } else {
                                num1 = int.parse(num1Controller.text);
                                num2 = int.parse(num2Controller.text);

                                //calcAction(context, num1, num2);
                                addController.text = (num1 + num2).toString();
                                subController.text = (num1 - num2).toString();
                                mulController.text = (num1 * num2).toString();
                                divController.text = (num1 / num2).toString();
                              }
                            });
                          },
                          child: Text('계산하기')),
                      SizedBox(
                        width: 30,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          num1Controller.clear();
                          num2Controller.clear();
                          addController.clear();
                          subController.clear();
                          mulController.clear();
                          divController.clear();

                          FocusScope.of(context).requestFocus(new FocusNode()); //focus 지우기
                        },
                        child: Text('지우기'),
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Colors.redAccent)),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextField(
                    controller: addController,
                    decoration: InputDecoration(labelText: '덧셈결과'),
                    readOnly: true,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextField(
                    controller: subController,
                    decoration: InputDecoration(labelText: '뺄셈결과'),
                    readOnly: true,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextField(
                    controller: mulController,
                    decoration: InputDecoration(labelText: '곱셈결과'),
                    readOnly: true,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextField(
                    controller: divController,
                    decoration: InputDecoration(labelText: '나눗셈결과'),
                    readOnly: true,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

void errorMessage(BuildContext context) {
  SnackBar(
    content: Text('숫자를 입력하세요!'),
    duration: Duration(seconds: 2),
    backgroundColor: Colors.red,
  );
}
