import 'package:flutter/material.dart';
import 'b_page.dart';

class APage extends StatefulWidget {
  const APage({Key? key}) : super(key: key);

  @override
  _APageState createState() => _APageState();
}

class _APageState extends State<APage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('A頁'),
      ),
      body: Center(
        child: ElevatedButton(
          child: Text('去B頁'),
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => BPage()));
          },
        ),
      ),
    );
  }
}
