import 'package:flutter/material.dart';

class SecondPage extends StatefulWidget {
  const SecondPage({Key? key}) : super(key: key);

  @override
  _SecondPageState createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  TextEditingController num1Controller = TextEditingController();
  TextEditingController num2Controller = TextEditingController();

  // 입력받는 2개의 숫자
  int num1 = 0;
  int num2 = 0;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        body: Center(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  '덧셈 결과: ${num1 + num2}',
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: TextField(
                  controller: num1Controller,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: TextField(
                  controller: num2Controller,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        // 덧셈, 뺄셈, 곱셈, 나눗셈
                        if (num1Controller.text.isEmpty ||
                            num2Controller.text.isEmpty) {
                          errorMessage(context);
                        } else {
                          num1 = int.parse(num1Controller.text);
                          num2 = int.parse(num2Controller.text);
                        }
                      });
                    },
                    child: Row(
                      children: [
                        Icon(Icons.add),
                        SizedBox(
                          width: 20,
                        ),
                        Text('덧셈 계산'),
                      ],
                    )),
              ),
            ],
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
