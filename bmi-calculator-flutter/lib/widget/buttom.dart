import 'package:flutter/cupertino.dart';

import 'constractors.dart';

class ButtomClick extends StatelessWidget {
  final Function onTap;
  final String text;

  ButtomClick({this.onTap, this.text});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        color: KBottomContainerColour,
        margin: EdgeInsets.only(top: 10.0),
        width: double.infinity,
        height: KBottomContainerHeight,
        child: Center(
          child: Text(
            text.toUpperCase(),
            style: TextStyle(
                letterSpacing: 5.0, fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
