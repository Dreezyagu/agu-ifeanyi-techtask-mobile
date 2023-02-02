import 'package:flutter/material.dart';
import 'package:tech_task/screens/home_screen.dart';
import 'package:tech_task/utils/di.dart';

void main() {
  init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tech Task',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: HomeScreen(),
    );
  }
}
