import 'package:flutter/material.dart';
import 'b_page.dart';

class APage extends StatefulWidget {
  const APage({Key? key}) : super(key: key);

  @override
  _APageState createState() => _APageState();
}

class _APageState extends State<APage> {
  TextEditingController controller = TextEditingController();
  String? textFromB = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('A頁'),
      ),
      body: Center(
          child: Column(
        children: [
          Row(
            children: [
              Text('傳資料去B頁'),
              Expanded(
                child: TextField(
                  controller: controller,
                ),
              )
            ],
          ),
          ElevatedButton(
            child: Text('去B頁'),
            onPressed: () {
              gotoBPage(context);
            },
          ),
          Text('從B頁傳來的資料:$textFromB')
        ],
      )),
    );
  }

  void gotoBPage(BuildContext context) async {
    String? newText;
    newText = await Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => BPage(
                  textInput: controller.text,
                )));
    setState(() {
      textFromB = newText;
    });
  }
}
