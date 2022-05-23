import 'package:flutter/material.dart';

abstract class TextApp {
  static const Text splashScreen = const Text(
    "الاربعون النووية    ",
    style: TextStyle(
        color: Colors.white, fontWeight: FontWeight.bold, fontSize: 36),
  );

  static const Text topHomeScreen = const Text(
    "الأربعون النووية         ",
    textDirection: TextDirection.rtl,
    style: TextStyle(
        color: Colors.amber, fontWeight: FontWeight.bold, fontSize: 25),
  );
  static const Text headerHomeScreen = const Text(
    "لحفظ وسماع الاحاديث النووية    ",
    style: TextStyle(
        color: Colors.green, fontWeight: FontWeight.bold, fontSize: 15),
  );

  static const Text bookOneScreen = const Text("ألأحاديث الاربعون");
  static const Text bookTwoScreen = const Text("الاستماع للأحاديث");
  static const Text bookThreeScreen = const Text("ألأحاديث المحفوظة");
}
