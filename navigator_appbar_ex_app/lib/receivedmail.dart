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
        padding: const EdgeInsets.fromLTRB(30, 30, 0, 0),
        child: Row(
          children: [
            Column(
              children: [
                Text('효은이가 재원이에게 던진 편지'),
                Text('효은이가 재원이에게 버린 편지'),
                Text('효은이가 재원이에게 선물한 편지')
              ],
            ),
          ],
        ),
      ),
    );
  }
}
