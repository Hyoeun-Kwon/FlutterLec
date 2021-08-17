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
        padding: const EdgeInsets.fromLTRB(30, 30, 0, 0),
        child: Row(
          children: [
            Column(
              children: [
                Text('처음으로 재원이에게 보낸 편지'),
                Text('두번째로 재원이에게 보낸 편지'),
                Text('마지막으로 재원이에게 보낸 편지'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
