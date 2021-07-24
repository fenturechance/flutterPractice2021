import 'package:flutter/material.dart';

class Page2 extends StatelessWidget {
  Page2();
  @override
  Widget build(BuildContext context) {
    final routes = ModalRoute.of(context);
    if (routes == null) return SizedBox.shrink();
    Map arguments = routes.settings.arguments as Map;
    return Scaffold(
      appBar: AppBar(
        title: Text('${arguments['title']}'),
      ),
    );
  }
}
