void main() {
  String str = "abc";
  print(str);

  var name = "def"; // 타입을 모를때 사용 var (let은 없음)
  print(name);

  // 문자열 보간법
  int intNum1 = 179;
  int intNum2 = 70;

  print("intNum1과 intNum2의 합은 $intNum1 + $intNum2 입니다.");
  print("intNum1과 intNum2의 합은 ${intNum1 + intNum2} 입니다."); //{} 넣어야 계산이 됨

  //dynamic은 문자나 숫자나 둘다 사용 가능 (권장하진 않음, var를 많이 사용함)
  dynamic name1 = "장비";
  print(name1);

  name1 = 10;
  print(name1);
}
