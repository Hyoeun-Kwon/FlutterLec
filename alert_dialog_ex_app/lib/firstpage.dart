import 'package:flutter/material.dart';

class FirstPage extends StatelessWidget {
  const FirstPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Alert and Push'),
        centerTitle: false,
      ),
      body: Center(
        child: GestureDetector(
          onTap: () {
            _movePage(context);
          },
          child: Text('Move the 2nd page'),
        ),
      ),
    );
  }
}

void _movePage(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Page 이동'),
        content: Text('아래의 버튼을 누르면 페이지 이동을 합니다.'),
        actions: [
          ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, '/second');
              // 이동후 다시 돌아왔을때 얼러트 없기 위해 얼러트 pop
              //Navigator.of(context).pop();
            },
            child: Text('Page 이동'),
          ),
        ],
      );
    },
  );
}
