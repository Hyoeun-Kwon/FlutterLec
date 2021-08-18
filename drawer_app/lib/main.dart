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
      //debug모드 해제
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Drawer'),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                print('Shopping cart is clicked');
              },
              icon: Icon(Icons.shopping_cart)),
          IconButton(
              onPressed: () {
                print('Search is clicked');
              },
              icon: Icon(Icons.search)),
        ],
      ),
      //appBar 밖에 작성!(scaffold안에 작성) , drawer는 왼쪽 끝에 생긴다
      drawer: Drawer(
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
              currentAccountPicture: CircleAvatar(
                backgroundImage: AssetImage('images/pika1.png'),
                backgroundColor: Colors.white,
              ),
              otherAccountsPictures: [
                CircleAvatar(
                  backgroundImage: AssetImage('images/pika2.png'),
                  backgroundColor: Colors.white,
                ),
                CircleAvatar(
                  backgroundImage: AssetImage('images/pika3.png'),
                  backgroundColor: Colors.white,
                )
              ],
              accountName: Text('Pikachu'),
              accountEmail: Text('pikachu@gmail.com'),
              //click시 뭔가 하겠다
              onDetailsPressed: () {
                print('main page is clicked');
              },
              decoration: BoxDecoration(
                color: Colors.red[400],
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(40.0),
                    bottomRight: Radius.circular(40.0)),
              ),
            ),

            //ListTile은 UserAccountDrawerHeader밖에
            ListTile(
              leading: Icon(
                Icons.home,
                color: Colors.black,
              ),
              title: Text('Home'),
              onTap: () {
                //눌렀을때!
                print('Home is clicked');
              },
            ),
            ListTile(
              leading: Icon(
                Icons.settings,
                color: Colors.black,
              ),
              title: Text('설정'),
              onTap: () {
                //눌렀을때!
                print('Settings is clicked');
              },
            ),
            ListTile(
              leading: Icon(
                Icons.question_answer,
                color: Colors.red,
              ),
              title: Text('자주 묻는 질문'),
              onTap: () {
                //눌렀을때!
                print('question_answer is clicked');
              },
            ),
          ],
        ),
      ),
    );
  }
}
