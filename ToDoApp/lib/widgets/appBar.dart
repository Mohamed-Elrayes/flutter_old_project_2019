import 'dart:math';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ToDoApp/theme/app_theme.dart';
import 'package:ToDoApp/theme/light_color.dart';
import 'package:flutter/material.dart';

PreferredSize appBar(BuildContext context) {
  return PreferredSize(
    preferredSize: Size.fromHeight(AppTheme.fullHeight(context) * 0.12),
    child: Container(
        decoration: BoxDecoration(gradient: LightColor.appBarColor),
        child: Container(
          height: AppTheme.fullHeight(context),
          width: AppTheme.fullWidth(context),
          child: Stack(
            children: <Widget>[
              Positioned(
                height: 180,
                width: 180,
                top: -75,
                left: -50,
                child: Container(
                  decoration: BoxDecoration(
                      color: Color.fromRGBO(255, 255, 255, 0.17),
                      shape: BoxShape.circle),
                ),
              ),
              Positioned(
                height: 100,
                width: 100,
                top: -30,
                right: -30,
                child: Container(
                  decoration: BoxDecoration(
                      color: Color.fromRGBO(255, 255, 255, 0.17),
                      shape: BoxShape.circle),
                ),
              ),
              SafeArea(
                child: Padding(
                  padding: AppTheme.vPadding,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          //  shange data for dinamic
                          Text(
                            "Hello Brenda!",
                            style: AppTheme.h2Style.copyWith(
                                color: LightColor.text3,
                                fontWeight: FontWeight.w500,
                                letterSpacing: 1),
                          ),
                          Text(
                            "Today you have no tasks",
                            style: AppTheme.h6Style.copyWith(
                              color: LightColor.text3,
                            ),
                          ),
                        ],
                      ),
                      Container(
                        height:50.h,
                        width: 50.w,
                        child: ClipOval(
                          clipper:Avatar() ,
                          child:Image.asset('assets/images/w.png' ,fit: BoxFit.cover, ) ,
                        ),
                      )

                    ],
                  ),
                ),
              ),
            ],
          ),
        )),
  );
}

class Avatar extends CustomClipper<Rect> {
  @override
  Rect getClip(Size size) {
    return Rect.fromCircle(
      center: Offset(size.width / 2, size.height / 2),
      radius: min(size.width, size.height) / 2,
    );
  }

  @override
  bool shouldReclip(CustomClipper<Rect> oldClipper) {
    return false;
  }
}
