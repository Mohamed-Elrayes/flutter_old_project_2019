import 'package:ToDoApp/theme/app_theme.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../widgets/button_submit.dart';
import '../theme/light_color.dart';
import 'package:flutter/material.dart';

import 'nav_bar.dart';

class OnBoarding extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    
    void onPressed()
    {
        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (contxt)=>NavBar()));
    }

    AppTheme.screenUtility(context);
    return Scaffold(
      backgroundColor: LightColor.background,
      body: Padding(
        padding: AppTheme.hPadding,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              height: 300,
              child: Image.asset(
                'assets/images/onbording.png',
                fit: BoxFit.scaleDown,
              ),
            ),
            Column(
              children: <Widget>[
                Text(
                  "Reminders made simple",
                  style: AppTheme.title1Style,
                ),
                SizedBox(
                  height: 15.h,
                ),
                Text(
                  "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris pellentesque erat in blandit luctus.",
                  textAlign: TextAlign.center,
                  style: AppTheme.h3Style.copyWith(color: LightColor.pText),
                ),
              ],
            ),
            SubmitButton(
              myGradient: LightColor.button1Color,
              title: 'Get Started',
              onPressed: onPressed
            ),
          ],
        ),
      ),
    );
  }
}
