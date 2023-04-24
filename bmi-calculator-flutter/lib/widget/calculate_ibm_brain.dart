import 'dart:math';

import 'package:flutter/material.dart';

class CalculatorBrain {
  final int height;
  final int weight;
  double _bmi;
  CalculatorBrain({@required this.height, @required this.weight});

  String calculateBMI() {
    _bmi = weight / pow(height / 100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String getResult() {
    if (_bmi >= 25) {
      return 'OverWeight';
    } else if (_bmi >= 18.5) {
      return 'Normal';
    } else {
      return 'UnderWeight';
    }
  }

  String getInterpretation() {
    if (_bmi >= 25) {
      return 'بص ياسطا مش عارف اجبهالك ازاى بس انتا وزنك زايد فشخ ';
    } else if (_bmi >= 18.5) {
      return 'لا يامعلم وزنك فله اثبت على كده يا حب';
    } else {
      return 'فى ايه يلا ؟ روح اطفح تتك القرف وانتا مسلوع كده ';
    }
  }
}
