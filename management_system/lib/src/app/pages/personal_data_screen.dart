import 'package:deltacms/src/widgets/card_color_widget.dart';
import 'package:flutter/material.dart';


class PersonalDataScreen extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('appbarTitle'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Column(
          children: <Widget>[
            ColorCard(
              bgColor: Color(0XFFFFFFBF0),
              sideColor: Color(0XFFFFD770),
              child: Text('data'),
            ),
            ColorCard(
              bgColor: Color(0XFFFFFF1F4),
              sideColor: Color(0XFFFFF7396),
              child: Text('data'),
            ),
            ColorCard(
              bgColor: Color(0XFFFF1F5FF),
              sideColor: Color(0XFFF5387F7),
              child: Text('data'),
            ),

          ],
        ),
      ),
    );
  }


}
