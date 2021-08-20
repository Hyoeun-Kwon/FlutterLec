import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

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
  //정보를 저장해 둘 변수
  String result = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('http Exercise'),
      ),
      body: Container(
        child: Center(
          child: Text('$result'), // result이므로 맨처음엔 안뜸!
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          //버튼 눌렀을때 정보 가져올거임! _ 어싱크 필요 (함수 앞에다가 async라고만 적으면 됨)
          // Uri : Ip 주소 가지고 있음 (이 Ip 주소에서 요청했어!)
          var url = Uri.parse(
              'https://www.google.com'); // Uniform resource information (내가 누군지 알려주는 정보가 Uri != url)//원하는 사람이 누구야!
          //async와 await와 같이 다닌다.(+ dart는 어싱크지만 동시에 실행되는것 없음)
          var response = await http.get(url); //어싱크지만 화면 다 구성하고 http
          setState(() {
            //setState에 쓰는 변수들은 전역변수로 선언해주는게 좋다.
            result = response.body;
          });
        },
        child: Icon(Icons.file_download),
      ),
    );
  }
}
