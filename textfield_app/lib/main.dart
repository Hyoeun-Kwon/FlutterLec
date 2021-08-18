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
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  //controller 를 정의 : 얘가 data 가지고 있음 *****
  //textfield 가 3개면 3개 있어야함 각각 컨트롤러를 가지고 있어야함! (data를 가지고 있으므로)
  TextEditingController textController = TextEditingController();
  //snackbar
  late String inputValue;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        //키보드 활성화 상태에서 아무데나 누르면 키보드 없어짐
        // Scaffold를 GestureDetector로 감싸기 (appbar와, body 전체를 아우르기 위해)
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text('Single Textfield'),
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                TextField(
                  //controller를 정의 해줘야함
                  controller: textController,
                  //textfield를 꾸미기
                  decoration: InputDecoration(labelText: '글자를 입력하세요'), //hint임
                  //올라오는 keyboard (여러타입중 기본이 text)
                  //숫자인 경우는 number,
                  keyboardType: TextInputType.text,
                ),

                //버튼
                ElevatedButton(
                    onPressed: () {
                      if (textController.text == '' ||
                          textController.text.isEmpty) {
                        errorSnackBar(context);
                      } else {
                        // 내용이 있으면 snackbar --> snackbar를 위한 변수 필요
                        inputValue = textController.text;
                        showSnackBar(context, inputValue);
                      }
                    },
                    child: Text('출력')),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

void errorSnackBar(BuildContext context) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text('글자를 입력하세요'),
      duration: Duration(seconds: 2),
      backgroundColor: Colors.red,
    ),
  );
}

void showSnackBar(BuildContext context, String inputValue) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text('입력한 글자는 $inputValue 입니다.'),
      duration: Duration(seconds: 2),
      backgroundColor: Colors.blue,
    ),
  );
}
