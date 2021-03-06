import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert'; // for json

class Delete extends StatefulWidget {
  final String rcode;
  final String rname;
  final String rdept;
  final String rphone;

  const Delete(
      {Key? key,
      required this.rcode,
      required this.rname,
      required this.rdept,
      required this.rphone})
      : super(key: key);

  @override
  _DeleteState createState() => _DeleteState(rcode, rname, rdept, rphone);
}

class _DeleteState extends State<Delete> {
  TextEditingController codeController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController deptController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  // Create Constructor
  _DeleteState(String rcode, String rname, String rdept, String rphone) {
    this.code = rcode;
    this.name = rname;
    this.dept = rdept;
    this.phone = rphone;
  }

  late String code;
  late String name;
  late String dept;
  late String phone;
  late String result;

  @override
  void initState() {
    super.initState();
    codeController.text = this.code;
    nameController.text = this.name;
    deptController.text = this.dept;
    phoneController.text = this.phone;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text("Delete for CRUD"),
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(30.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      controller: codeController,
                      decoration: InputDecoration(labelText: '?????? ?????????.'),
                      readOnly: true,
                      keyboardType: TextInputType.text,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      controller: nameController,
                      decoration: InputDecoration(labelText: '?????? ?????????'),
                      keyboardType: TextInputType.text,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      controller: deptController,
                      decoration: InputDecoration(labelText: '?????? ?????????'),
                      keyboardType: TextInputType.text,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      controller: phoneController,
                      decoration: InputDecoration(labelText: '???????????? ?????????'),
                      keyboardType: TextInputType.phone,
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        code = codeController.text.toString();
                        name = nameController.text.toString();
                        dept = deptController.text.toString();
                        phone = phoneController.text.toString();
                        getJSONData();
                      },
                      child: Text('??????')),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void getJSONData() async {
    var url = Uri.parse(
        'http://localhost:8080/Flutter/student_delete_return_flutter.jsp?code=$code');
    var response = await http.get(url);
    setState(() {
      var dataConvertedJSON = json.decode(utf8.decode(response.bodyBytes));
      result = dataConvertedJSON['result'];
    });
    if (result == 'OK') {
      _showDialog(context);
    } else {
      errorSnackBar(context);
    }
  }
}

void _showDialog(BuildContext context) {
  showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("?????? ??????"),
          content: Text("????????? ?????? ???????????????."),
          actions: [
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.blue),
              ),
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.pop(context); // Main???????????? ??????
              },
              child: Text('OK'),
            ),
          ],
        );
      });
}

void errorSnackBar(BuildContext context) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text('????????? ????????? ?????? ???????????????.'),
      duration: Duration(seconds: 2),
      backgroundColor: Colors.red,
    ),
  );
}
