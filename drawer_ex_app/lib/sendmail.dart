import 'package:flutter/material.dart';

class SendMail extends StatelessWidget {
  const SendMail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Send Mail'),
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(10, 30, 0, 0),
        child: Row(
          children: [
            Column(
              children: [
                Text('아이유에게 보낸 편지'),
                Text('BTS에게 보낸 편지'),
                Text('유재석에게 보낸 편지'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
