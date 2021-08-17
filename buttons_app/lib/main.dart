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
      //Container도 child 하나 가지고 있음 , 하나만 갖을 수 있음 (다음에 할 예정)
      appBar: AppBar(
        title: Text("Buttons"),
      ),
      body: Center(
        // Center는 child 하나 가능! , 하나의 위젯만 가능
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          // 그래서 Column 과 같이 많이 사용 (컬럼이 여러개 사용 가능하므로 )
          children: [
            //TextButton 1.onPressed : 눌렀을때 어떻게 할거야? 2. child:글씨
            TextButton(
              onPressed: () {
                //함수 모양으로 만들자 소괄호, 중괄호로
                // 함수를 만들어 넣을 수도 있음!
                print("Text Button");
              },
              onLongPress: () {
                print("Long pressed text button");
              },
              child: Text(
                'Text Button',
                //text에 대한 style
                style: TextStyle(fontSize: 20.0),
              ),
              //textButton에 대한 style
              style: TextButton.styleFrom(
                primary: Colors.red,
              ),
            ),

            ElevatedButton(
              onPressed: () {
                print("Elavated Button");
              },
              child: Text("Elevated Button"),
              style: ElevatedButton.styleFrom(
                  primary: Colors.orangeAccent,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  )),
            ),

            OutlinedButton(
              onPressed: () {
                print("Outlined Button");
              },
              child: Text("Outlined Button"),
              style: OutlinedButton.styleFrom(
                  primary: Colors.green,
                  side: BorderSide(color: Colors.black87, width: 2.0)),
            ),

            TextButton.icon(
              onPressed: () {
                print("Icon Button");
              },
              icon: Icon(Icons.home, size: 30.0),
              label: Text('Go Home'),
              //text button에 대한 style
              style: TextButton.styleFrom(
                primary: Colors.purple,
              ),
            ),

            ElevatedButton.icon(
              onPressed: () {
                print('Elevated Icon');
              },
              icon: Icon(
                Icons.home,
                size: 20.0,
              ),
              label: Text('Go Home'),
              style: ElevatedButton.styleFrom(
                primary: Colors.black,
              ),
            ),

            OutlinedButton.icon(
              onPressed: () {
                print('OutLined icon');
              },
              icon: Icon(
                Icons.home,
                size: 20.0,
              ),
              label: Text('Go Home'),
              style: OutlinedButton.styleFrom(
                primary: Colors.black,
              ),
            ),

            ElevatedButton.icon(
              onPressed: () {
                print('Elevated Icon');
              },
              icon: Icon(
                Icons.home,
                size: 20.0,
              ),
              label: Text('Go Home'),
              style: ElevatedButton.styleFrom(
                primary: Colors.pink[100],
                //onSurface: Colors.pink[50],
              ),
            ),

            ButtonBar(
              //ButtonBar는 버튼들을 집어 넣을 수 있고 각각의 속성을 지정 가능 , 기본적 row 포맷

              //각각의 속성 주기
              alignment: MainAxisAlignment.center, // 중앙 정렬
              buttonPadding: EdgeInsets.all(20), // 전체 패딩 주기

              children: [
                TextButton(
                  onPressed: () {},
                  child: Text("Text Button"),
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: Text("Elavated Button"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
