import 'package:flutter/material.dart';

class Mail extends StatelessWidget {
  const Mail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Text('Navigator_AppBar'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, '/sendMail');
            },
            icon: Icon(Icons.mail),
          ),
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, '/receivedMail');
            },
            icon: Icon(Icons.mail_outline),
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.green)),
              onPressed: () {
                print('보낸 편지함');
                Navigator.pushNamed(context, '/sendMail');
              },
              child: Text('보낸 편지함'),
            ),
            ElevatedButton(
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.red)),
              onPressed: () {
                print('받은 편지함');
                Navigator.pushNamed(context, '/receivedMail');
              },
              child: Text('받은 편지함'),
            ),
          ],
        ),
      ),
    );
  }
}//---------
