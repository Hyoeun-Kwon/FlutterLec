import 'package:flutter/material.dart';

class Mail extends StatelessWidget {
  const Mail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mail'),
        centerTitle: true,
        actions: [
          //mail icon -> sendMail
          IconButton(
            onPressed: () {
              sendEmail(context);
            },
            icon: Icon(Icons.mail),
          ),
          //mail_outline -> receivedMail
          IconButton(
            onPressed: () {
              receivedEmail(context);
            },
            icon: Icon(Icons.mail_outline),
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
              currentAccountPicture: CircleAvatar(
                backgroundImage: AssetImage('images/pika1.png'),
                backgroundColor: Colors.white,
              ),
              accountName: Text('Pikachu'),
              accountEmail: Text('pikachu@naver.com'),
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(40.0),
                  bottomRight: Radius.circular(40.0),
                ),
              ),
            ),

            //ListTile
            ListTile(
              leading: Icon(
                Icons.mail,
                color: Colors.green,
              ),
              title: Text('보낸 편지함'),
              onTap: () {
                sendEmail(context);
              },
            ),
            ListTile(
              leading: Icon(
                Icons.mail_outline,
                color: Colors.red,
              ),
              title: Text('받은 편지함'),
              onTap: () {
                receivedEmail(context);
              },
            ),
          ],
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.green)),
              onPressed: () {
                sendEmail(context);
              },
              child: Text('보낸 편지함'),
            ),
            ElevatedButton(
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.red)),
              onPressed: () {
                receivedEmail(context);
              },
              child: Text('받은 편지함'),
            ),
          ],
        ),
      ),
    );
  }

  //보낸 편지함으로
  void sendEmail(BuildContext context) {
    Navigator.pushNamed(context, '/sendMail');
  }

  //받은 편지함으로
  void receivedEmail(BuildContext context) {
    Navigator.pushNamed(context, '/receivedMail');
  }
}
