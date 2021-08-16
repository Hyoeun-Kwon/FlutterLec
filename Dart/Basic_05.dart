void main() async {
  //async가 있어야 await를 사용 가능, main에는 Future를 못쓰기 때문에 안쓴 것 뿐
  //await getVersionName(); // getVersionName이라는 함수를 대기!
  await getVersionName()
      .then((value) => {print(value)}); // .then: 화면이 새로 왔을경우 ~를 해라
  print("end process");
}

Future<String> getVersionName() async {
  var versionName = await lookUpVersionName();
  return versionName;
}

String lookUpVersionName() {
  return "Flutter";
}
