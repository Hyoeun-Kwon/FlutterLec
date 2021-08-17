import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orangeAccent,
      appBar: AppBar(
        title: Text('영웅 Card'),
        backgroundColor: Colors.deepOrangeAccent,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              CircleAvatar(
                backgroundImage: AssetImage('images/person.jpg'),
                radius: 50.0,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Divider(
                  height: 30.0,
                  color: Colors.grey[900],
                  thickness: 0.5,
                ),
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(10, 2, 0, 2),
                    child: Text(
                      '영웅',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 2, 0, 2),
                child: Row(
                  children: [
                    Text(
                      '이순신 장군',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(10, 2, 0, 2),
                    child: Text(
                      '전적',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(10, 2, 0, 2),
                    child: Text(
                      '62전 62승',
                      style: TextStyle(
                        color: Colors.pink,
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(0.0),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Icon(Icons.check_circle_outline),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Icon(Icons.check_circle_outline),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Icon(Icons.check_circle_outline),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Icon(Icons.check_circle_outline),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Icon(Icons.check_circle_outline),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Icon(Icons.check_circle_outline),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Icon(Icons.check_circle_outline),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(0.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Text('옥포해전'),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Text('사천포해전'),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Text('당포해전'),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Text('한산도대첩'),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Text('부산포대첩'),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Text('명량해전'),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Text('노량해전'),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Image.asset(
                'images/turtle.gif',
                width: 100,
                height: 100,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
