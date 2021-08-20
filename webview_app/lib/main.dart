import 'dart:async';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.amber,
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
  //전역변수에 적는것 : state와 상관있는 것들
  //웹뷰를 위한 컨트롤러 -> 패키지 필요 yaml 작업
  final Completer<WebViewController> _controller =
      Completer<WebViewController>();
  //indicator 가 웹뷰가 뜬상탠지 아닌지 알아야 하기 때문
  bool isLoading = true; // for indicator

  // --------------------------state : webViewController, loading 상태

  //검색 부분 textField
  final searchContoller = TextEditingController();

  //검색한 값 입력받는 url
  String url = 'https://www.daum.net';

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
              hintText: 'Site 이름을 입력하세요',
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
                      url = searchContoller.text;
                      //첫화면 남기려면.. then
                      _controller.future
                          .then((value) => value.loadUrl('http://$url'));
                      searchContoller.clear();
                      FocusScope.of(context).unfocus();
                    }
                  });
                },
                icon: Icon(Icons.query_stats))
          ],
        ),
        body: Stack(
          children: [
            //z축으로 쌓는것! : Stack
            WebView(
              initialUrl: '$url',
              javascriptMode: JavascriptMode.unrestricted, // javascript를 수용하겠다.
              //onWebViewCreated : 시작할때 어떻게 할까? : indicator 때문에 쓰는 것
              onWebViewCreated: (WebViewController webViewController) {
                _controller.complete(webViewController);
              },
              //page 다 불러왔따
              onPageFinished: (finish) {
                //finish: 변수명
                setState(() {
                  isLoading = false;
                });
              },
              onPageStarted: (start) {
                //finish: 변수명
                setState(() {
                  isLoading = true;
                });
              },
            ),

            //inicator는 webView 위에 뜨는것: 그래서 stack 씀
            //3항 연산자 사용
            isLoading
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : Stack(),
          ],
        ),
        // floating버튼
        // 화면 다 띄워지고 실행 되는 것!
        floatingActionButton: FutureBuilder<WebViewController>(
            //Future는 데이터가 지금 들어오는게 아니고 후에 들어옴
            future: _controller
                .future, //현재 페이지를 저장, 미래에서 클릭하면 현재 페이지로 돌아옴 // progress 다 끝나고 화면다 띄워지면 맨 끝에 구동
            builder: (BuildContext context,
                AsyncSnapshot<WebViewController> controller) {
              //AsyncSnapshot이 현재 위치를 저장! (현재 메모리 상태 그대로 저장 주소도 저장되어있음)
              if (controller.hasData) {
                return FloatingActionButton(
                    child: Icon(Icons.arrow_back),
                    backgroundColor: Colors.redAccent,
                    onPressed: () {
                      controller.data!.goBack();
                    });
              } //if문
              return Container(); // floatingActionButton은 기본적으로 컨테이너 속성이 있음
              //버튼과 페이지가 분리되어 있어야 하기 때문
            }),
      ),
    );
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
