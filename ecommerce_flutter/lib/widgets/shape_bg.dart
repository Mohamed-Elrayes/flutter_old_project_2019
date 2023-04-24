import 'package:flutter/material.dart';

import '../utilities.dart';

const double cornerRadiusBG = 35;
enum HeightShape{Half , Quarter}

class ShapeBg extends StatelessWidget {


 final HeightShape heightShape ;

  ShapeBg({ @required this.heightShape});


  @override
  Widget build(BuildContext context) {
  final sizeScreen = MediaQuery.of(context).size;
  double height(){
    if (heightShape == HeightShape.Half) {
      return sizeScreen.height * 0.5 ;
    }
    if (heightShape == HeightShape.Quarter) {
      return sizeScreen.height * 0.4 ;
    }
  }

    return Container(
      height: height() ,
      decoration: BoxDecoration(
        color: colorAuth,
        borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(cornerRadiusBG),
            bottomLeft: Radius.circular(cornerRadiusBG)),
      ),
    );
  }
}
