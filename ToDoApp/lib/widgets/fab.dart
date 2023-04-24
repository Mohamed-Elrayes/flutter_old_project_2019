import 'package:ToDoApp/theme/light_color.dart';
import 'package:flutter/material.dart';

class FAB extends StatelessWidget {
final Function onPressed ; 
FAB({this.onPressed});

  Widget build(BuildContext context) {
    double size = 60;
    return Material(
      elevation: 8,
      borderRadius: BorderRadius.circular(size),
      shadowColor: Color(0xFFF456C3),
      child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(size),
              gradient: LightColor.floatAColor),
          child: FloatingActionButton(
            backgroundColor: Colors.transparent,
            elevation: 0,
            highlightElevation: 0,
            tooltip: 'Add New Note',
            splashColor: Colors.yellowAccent.withOpacity(.4),
            onPressed: onPressed,
            child: Icon(
              Icons.add,
              color: Colors.white,
              size: 50,
            ),
          )),
    );
  }
}
