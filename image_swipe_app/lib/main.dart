import 'package:flutter/material.dart';
//swipe는 외부라서 : pub.dev에서 복사 -> yaml에 등록 후
import 'package:simple_gesture_detector/simple_gesture_detector.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // title : 앱 등록시에는 다른 것! 사용 (앱 info임)
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

//class 이름 : MyHomePage
class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<String> imageName = [
    'flower_01.png',
    'flower_02.png',
    'flower_03.png',
    'flower_04.png',
    'flower_05.png',
    'flower_06.png'
  ];

  int currentImage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amberAccent,
      appBar: AppBar(
        title: Text('Image Swiping'),
      ),
      body: Center(
        child: SimpleGestureDetector(
          onHorizontalSwipe: _onHorizontalSwipe,
          // onHorizontalSwipe에 기능 적을것을 함수로 처리
          onVerticalSwipe: _onHorizontalSwipe,
          child: Column(
            //column밑 부분에 gesture가 들어가야 하므로 column에 gesture 주기
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(imageName[currentImage]),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Image.asset(
                  'images/${imageName[currentImage]}',
                  width: 350.0,
                  height: 600.0,
                ),
              ), //배열이므로{} 필요
            ],
          ),
        ),
      ),
    );
  }

  //class 안쪽 함수를 사용하기 위해 class 안에 작성
  void _onHorizontalSwipe(SwipeDirection direction) {
    //왼쪽으로 땡기면 +1 , 오른쪽으로 땡기면 -1
    setState(() {
      if (direction == SwipeDirection.left) {
        print('Left');
        currentImage += 1;
        if (currentImage >= imageName.length) {
          currentImage = 0;
        }
      } else {
        print('Right');
        currentImage -= 1;
        if (currentImage < 0) {
          currentImage = imageName.length - 1;
        }
      }
    });
  }
} //------- class
