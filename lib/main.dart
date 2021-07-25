import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: HomePage(),
  ));
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _inputController = TextEditingController();
  String onChangeValue = '';
  String onSubmitValue = '';
  String buttonClickValue = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Center(
          child: Column(
        children: [
          TextField(
            controller: _inputController,
            onChanged: (value) {
              setState(() {
                onChangeValue = value;
              });
            },
            onSubmitted: (value) {
              setState(() {
                onSubmitValue = value;
              });
            },
            decoration: InputDecoration(
                filled: true,
                fillColor: Colors.blue.shade400,
                border: InputBorder.none,
                hintText: "請輸入",
                hintStyle: TextStyle(color: Colors.yellow)),
          ),
          GestureDetector(
              onTap: () {
                setState(() {
                  buttonClickValue = _inputController.text;
                });
              },
              child: Container(
                padding: EdgeInsets.all(10.0),
                margin: EdgeInsets.symmetric(vertical: 10.0),
                child: Text('按鈕'),
                decoration: BoxDecoration(color: Colors.blue),
              )),
          Text('onChange後：${onChangeValue}'),
          Text('onSubmit後：${onSubmitValue}'),
          Text('按下按鈕後：${buttonClickValue}'),
        ],
      )),
    ));
  }
}
