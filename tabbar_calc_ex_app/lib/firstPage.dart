import 'package:flutter/material.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({Key? key}) : super(key: key);

  @override
  _FirstPageState createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
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
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: TextField(
                    controller: num1Controller,
                    decoration: InputDecoration(labelText: '첫번째 숫자를 입력하세요'),
                    keyboardType: TextInputType.number,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: TextField(
                    controller: num2Controller,
                    decoration: InputDecoration(labelText: '두번째 숫자를 입력하세요'),
                    keyboardType: TextInputType.number,
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
                      child: Text('덧셈 계산')),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text('입력하신 숫자의 합은 ${num1 + num2}'),
                ),
              ],
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
