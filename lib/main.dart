import 'package:flutter/material.dart';
import 'page2.dart';
void main() {
  runApp(GlobalData(
    child: MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (BuildContext context) => HomePage(),
        '/page2': (BuildContext context) => Page2(),
      },
    ),
  ));
}

class HomePage extends StatefulWidget {
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('image')),
        body: Column(
          children: [
            GestureDetector(
              onTap: () {
                GlobalData.of(context).title = 'new Title';
                Navigator.of(context).pushNamed('/page2');
              },
              child: Text('page2'),
            )
          ],
        ));
  }
}

class GlobalData extends InheritedModel {
  GlobalData({
    this.title,
    Widget? child,
  }) : super(child: child!);

  String? title;

  static GlobalData of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<GlobalData>()!;
  }

  @override
  bool updateShouldNotify(GlobalData old) => title != old.title;

  @override
  bool updateShouldNotifyDependent(GlobalData oldWidget, Set dependencies) {
    if (dependencies.contains('title') && oldWidget.title != title) {
      return true;
    }
    return false;
  }
}
