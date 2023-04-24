import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../theme/light_color.dart';

class SubmitButton extends StatelessWidget {
  final String title;
  final Function onPressed;
  final Gradient myGradient;
  final double width;

  const SubmitButton(
      {Key key, this.title, this.onPressed, this.myGradient, this.width})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      splashColor: Colors.greenAccent,
      elevation: 7,
      onPressed: onPressed,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      padding: const EdgeInsets.all(0.0),
      child: Ink(
        decoration: BoxDecoration(
          gradient: myGradient,
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
        ),
        child: Container(
          width: width,
          constraints:
              BoxConstraints(minHeight: 55), // min sizes for Material buttons
          alignment: Alignment.center,
          child: Text(
            title,
            style: AppTheme.h5Style.copyWith(color: LightColor.text3),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
