import 'package:flutter/material.dart';

class FirstPage extends StatefulWidget {
  static late String userId;
  const FirstPage({Key? key}) : super(key: key);

  @override
  _FirstPageState createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  final idController = TextEditingController();
  final pwController = TextEditingController();

  String tempId = 'test';
  String tempPw = 'testpw1234';

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        //키보드 올라왔을때 아무곳 누르면 닫히게 하기
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text('Log in'),
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: CircleAvatar(
                    backgroundImage: AssetImage('images/git_cat.jpg'),
                    radius: 50.0,
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                TextField(
                  controller: idController,
                  decoration: InputDecoration(labelText: '사용자 ID를 입력하세요'),
                  keyboardType: TextInputType.text,
                ),
                SizedBox(
                  height: 20,
                ),
                TextField(
                  obscureText: true,
                  controller: pwController,
                  decoration: InputDecoration(labelText: '패스워드를 입력하세요'),
                  keyboardType: TextInputType.text,
                ),
                SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                    onPressed: () {
                      if (idController.text.isEmpty ||
                          pwController.text.isEmpty) {
                        errorMessage(context);
                      } else if (idController.text == tempId ||
                          pwController.text == tempPw) {
                        FirstPage.userId = idController.text;
                        welcomeMessage(context);
                      } else {
                        checkMessage(context);
                      }
                    },
                    child: Text('Log in')),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void welcomeMessage(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          //context 가져가는 이유 : 얼러트를 어디 위치에 띄울지
          return AlertDialog(
            title: Text('환영합니다!'),
            content: Text('신분이 확인 되었습니다.'), //스트링인터폴레이션
            actions: [
              ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.blue),
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                    Navigator.pushNamed(context, '/2nd');

                    // ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    //   content: Text("$tempId님 환영합니다."), //snackBar를 눌렀을때 글씨
                    //   duration: Duration(seconds: 2), //지속시간
                    //   //snackbar색상 기본: 검정
                    //   backgroundColor: Colors.blue,
                    // ));
                  },
                  child: Text('Ok')),
            ],
          );
        });
  }
}

void errorMessage(BuildContext context) {
  SnackBar(
    content: Text('사용자ID와 암호를 입력하세요!'),
    duration: Duration(seconds: 2),
    backgroundColor: Colors.red,
  );
}

void checkMessage(BuildContext context) {
  SnackBar(
    content: Text('사용자ID나 암호가 일치하지 않습니다!'),
    duration: Duration(seconds: 2),
    backgroundColor: Colors.blue,
  );
}
