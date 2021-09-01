import 'package:flutter/material.dart';
import 'package:mybook_list/detailBook.dart';

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
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List bookList = ['오늘의 독후감1', '오늘의 독후감2', '오늘의 독후감3'];
  final items = List<String>.generate(20, (i) => "Item ${i + 1}");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('나의 기록'),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(10, 20, 10, 10),
          child: ListView.builder(
            itemBuilder: (context, position) {
              final item = items[position];
              return Dismissible(
                //direction: DismissDirection.endToStart,
                onDismissed: (direction) {
                  setState(() {
                    items.removeAt(position);
                  });
                },
                background: Container(
                  color: Colors.red,
                  child: Icon(Icons.check),
                ),
                secondaryBackground: Container(
                  color: Colors.white,
                  child: Icon(Icons.cancel),
                ),
                key: Key(item),
                child: GestureDetector(
                  child: Container(
                    child: Card(
                      child: Row(
                        children: [
                          Image.asset(
                            'images/skyrainbow.gif',
                            width: 80,
                            height: 80,
                            fit: BoxFit.contain,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(5, 5, 20, 5),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  '${bookList[0]}',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  '2021-08-31',
                                  style: TextStyle(fontSize: 15),
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(5, 5, 20, 5),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  '${bookList[0]}',
                                  style: TextStyle(fontSize: 15),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  '2021-08-31',
                                  style: TextStyle(fontSize: 15),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                      color: Colors.blueGrey[50],
                    ),
                    width: 300,
                    height: 150,
                    //color: Colors.blueGrey[100],
                  ),
                  onTap: () {
                    //상세화면 -- id 정보 가져가야함! 변경!
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return DetailBook();
                    })).then((value) => reloadData());
                  },
                  onLongPress: () {
                    //길게 누르면 삭제 가능
                  },
                ),
              );
            }, //itemBuilder
            itemCount: items.length,
          ),
        ),
      ),
    );
  }

  void reloadData() {
    setState(() {
      print('Reload BookList Data');
      //handler.queryStudents();
    });
  }
} //listBook.dart
