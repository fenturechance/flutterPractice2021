import 'package:flutter/material.dart';

void main() {
  List<String> textList = ['aaa', 'bbb', 'ccc'];
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        title: Text(
          'My App',
          style: TextStyle(fontSize: 12.0, color: Colors.amber),
        ),
      ),
      body: Column(
        //垂直排列
        children: List.generate(textList.length, (index) {
        return _generateText(textList[index]);
      })
      ),
    ),
  ));
}

Widget _generateText(String text) {
  return Text(text);
}
