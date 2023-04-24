import 'package:bmi_calculator/widget/constractors.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ControlAgeAndWeight extends StatefulWidget {
  final String labelName;

  int numberKind;

  ControlAgeAndWeight({@required this.labelName, @required this.numberKind});

  @override
  _ControlAgeAndWeightState createState() => _ControlAgeAndWeightState();
}

class _ControlAgeAndWeightState extends State<ControlAgeAndWeight> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          widget.labelName.toUpperCase(),
          style: KTextStyle,
        ),
        Text(
          "${widget.numberKind}".toUpperCase(),
          style: KBigNumberStyle,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            buildRawMaterialButton(
              icon: FontAwesomeIcons.minus,
              onPressed: () {
                setState(() {
                  widget.numberKind--;
                });
                if (widget.numberKind == -1) {
                  widget.numberKind = 0;
                }
              },
            ),
            SizedBox(
              width: 20.0,
            ),
            buildRawMaterialButton(
                icon: FontAwesomeIcons.plus,
                onPressed: () {
                  setState(() {
                    widget.numberKind++;
                  });
                }),
          ],
        )
      ],
    );
  }

  RawMaterialButton buildRawMaterialButton(
      {Function onPressed, IconData icon}) {
    return RawMaterialButton(
      fillColor: KSliderColour,
      constraints: BoxConstraints.tightFor(width: 55, height: 55),
      onPressed: onPressed,
      shape: CircleBorder(),
      child: Icon(
        icon,
        color: Colors.white,
      ),
    );
  }
}
