import 'package:ahadith_islamic/model/hadithe.dart';
import 'package:ahadith_islamic/networking/networkingpage.dart';
import 'package:ahadith_islamic/screens/LocalAudio%20.dart';
import 'package:ahadith_islamic/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:share/share.dart';

class Homehadith extends StatefulWidget {
  Hadith hadith;

  Homehadith({this.hadith});

  @override
  State<Homehadith> createState() => _HomehadithState();
}

class _HomehadithState extends State<Homehadith> {
  bool bol = true;
  bool clickedcenterFAB = false;
  int selectedindex = 0;
  String text = "";

  @override
  void initState() {
    text = widget.hadith.textHadith;
    super.initState();
  }

  updatetapsection(int index, String buttonText) {
    setState(() {
      selectedindex = index;
    });

    text = buttonText + " \n ";
  }

  Widget getWidget(bool bol) {
    if (bol == true) {
      return NetworkingPage(data: text, hadith: widget.hadith);
    } else {
      {
        return LocalAudio(
            hadith: widget.hadith,
            localAudioPath: 'audio/' + widget.hadith.audioHadith);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          getWidget(bol),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.share),
        onPressed: () {
          setState(() {
            clickedcenterFAB = !clickedcenterFAB;
          });

          Share.share(text, subject: widget.hadith.textHadith);
        },
      ),

      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterDocked,

//buttons
      bottomNavigationBar: BottomAppBar(
        child: Container(
          height: 60,
          margin: EdgeInsets.only(left: 12.0, right: 12.0),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              IconButton(
                //update the bottom app bar view each time an item is clicked
                onPressed: () {
                  bol = true;
                  updatetapsection(0, widget.hadith.textHadith);
                },
                iconSize: 27.0,
                icon: Icon(
                  Icons.book,
                  //darken the icon if it is selected or else give it a different color
                  color: selectedindex == 0 ? colorApp.yellow1 : Colors.white,
                ),
              ),

              IconButton(
                onPressed: () {
                  bol = true;
                  updatetapsection(1, widget.hadith.explanationHadith);
                },
                iconSize: 27.0,
                icon: Icon(
                  Icons.library_books,
                  color: selectedindex == 1 ? colorApp.yellow1 : Colors.white,
                ),
              ),
              //to leave space in between the bottom app bar items and below the FAB
              SizedBox(
                width: 50.0,
              ),

              IconButton(
                onPressed: () {
                  bol = true;
                  updatetapsection(2, widget.hadith.translateNarrator);
                },
                iconSize: 27.0,
                icon: Icon(
                  Icons.collections_bookmark,
                  color: selectedindex == 2 ? colorApp.yellow1 : Colors.white,
                ),
              ),

              IconButton(
                onPressed: () {
                  bol = false;
                  updatetapsection(
                      3, widget.hadith.key + ' \n' + widget.hadith.nameHadith);
                },
                iconSize: 27.0,
                icon: Icon(
                  Icons.volume_up,
                  color: selectedindex == 3 ? colorApp.yellow1 : Colors.white,
                ),
              ),
            ],
          ),
        ),
        //to add a space between the FAB and BottomAppBar
        shape: CircularNotchedRectangle(),
        //color of the BottomAppBar
        color: colorApp.green1,
      ),
    );
  }
}
