import 'package:flutter/material.dart';

import 'custom_card_widget.dart';

class ColorCard extends StatelessWidget {
  final Widget child;
  final Color bgColor;
  final Color sideColor;
  final double height;
  final double leftMerge ;

  const ColorCard({this.child, this.bgColor, this.sideColor, this.height , this.leftMerge=10});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(bottom: 10),
        child: CustomCardWidget(
          width: double.infinity,
          height: height,
          color: sideColor,
          child: CustomCardWidget(
            roundCorner: 0,
            margin: EdgeInsets.only(left: leftMerge),
            color: bgColor,
            child: Text("data"),
          ),
        ));
  }
}
//Stack(
//children: <Widget>[
//CustomCardWidget(
//child: Row(
//children: <Widget>[
//Container(
//width: 7,
//height: double.infinity,
//color: sideColor,
//),
//],
//),
//height: height??100,
//width: double.infinity,
//color: bgColor,
//),
//Padding(
//padding: const EdgeInsets.only(left: 20, right: 10, top: 10, bottom: 10),
//child: child,
//)
//],
//),
