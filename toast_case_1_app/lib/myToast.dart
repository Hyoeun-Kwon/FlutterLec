import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class MyToast extends StatelessWidget {
  const MyToast({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.blue)),
          onPressed: () {
            toastAction();
            // Fluttertoast는 함수
          },
          child: Text('Toast Button')),
    );
  }

  //Toast Action
  void toastAction() {
    Fluttertoast.showToast(
        msg: "Toast Button is Clicked",
        backgroundColor: Colors.black,
        textColor: Colors.white,
        fontSize: 14.0,
        toastLength: Toast.LENGTH_SHORT,
        //toast 위치 지정
        gravity: ToastGravity.TOP);
  }
}
