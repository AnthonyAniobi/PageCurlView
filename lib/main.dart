import 'package:flutter/material.dart';
import 'package:ntisa_burgers/screens/homepage/homepage.dart';
import 'package:ntisa_burgers/screens/tab_overlay.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        fontFamily: 'Roboto',
        scaffoldBackgroundColor: Colors.white,
        primarySwatch: Colors.blue,
      ),
      home: TabOverlay(),
    );
  }
}
