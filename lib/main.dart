import 'package:flutter/material.dart';
import 'a_page.dart';
import 'b_page.dart';

void main() {
  runApp(MaterialApp(home: HomePage()));
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List _page = [APage(), BPage()];
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _page[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'A頁'),
          BottomNavigationBarItem(icon: Icon(Icons.cabin), label: 'B頁'),
        ],
        currentIndex: _currentIndex,
        fixedColor: Colors.blue,
        onTap: (int index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}
