import 'package:ahadith_islamic/screens/HomePage.dart';
import 'package:ahadith_islamic/screens/hadithScreen.dart';
import 'package:ahadith_islamic/screens/splashscreen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "azkar",
      home: SplashScreen(),
    );
  }
}
