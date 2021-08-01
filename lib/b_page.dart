import 'package:flutter/material.dart';

class BPage extends StatefulWidget {
  final String? textInput;
  const BPage({Key? key, this.textInput}) : super(key: key);

  @override
  _BPageState createState() => _BPageState(textInput: textInput);
}

class _BPageState extends State<BPage> {
  final String? textInput;
  TextEditingController controller = TextEditingController();
  _BPageState({this.textInput});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('B頁'),
      ),
      body: Center(
          child: Column(
        children: [
          Text('從A頁傳來的資料: $textInput'),
          Row(
            children: [
              Text('傳資料去A頁'),
              Expanded(
                child: TextField(
                  controller: controller,
                ),
              )
            ],
          ),
          ElevatedButton(
            child: Text('去上一頁'),
            onPressed: () {
              Navigator.pop(context, controller.text);
            },
          ),
        ],
      )),
    );
  }
}
