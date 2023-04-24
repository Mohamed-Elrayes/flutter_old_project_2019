import 'package:flutter/material.dart';
import 'apptheme.dart';
import 'package:bmi_calculator/screens/inputpage.dart';

void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: apptheme,
      home: InputPage(),
    );
  }
}
