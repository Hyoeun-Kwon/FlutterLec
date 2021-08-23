import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert'; // for json

class Insert extends StatefulWidget {
  const Insert({Key? key}) : super(key: key);

  @override
  _InsertState createState() => _InsertState();
}

class _InsertState extends State<Insert> {
  //결과값 받는애
  String result = '';

  TextEditingController codeController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController deptController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  late String code;
  late String name;
  late String dept;
  late String phone;

//화면 띄우기 전에 준비 ! - initState
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    clear();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text('insert & return for CRUD'),
        ),
        body: Center(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextField(
                  controller: codeController,
                  decoration: InputDecoration(labelText: '학번을 입력하세요'), //hint
                  keyboardType: TextInputType.text,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextField(
                  controller: nameController,
                  decoration: InputDecoration(labelText: '성명을 입력하세요'),
                  keyboardType: TextInputType.text,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextField(
                  controller: deptController,
                  decoration: InputDecoration(labelText: '전공을 입력하세요'),
                  keyboardType: TextInputType.text,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextField(
                  controller: phoneController,
                  decoration: InputDecoration(labelText: '전화번호를 입력하세요'),
                  keyboardType: TextInputType.text,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: ElevatedButton(
                    onPressed: () {
                      if ((codeController.text == '' ||
                              codeController.text.isEmpty) ||
                          (nameController.text == '' ||
                              nameController.text.isEmpty)) {
                        errorSnackBar(context);
                      } else {
                        // 내용이 있으면 계산
                        setState(() {
                          code = codeController.text.trim();
                          name = nameController.text.trim();
                          dept = deptController.text.trim();
                          phone = phoneController.text.trim();
                          getJSONData();
                          clear();
                        });
                      }
                    },
                    child: Text('입력')),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<String> getJSONData() async {
    //async 타입인데 준비만 해놓고 실질적으로는 맨 나중에 돌아감, 그래서 '데이터가 없습니다 ' 가 먼저 보일 때도 있음
    //Future<String> : 대기하다가 사용하겠다(결과가 미래)
    var url = Uri.parse(
        'http://localhost:8080/Flutter/student_insert_return_flutter.jsp?code=$code&name=$name&dept=$dept&phone=$phone'); //안드는 localhost가 안될때도 있음! -> ip주소로 넣어주기
    var response = await http.get(url);
    //print(response.body);

    //데이터값 바뀔것 : setState
    setState(() {
      //화면에 있는 모양중에서 decode하면 json에서 [], {} 등이 없어지고, 키와 밸류값만 남음
      var dataConvertedJSON = json.decode(utf8.decode(response.bodyBytes));
      //json이 한글일 경우 utf8.decode(response.bodyBytes) 라고 작성!
      result = dataConvertedJSON['result']; // results는 json파일에서 시작에 있는 변수명
      //List로 그대로 들어오기때문에 key : value 로 들어감
      print(result);

      if (result == 'OK') {
        _showDialog(context);
      }
      if (result == 'ERROR') {
        insertErrorSnackBar(context);
      }
    });

    return "a"; //null안되서 a
  }

  void _showDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('입력 결과'),
          content: Text('입력이 완료 되었습니다'),
          //actions는 없어도 됨!(버튼을 넣어주기 위해 사용)
          actions: [
            ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.blue),
                ),
                onPressed: () {
                  //종료하면 화면 날리는 것이므로 pop!
                  Navigator.of(context).pop();
                },
                child: Text('Ok')),
          ],
        );
      },
    );
  }

  void clear() {
    codeController.clear();
    nameController.clear();
    deptController.clear();
    phoneController.clear();
  }
} //------

void errorSnackBar(BuildContext context) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text('정보를 입력하세요!'),
      duration: Duration(seconds: 2),
      backgroundColor: Colors.amber,
    ),
  );
}

void insertErrorSnackBar(BuildContext context) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text('사용자 정보 입력에 문제가 발생 하였습니다.'),
      duration: Duration(seconds: 2),
      backgroundColor: Colors.red,
    ),
  );
}
