class Flag {
  //Field
  late String imagePath;
  late String flagName;

  //생성자를 통해 넘기므로 빈 생성자 무조건 필요
  //map 스타일 구성 = dictionary 스타일 구성
  Flag(
      {
      // 이게 꼭 들어가야한다! 아니면 오류다 (=required)
      required this.imagePath,
      required this.flagName});
} //----
