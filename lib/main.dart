import 'package:flutter/material.dart';

import 'Pages/Home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Tech NEWS',
      theme: ThemeData(brightness: Brightness.dark),
      home: Home(),
    );
  }
}
