import 'package:bmi_calculator/widget/buttom.dart';
import 'package:bmi_calculator/widget/constractors.dart';
import 'package:bmi_calculator/widget/reusablecard.dart';
import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  Result({
    @required this.resultBMI,
    @required this.resultText,
    @required this.interpretation,
  });

  final String resultBMI;
  final String resultText;
  final String interpretation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CalCUlATOR'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Text(
            'Your Result',
            style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
          ),
          Expanded(
            flex: 5,
            child: ReusableCard(
              colour: KSliderColour,
              childCard: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Text(
                    resultText,
                    style: KResultTextStyle,
                  ),
                  Text(
                    resultBMI,
                    style: KBMITextStyle,
                  ),
                  Text(
                    interpretation,
                    style: KBodyTextStyle,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
          ButtomClick(
            text: 'RE-CALCULATE',
            onTap: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
