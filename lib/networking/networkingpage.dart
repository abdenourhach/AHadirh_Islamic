import 'package:ahadith_islamic/model/hadithe.dart';
import 'package:flutter/material.dart';

import 'networkingpagecontent.dart';

class NetworkingPage extends StatelessWidget {
  String data;
  Hadith hadith;

  NetworkingPage({this.data, this.hadith});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(slivers: <Widget>[
        NetworkingPageContent(
          data: data,
        )
      ]),
    );
  }
}
