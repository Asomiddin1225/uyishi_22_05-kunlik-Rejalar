import 'package:flutter/material.dart';
import 'package:uyishi_22_05/views/screens/play_scrren.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: PlanScreen(),
    );
  }
}
