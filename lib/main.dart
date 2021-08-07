import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(MaterialApp(
    home: HomePage(),
  ));
}

Color generateColor() => Color(0xFFFFFFFF & Random().nextInt(0xFFFFFFFF));

Widget generateContainer(int keyCount) => Container(
      key: ValueKey<int>(keyCount),
      height: Random().nextDouble() * 200,
      width: Random().nextDouble() * 200,
      decoration: BoxDecoration(
        color: generateColor(),
        borderRadius: BorderRadius.circular(Random().nextDouble() * 100),
        border: Border.all(
          color: generateColor(),
          width: Random().nextDouble() * 5,
        ),
      ),
    );
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  late Widget container;
  late int keyCount;

  @override
  void initState() {
    super.initState();
    keyCount = 0;
    container = generateContainer(keyCount);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AnimatedSwitcher'),
        actions: [
          MaterialButton(
            onPressed: () => setState(
              () => container = generateContainer(++keyCount),
            ),
            child: Text(
              'Change Widget',
              style: TextStyle(
                  color: Theme.of(context).buttonTheme.colorScheme!.onPrimary),
            ),
          ),
        ],
      ),
      body: Center(
        // AnimatedSwitcher Widget is used to switch between different widgets
        // with a given transition. You can change the transitions by using
        // transitionBuilder property.
        child: AnimatedSwitcher(
          duration: const Duration(seconds: 1),
          child: container,
          transitionBuilder: (child, animation) => ScaleTransition(
            child: child,
            scale: animation,
          ),
        ),
      ),
    );
  }
}
