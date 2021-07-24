import 'package:flutter/material.dart';
import 'main.dart';

class Page2 extends StatelessWidget {
  Page2();
  @override
  Widget build(BuildContext context) {
    GlobalData g = GlobalData.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('${g.title}'),
      ),
    );
  }
}
