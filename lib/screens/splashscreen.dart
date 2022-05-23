import 'dart:async';

import 'package:ahadith_islamic/screens/HomePage.dart';
import 'package:ahadith_islamic/utils/colors.dart';
import 'package:ahadith_islamic/utils/string.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(Duration(seconds: 6), () {
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (ctx) => HomePage()));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorApp.primary,
      body: Stack(
        alignment: Alignment.center,
        children: [
          SvgPicture.asset(
            "assets/svg/background.svg",
            height: double.infinity,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset("assets/svg/islamic.svg"),
                SizedBox(
                  height: 28,
                ),
                TextApp.splashScreen,
              ],
            ),
          ),
        ],
      ),
    );
  }
}
