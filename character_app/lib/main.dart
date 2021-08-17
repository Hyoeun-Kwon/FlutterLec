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
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange,
      appBar: AppBar(
        title: Text("영웅 Card"),
        backgroundColor: Colors.deepOrange,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(10.0, 10.0, 0, 0),
            child: CircleAvatar(
              backgroundImage: AssetImage('images/person.jpeg'),
              radius: 50.0,
            ),
          ),
          Divider(
            height: 30.0,
            color: Colors.grey[700],
            thickness: 0.5,
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
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "이순신 장군",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "전적",
              style: TextStyle(
                fontSize: 15,
                color: Colors.white,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "62전 62승",
              style: TextStyle(
                fontSize: 23,
                fontWeight: FontWeight.bold,
                color: Colors.red,
              ),
            ),
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(3.0),
                child: Icon(Icons.check_circle_outline),
              ),
              Padding(
                padding: const EdgeInsets.all(3.0),
                child: Text(
                  "육포해전",
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(3.0),
                child: Icon(Icons.check_circle_outline),
              ),
              Padding(
                padding: const EdgeInsets.all(3.0),
                child: Text(
                  "서귀포해전",
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(3.0),
                child: Icon(Icons.check_circle_outline),
              ),
              Padding(
                padding: const EdgeInsets.all(3.0),
                child: Text(
                  "당포해전",
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(3.0),
                child: Icon(Icons.check_circle_outline),
              ),
              Padding(
                padding: const EdgeInsets.all(3.0),
                child: Text(
                  "한산도대첩",
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(3.0),
                child: Icon(Icons.check_circle_outline),
              ),
              Padding(
                padding: const EdgeInsets.all(3.0),
                child: Text(
                  "부산포해전",
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(3.0),
                child: Icon(Icons.check_circle_outline),
              ),
              Padding(
                padding: const EdgeInsets.all(3.0),
                child: Text(
                  "명랑해전",
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(3.0),
                child: Icon(Icons.check_circle_outline),
              ),
              Padding(
                padding: const EdgeInsets.all(3.0),
                child: Text(
                  "노량해전",
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Image.asset(
              'images/turtle.gif',
              width: 100,
              height: 100,
              fit: BoxFit.contain,
            ),
          ),
        ],
      ),
    );
  }
}
