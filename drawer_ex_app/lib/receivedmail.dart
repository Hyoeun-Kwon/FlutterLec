import 'package:flutter/material.dart';

class ReceivedMail extends StatelessWidget {
  const ReceivedMail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Received Mail'),
        backgroundColor: Colors.red,
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(10, 30, 0, 0),
        child: Row(
          children: [
            Column(
              children: [
                Text('아이유에게 받은 편지'),
                Text('BTS에게 받은 편지'),
                Text('유재석에게 받은 편지'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
