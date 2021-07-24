import 'package:flutter/material.dart';
import 'page2.dart';

List<String> pageList = ['/page2'];
void main() {

  runApp(MaterialApp(
    initialRoute: '/', routes: {
    '/': (BuildContext context) => HomePage(),
    '/page2': (BuildContext context) => Page2()
  }));
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Home')),
      body: Column(
        children: List.generate(pageList.length, (index) {
          Map<String, String> arguments = {'title': 'Page2'};
          return GestureDetector(
              onTap: () {
                Navigator.of(context).pushNamed('/page2', arguments: arguments);
              },
              child: _textGenerator(pageList[index]));
        }),
      ),
    );
  }
}

Widget _textGenerator(String text) {
  return Padding(padding: EdgeInsets.all(10.0), child: Text(text));
}
