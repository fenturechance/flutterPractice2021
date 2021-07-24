import 'package:flutter/material.dart';

void main() {
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
        children: [
          Padding(
            padding: EdgeInsets.all(10.0), //內距
            child: AspectRatio(
              aspectRatio: 16 / 9, //大小固定16比9
              child: Container(
                child: Image.network('https://fakeimg.pl/250x100',
                    fit: BoxFit.cover), //撐大圖片
              ),
            ),
          ),
          Text('test Image')
        ],
      ),
    ),
  ));
}
