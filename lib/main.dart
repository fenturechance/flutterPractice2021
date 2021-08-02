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
  List _pages = [
    {"page": APage(), "icon": Icon(Icons.home), "title": "A頁"},
    {"page": BPage(), "icon": Icon(Icons.person), "title": "B頁"},
  ];
  List<ListTile> setPages(List _pages) {
    List<ListTile> list = [];
    for (var index = 0; index < _pages.length; index++) {
      ListTile tile = ListTile(
          leading: CircleAvatar(
            child: _pages[index]["icon"],
          ),
          title: Text(_pages[index]["title"]),
          onTap: () {
            setState(() {
              _currentIndex = index;
            });
            Navigator.of(context).pop();
          });
      list.add(tile);
    }
    return list;
  }
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    List<ListTile> pageTiles = setPages(_pages);
    return Scaffold(
        appBar: AppBar(
          title: Text('這是APP'),
        ),
        drawer: Drawer(
          child: ListView(
            children: [
              UserAccountsDrawerHeader(
                  currentAccountPicture: CircleAvatar(
                    backgroundImage:
                        NetworkImage('https://fakeimg.pl/100x100/'),
                  ),
                  accountName: Text('用戶名'),
                  accountEmail: Text('用戶email')),
              ...pageTiles
            ],
          ),
        ),
        body: _pages[_currentIndex]["page"]);
  }
}
