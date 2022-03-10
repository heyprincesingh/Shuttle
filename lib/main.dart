import 'package:flutter/material.dart';
import 'package:shuttle/firstscreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Shuttle',
      theme: ThemeData(
      ),
      home: SafeArea(
        child: Scaffold(
          backgroundColor: Color(0xFF1C1C1C),
          body: firstscreen(),
        ),
      ),
    );
  }
}