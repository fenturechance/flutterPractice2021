import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
void main() {

  runApp(MaterialApp(
    home: Scaffold(
          appBar: AppBar(title: Text('image')),
          body: PhotoView(
              imageProvider: AssetImage('assets/images/fake250_100.png')))));
}
