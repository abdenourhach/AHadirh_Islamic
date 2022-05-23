import 'package:ahadith_islamic/screens/LocalAudio%20.dart';
import 'package:ahadith_islamic/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../db/mydata.dart';
import '../model/hadithe.dart';
import '../utils/string.dart';

class AudioahadithSscreen extends StatefulWidget {
  @override
  State<AudioahadithSscreen> createState() => _AudioahadithSscreenState();
}

class _AudioahadithSscreenState extends State<AudioahadithSscreen> {
  Widget ayah(String key, name) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Image.asset("assets/img.png"),
        SvgPicture.asset("assets/svg/grey.svg"),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              key,
              style: TextStyle(fontSize: 16, color: colorApp.yellow1),
            ),
            Text(
              name,
              style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: colorApp.yellow1),
              textScaleFactor: .5,
            ),
          ],
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        Expanded(
          child: Stack(
            children: [
              SvgPicture.asset(
                "assets/svg/background.svg",
                width: double.infinity,
                fit: BoxFit.cover,
              ),
              Column(
                children: [
                  SizedBox(
                    height: 50,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(""),
                      SvgPicture.asset("assets/svg/logo.svg"),
                      SvgPicture.asset("assets/svg/arrow-right.svg"),
                    ],
                  ),
                  Column(
                    //mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: const [
                      TextApp.topHomeScreen,
                      TextApp.headerHomeScreen
                    ],
                  ),
                ],
              ),
            ],
          ),
          flex: 1,
        ),
        Expanded(
          child: Stack(
            children: [
              SvgPicture.asset(
                "assets/svg/background.svg",
                width: double.infinity,
                fit: BoxFit.cover,
              ),
              FutureBuilder(
                  future: Mydata.getAlldata(),
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    if (snapshot.hasData) {
                      return GridView.builder(
                        itemCount: snapshot.data.length,
                        itemBuilder: (BuildContext context, int index) {
                          Hadith item = snapshot.data[index];
                          //delete one register for id
                          return GestureDetector(
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (ctx) => LocalAudio(
                                          hadith: item,
                                          localAudioPath:
                                              'audio/' + item.audioHadith,
                                        )));
                              },
                              child: ayah(item.key, item.nameHadith));
                        },
                        gridDelegate:
                            const SliverGridDelegateWithMaxCrossAxisExtent(
                          maxCrossAxisExtent: 300,
                          mainAxisSpacing: 20,
                          childAspectRatio: 3 / 2,
                        ),
                      );
                    } else {
                      return Center(child: CircularProgressIndicator());
                    }
                  }),
            ],
          ),
          flex: 3,
        ),
      ]),
    );
  }
}
