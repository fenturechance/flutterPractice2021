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
        children: [
          Padding(
            padding: EdgeInsets.all(10.0),
            child: AspectRatio(
              aspectRatio: 16 / 9,
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/images/fake250_100.png'),
                      fit: BoxFit.cover),
                ),
              ),
            ),
          )
        ],
      ),
    ),
  ));
}
