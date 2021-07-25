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
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String result = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
              padding: EdgeInsets.all(10.0),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      validator: (String? value) {
                        if (!isWordAndDigit(value!)) {
                          return '請輸入英文或數字';
                        }
                        return null;
                      },
                    ),
                    GestureDetector(
                      onTap: () {
                        print(_formKey.currentState!.validate());
                        if (_formKey.currentState!.validate()) {
                          setState(() {
                            result = '驗證成功';
                          });
                        }
                      },
                      child: Container(
                        margin: EdgeInsets.symmetric(vertical: 10.0),
                        padding: EdgeInsets.all(10.0),
                        child: Text('按鈕'),
                        decoration: BoxDecoration(color: Colors.blue),
                      ),
                    ),
                    Text('$result')
                  ],
                  ),
              ))),
    );
  }

  bool isWordAndDigit(String value) {
    return RegExp(r"^[A-Za-z0-9_]+$").hasMatch(value);
  }
}
