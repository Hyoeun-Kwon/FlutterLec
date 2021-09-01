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
  //결과값
  String result = '';
  //json 데이터 담을 List
  List data = [];

  //late String searchInput;

  //검색 부분 textField
  final searchContoller = TextEditingController();

  //scroll controller 가 필요
  late ScrollController _scrollController;
  //kakao에게 요청
  int page = 1; //처음은 1페이지만 줘라 : 데이터 10개 (카카오에서 기본 10개 제공)

  // var previous;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    data = [];
    getJSONData();
    //searchContoller = TextEditingController();
    _scrollController = ScrollController();
    _scrollController.addListener(() {
      //리스트의 마지막일 경우
      if (_scrollController.offset >=
              _scrollController.position.maxScrollExtent &&
          !_scrollController.position.outOfRange) {
        print("bottom");
        page += 1;
        getJSONData();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.teal,
          title: TextField(
            style: TextStyle(color: Colors.amber),
            controller: searchContoller,
            decoration: InputDecoration(
              hintText: '검색어를 입력하세요',
            ),
            keyboardType: TextInputType.text,
          ),
          actions: [
            IconButton(
                onPressed: () {
                  setState(() {
                    if (searchContoller.text == '' ||
                        searchContoller.text.isEmpty) {
                      errorMessage(context);
                    } else {
                      //searchInput = searchContoller.text;
                      data.clear();
                      getJSONData();
                      FocusScope.of(context).unfocus();
                    }
                  });
                },
                icon: Icon(Icons.query_stats))
          ],
        ),
        body: Container(
          child: Center(
            child: data.length == 0
                ? Text(
                    '데이터가 없습니다.',
                    style: TextStyle(fontSize: 20),
                    textAlign: TextAlign.center,
                  )
                : ListView.builder(
                    itemBuilder: (context, index) {
                      return Card(
                        child: Container(
                          child: Row(
                            children: [
                              Image.network(
                                data[index]['thumbnail'] == ''
                                    ? 'https://search1.kakaocdn.net/thumb/R120x174.q85/?fname=http%3A%2F%2Ft1.daumcdn.net%2Flbook%2Fimage%2F3401212%3Ftimestamp%3D20190220102153'
                                    : data[index]['thumbnail'],
                                height: 130,
                                width: 130,
                                fit: BoxFit.contain,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  //title
                                  data[index]['title'].toString().length < 20
                                      ? Text(
                                          data[index]['title'].toString(),
                                          style: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold),
                                        )
                                      : Text(
                                          data[index]['title']
                                              .toString()
                                              .replaceRange(
                                                  20,
                                                  data[index]['title']
                                                      .toString()
                                                      .length,
                                                  '...'),
                                          style: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold),
                                        ),
                                  //원하면 .toString() 다음 replaceRange 말고 subString(0 , 15), 으로 작성 가능
                                  Text(
                                    data[index]['authors'][0],
                                    style: TextStyle(fontSize: 15),
                                  ),
                                  Text(
                                    data[index]['sale_price'].toString(),
                                    style: TextStyle(fontSize: 15),
                                  ),
                                  Text(data[index]['status']),
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                    itemCount: data.length, //itemBuilder
                    controller: _scrollController,
                  ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            page = 1;
            data.clear();
            getJSONData();
          },
          child: Icon(Icons.file_download),
        ),
      ),
    );
  }

  Future<String> getJSONData() async {
    var url = Uri.parse(
        'https://dapi.kakao.com/v3/search/book?target=title&page=$page&query=$searchContoller.text');

    var response = await http.get(url,
        headers: {"Authorization": "KakaoAK df3efb016ec593bc1e294710992c2fe4"});

    setState(() {
      var dataConvertedJSON = json.decode(utf8.decode(response.bodyBytes));
      List result = dataConvertedJSON['documents'];
      data.addAll(result);
    });

    // setState(() {
    //   var dataConvertedJSON = json.decode(utf8.decode(response.bodyBytes));
    //   List result = dataConvertedJSON['documents'];

    //   if (page > 1) {
    //     print("——>>${previous[0]['title']} ++ ${result[0]['title']}");
    //     if (previous[0]['title'] != result[0]['title']) {
    //       data.addAll(result);
    //       previous.clear();
    //       previous.addAll(result);
    //       print("——————> 다른 데이터");
    //     } else {
    //       print("——————> 같은 데이터");
    //     }
    //   } else {
    //     data.addAll(result);
    //     previous.clear();
    //     previous.addAll(result);
    //   }
    // });

    print(response.body);
    return "Success";
  }
}

void errorMessage(BuildContext context) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text('글자를 입력하세요'),
      duration: Duration(seconds: 2),
      backgroundColor: Colors.red,
    ),
  );
}
