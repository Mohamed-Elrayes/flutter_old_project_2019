import 'package:flutter/material.dart';

class CustomCardWidget extends StatelessWidget {
  final Widget child;
  final Color color;

  final double width;
  final double height;
  final double roundCorner;
  final EdgeInsetsGeometry margin;


  CustomCardWidget({this.child, this.color, this.width, this.height, this.roundCorner = 5 , this.margin});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      margin: margin,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.03),
            offset: const Offset(0, 5),
            blurRadius: 10,
            spreadRadius: 0,
          ),
        ],
        borderRadius: BorderRadius.all(Radius.circular(roundCorner)),
        color: color,
      ),
      child: Material(
        type: MaterialType.transparency,
        borderRadius: BorderRadius.all(Radius.circular(roundCorner)),
        clipBehavior: Clip.antiAlias,
        child: child,
      ),
    );
  }
}
