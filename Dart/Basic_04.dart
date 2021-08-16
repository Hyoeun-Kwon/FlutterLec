void main() {
  //함수
  checkVersion();
  print('end process');
}

//비동기 함수 : async
//Future, async, await (web 데이터 불러오기, 크롤링 등에 많이 사용)
Future checkVersion() async {
  print("-------------");
  var version =
      //await 부분은 작업 부분이 다 끝나고 실행됨
      //Dart는 thread 1개라서 같이 사용안됨! 대기하고 다른게 실행되고 나서 실행됨
      // 대기상태 , Single async
      await lookUpVersion(); //async는 awiat 가 있음, lookUpVersion 함수 만들거임

  print(version);
} //

int lookUpVersion() {
  return 12;
}
