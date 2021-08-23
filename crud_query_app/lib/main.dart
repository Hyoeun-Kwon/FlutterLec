import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert'; // for json

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

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  //결과값 받는애
  String result = '';
  // json 데이터 담을 List
  List data = []; //= late List data;

//화면 띄우기 전에 준비 ! - initState
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    data = [];
    getJSONData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Query for CRUD'),
      ),
      body: Container(
        child: Center(
          child: data.length == 0
              ? Text(
                  '데이터가 없습니다.',
                  style: TextStyle(fontSize: 20),
                  textAlign: TextAlign.center,
                )
              // 아니라면 (값이 있다면)
              : ListView.builder(
                  itemBuilder: (context, index) {
                    //하나의 카드 = 셀 디자인
                    return Card(
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                Text(
                                  "Code: ",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                Text(
                                    data[index]['code'].toString()), //code:는 키값
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                Text(
                                  "Name: ",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                Text(data[index]['name'].toString()),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                Text(
                                  "Dept: ",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                Text(data[index]['dept'].toString()),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                Text(
                                  "Phone: ",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                Text(data[index]['phone'].toString()),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                  itemCount: data.length,
                ),
        ),
      ),
    );
  }

  Future<String> getJSONData() async {
    //async 타입인데 준비만 해놓고 실질적으로는 맨 나중에 돌아감, 그래서 '데이터가 없습니다 ' 가 먼저 보일 때도 있음
    //Future<String> : 대기하다가 사용하겠다(결과가 미래)
    var url = Uri.parse(
        'http://localhost:8080/Flutter/student_query_flutter.jsp'); //안드는 localhost가 안될때도 있음! -> ip주소로 넣어주기
    var response = await http.get(url);
    //print(response.body);

    //데이터값 바뀔것 : setState
    setState(() {
      //화면에 있는 모양중에서 decode하면 json에서 [], {} 등이 없어지고, 키와 밸류값만 남음
      var dataConvertedJSON = json.decode(utf8.decode(response.bodyBytes));
      //json이 한글일 경우 utf8.decode(response.bodyBytes) 라고 작성!
      List result =
          dataConvertedJSON['results']; // results는 json파일에서 시작에 있는 변수명
      //List로 그대로 들어오기때문에 key : value 로 들어감
      //print(result); // 결과값:flutter: [{code: S001, name: aaa, dept: aaa, phone: 123-4567}, {code: S999, name: James, dept: Math, phone: 123-123}]

      data.addAll(result); // 데이터에 한번에 집어넣기 : addAll
    });

    return "a"; //null안되서 a
  }
} //------

