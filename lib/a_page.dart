import 'package:flutter/material.dart';

class APage extends StatefulWidget {
  const APage({Key? key}) : super(key: key);

  @override
  _APageState createState() => _APageState();
}

class _APageState extends State<APage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('A頁'),
    );
  }
}
