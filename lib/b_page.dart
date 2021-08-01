import 'package:flutter/material.dart';

class BPage extends StatefulWidget {
  const BPage({Key? key}) : super(key: key);

  @override
  _BPageState createState() => _BPageState();
}

class _BPageState extends State<BPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('B頁'),
      ));
  }
}
