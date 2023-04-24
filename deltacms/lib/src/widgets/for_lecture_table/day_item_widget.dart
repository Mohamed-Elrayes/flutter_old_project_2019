import 'package:deltacms/theme_color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../custome_card_widget.dart';

class DayItem extends StatelessWidget {
  final Widget child ;
  final VoidCallback onTap;
  DayItem({this.child , this.onTap});


  @override

  Widget build(BuildContext context) {
    return
       CustomCardWidget(
        width: fullWidth(context)*.15,
        height: fullWidth(context)*.1,
        color: Colors.red,
        child: Center(child: child),

    );
  }
}


//Widget build(BuildContext context) {
//  return InkWell(
//    onTap: onTap,
//    splashColor: Colors.amber,
//    child: CustomCardWidget(
//      width: fullWidth(context)*.15,
//      height: fullWidth(context)*.1,
//      color: Colors.red,
//      child: Center(child: child),
//    ),
//  );
//}