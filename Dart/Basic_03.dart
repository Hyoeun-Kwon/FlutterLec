void main() {
  //배열 선언: List  : String, int 타입 마음대로 가능!
  List threeCountry = [];
  threeCountry.add("한국");
  threeCountry.add("일본");
  threeCountry.add("중국");

  print(threeCountry);

  //데이터 값 변경
  threeCountry[2] = "미국";
  print(threeCountry);

  //remove는 데이터값 삭제
  threeCountry.remove("일본");
  print(threeCountry);

  //remove at은 index
  threeCountry.removeAt(1);
  print(threeCountry);
  print(threeCountry.length);

  threeCountry.add(1);
  threeCountry.add(2);
  print(threeCountry);

  //List에 문자만 넣겠다! Generic 이용
  List<String> threeKingdoms = [];
  threeKingdoms.add("위");
  threeKingdoms.add("촉");

  //List를 만들때 데이터를 주고 만들기 ' " 둘다 가능
  List<String> threeKingdoms3 = ["위", "촉", "오"];
  print(threeKingdoms3);

  //Map : Dictionary임
  Map<String, int> fruitPrice = {
    'apple': 1000,
    'grape': 2000,
    "watermelon": 3000
  };

  print(fruitPrice['apple']);

  //Optional : Null Safety
  int num1 = 10; //class 선언시에는 반드시 데이터가 들어와야 한다

  int? num2 = null; // optional 풀때 ! 사용 동일
  num2 ??= 8; //num2가 널이면 8을 쓸거야
  print(num2);

  //and or 등의 조건문, for문 등 java와 동일
  // for in 문도 있음
  List<int> list1 = [1, 3, 5, 7, 9];
  int sum = 0;
  for (int i in list1) {
    sum += i;
  }

  print("합계 : $sum");
}
