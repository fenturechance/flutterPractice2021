import 'package:flutter/material.dart';

class Detail extends StatelessWidget {
  Map<String, dynamic> person = Map();
  Detail({person}) {
    this.person = person;
  }
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    String picture = person['picture']['large'];
    return Container(
      width: size.width * 0.8,
      height: 300,
      decoration: BoxDecoration(
          image: DecorationImage(
              image: NetworkImage(picture), fit: BoxFit.fitWidth),
          color: Colors.white),
    );
  }
}
