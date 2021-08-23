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
        title: Text('JSON Image Test'),
      ),
      body: Container(
        //Container를 주면 어떤 폰 종류든 꽉 채워줌!
        child: Center(
          //data가 있을수도 있고 없을 수도 있음 3항연산식 ? true false
          child: data.length == 0
              ? Text(
                  '데이터가 없습니다.',
                  style: TextStyle(fontSize: 20),
                  textAlign: TextAlign.center,
                )
              // 아니라면 (값이 있다면)
              : ListView.builder(
                  //scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    //하나의 카드 = 셀 디자인
                    return Card(
                      child: Container(
                        child: Column(
                          // mainAxisAlignment: MainAxisAlignment.center, //상하(위아래)의 센터 , // 위젯 센터는 좌우
                          children: [
                            Row(
                              children: [
                                Image.network(
                                  data[index]['image'],
                                  height: 150,
                                  width: 100,
                                  fit: BoxFit.contain,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  '${data[index]['title']}',
                                  style: TextStyle(fontSize: 20),
                                ),
                              ],
                            ),
                          ],
                        ),
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
    var url = Uri.parse('http://localhost:8080/Flutter/movies.json');
    var response = await http.get(url);
    setState(() {
      var dataConvertedJSON = json.decode(utf8.decode(response.bodyBytes));
      //json이 한글일 경우 utf8.decode(response.bodyBytes) 라고 작성!
      List result =
          dataConvertedJSON['results']; // results는 json파일에서 시작에 있는 변수명
      print(
          result); //[{image: http://localhost:8080/Flutter/images/mov01.jpg}, {image: http://localhost:8080/Flutter/images/mov02.jpg},.....]

      data.addAll(result); // 데이터에 한번에 집어넣기 : addAll
    });

    return "a";
  }
}//----------
