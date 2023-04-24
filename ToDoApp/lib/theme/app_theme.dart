import 'package:ToDoApp/widgets/appBar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'light_color.dart';

class AppTheme {
  const AppTheme();

  static ThemeData lightTheme = ThemeData(
    backgroundColor: LightColor.background,
    textTheme: TextTheme(headline1: TextStyle(color: LightColor.titleText1)),
    cardTheme: CardTheme(color: Colors.white),
    primaryTextTheme: TextTheme(
      bodyText1: TextStyle(color: LightColor.titleText1),
    ),
  );

  static TextStyle title1Style = TextStyle( color: LightColor.titleText1,fontSize: 24.ssp,fontWeight: FontWeight.bold);

  static TextStyle title2Style = TextStyle(color: LightColor.titleText1, fontSize: 16.ssp);
  static TextStyle subTitleStyle = TextStyle(color: LightColor.subTitleText, fontSize: 20.ssp);

  static TextStyle h1Style = TextStyle(fontSize: 24.ssp, fontWeight: FontWeight.bold);
  static TextStyle h2Style = TextStyle(fontSize: 22.ssp);
  static TextStyle h3Style = TextStyle(fontSize: 20.ssp);
  static TextStyle h4Style = TextStyle(fontSize: 18.ssp);
  static TextStyle h5Style = TextStyle(fontSize: 16.ssp);
  static TextStyle h6Style = TextStyle(fontSize: 14.ssp);

  static EdgeInsets padding = EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h);
  static EdgeInsets hPadding = EdgeInsets.symmetric(horizontal: 40.w);
  static EdgeInsets vPadding = EdgeInsets.symmetric(horizontal: 12.w);

  static double fullWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  static double fullHeight(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }

  // Use library ScreenUtility
  static void screenUtility(BuildContext context) {
    return ScreenUtil.init(context,
        width: fullWidth(context), height: fullHeight(context));
  }

  static double responsiveHScreen(BuildContext context,{bool haveAppbar = true}) {
    double heightStatusBar = 0;
    double heightAppBar = 0;
    if (haveAppbar) {
      heightAppBar = appBar(context).preferredSize.height;
      heightStatusBar = MediaQuery.of(context).padding.top;
    }
    double semiFullHeight = fullHeight(context);
    double heightScreen = semiFullHeight - heightAppBar - heightStatusBar;
    return heightScreen.abs();
  }
}
