import 'package:flutter/material.dart';

class modifiedtext extends StatelessWidget {
  String texts;
  double size;
  Color color;
  modifiedtext(this.texts, this.size, this.color);

  @override
  Widget build(BuildContext context) {
    return Text(
      texts,
      style: TextStyle(fontSize: size, color: color),
    );
  }
}

class boldtext extends StatelessWidget {
  // const boldtext({Key? key}) : super(key: key);
  String test;
  double size;
  Color color;
  boldtext(this.test, this.size, this.color);

  @override
  Widget build(BuildContext context) {
    return Text(
      test,
      style:
          TextStyle(fontSize: size, color: color, fontWeight: FontWeight.bold),
    );
  }
}
