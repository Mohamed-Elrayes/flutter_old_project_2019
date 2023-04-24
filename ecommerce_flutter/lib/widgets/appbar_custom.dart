
import 'package:flutter/material.dart';
import 'logo_app.dart';

class AppBarCustom extends StatelessWidget {
  final Size sizeScreen;
  const AppBarCustom({
    @required this.sizeScreen,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        width: sizeScreen.width * 0.7,
        margin: EdgeInsets.only(top: 25),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              width: sizeScreen.width * 0.6,
              child: Row(
                children: <Widget>[
                  BackButton(
                    color: Colors.white,
                  ),
                  Spacer(),
                  LogoApp(0)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
