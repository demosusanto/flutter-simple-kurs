import 'package:flutter/material.dart';
import 'package:flutter_kurs/screens/list_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Demo Susanto - UTS',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ListScreen(),
      debugShowCheckedModeBanner: true,
    );
  }
}
