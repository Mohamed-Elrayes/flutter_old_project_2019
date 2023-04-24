import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Color appBar = Color(0xFFFBFCFC);
Color bg = Color(0xFFFFFFFF);
Color mainColor = Color(0xFF4EA1B5);
Color titleText = Color(0xFF191818);
Color subtitle = Color(0xFF707070);



TextStyle textStyle = GoogleFonts.getFont('Cairo' );

TextDirection textDirRTL = TextDirection.rtl;
TextDirection textDirLTR = TextDirection.ltr;



double fullWidth(BuildContext context) {
  return MediaQuery.of(context).size.width;
}

double fullHeight(BuildContext context) {
  return MediaQuery.of(context).size.height;
}

double responsiveHScreen(BuildContext context, {bool haveAppbar = true}) {
  double heightStatusBar = 0;
  double heightAppBar = 0;
  if (haveAppbar) {
    heightAppBar = AppBar().preferredSize.height;
    heightStatusBar = MediaQuery.of(context).padding.top;
  }
  double semiFullHeight = fullHeight(context);
  double heightScreen = semiFullHeight - heightAppBar - heightStatusBar;
  return heightScreen.abs();
}
