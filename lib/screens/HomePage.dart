import 'package:ahadith_islamic/utils/string.dart';
import 'package:flutter/material.dart';
import 'package:ahadith_islamic/utils/colors.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'AudioAhadithScreen.dart';
import 'hadithScreen.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SvgPicture.asset(
            "assets/svg/background.svg",
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          Column(
            children: [
              SizedBox(
                height: 100,
              ),
              SvgPicture.asset("assets/svg/logo.svg"),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  TextApp.topHomeScreen,
                  TextApp.headerHomeScreen,

                  //Card  01  reading ahadith
                  GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (ctx) => HadithScreen()));
                      },
                      child: myCard(
                          colorApp.green1,
                          colorApp.green2,
                          TextApp.bookOneScreen,
                          "assets/quran.png",
                          'assets/svg/one.svg')),

                  //Card 02 listing ahadith
                  InkWell(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (ctx) => AudioahadithSscreen()));
                      },
                      child: myCard(
                          colorApp.yellow1,
                          colorApp.red2,
                          TextApp.bookTwoScreen,
                          "assets/play.png",
                          'assets/svg/twoo.svg')),

                  //Card 03 alhadith saved
                  InkWell(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (ctx) => AudioahadithSscreen()));
                      },
                      child: myCard(
                          colorApp.red1,
                          colorApp.red2,
                          TextApp.bookThreeScreen,
                          "assets/save-instagram.png",
                          "assets/svg/three.svg")),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

//_________________Widgets my card

  Widget myCard(
    Color color1,
    color2,
    Text text,
    path1,
    path2,
  ) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 48),
      child: Container(
          height: 95,
          decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                    color: Colors.black26,
                    offset: Offset(10, 10),
                    blurRadius: 40)
              ],
              borderRadius: BorderRadius.circular(8),
              gradient: LinearGradient(
                  colors: [
                    color1,
                    color2,
                  ],
                  begin: AlignmentDirectional.topEnd,
                  end: AlignmentDirectional.bottomStart)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [Image.asset(path1), text, SvgPicture.asset(path2)],
          )),
    );
  }
}
