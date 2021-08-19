class Animal {
  //Field
  late String imagePath;
  late String animalName;
  late String kind;
  late bool flyExist;

  //생성자를 통해 넘기므로 빈 생성자 무조건 필요
  //map = dictionary 스타일!
  Animal(
      {required this.animalName, // 이게 꼭 들어가야한다! 아니면 오류다 (=required)
      required this.kind,
      required this.imagePath,
      required this.flyExist});
} //----
