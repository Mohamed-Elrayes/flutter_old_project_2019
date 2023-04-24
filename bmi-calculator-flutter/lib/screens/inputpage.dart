import 'package:bmi_calculator/widget/calculate_ibm_brain.dart';
import 'package:bmi_calculator/widget/constractors.dart';
import 'package:bmi_calculator/widget/control_weight_age.dart';
import 'package:bmi_calculator/widget/reusablecard.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../strucchoicecard.dart';
import 'package:bmi_calculator/screens/resultbmi.dart';

Color maleCardColour = KInactiveColour;
Color femaleCardColour = KInactiveColour;
KindType gender;

enum KindType { male, female }

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  int height = 180;
  int age = 20;
  int weight = 63;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                    child: ReusableCard(
                        onPressed: () {
                          setState(() {
                            gender = KindType.male;
                          });
                        },
                        colour: gender == KindType.male
                            ? maleCardColour = KColourCard
                            : femaleCardColour = KInactiveColour,
                        childCard: Center(
                          child: StrucChoiceCard(
                              iconKind: FontAwesomeIcons.mars,
                              textKind: 'male'),
                        ))),
                Expanded(
                  child: ReusableCard(
                    onPressed: () {
                      setState(() {
                        gender = KindType.female;
                      });
                    },
                    colour: gender == KindType.female
                        ? femaleCardColour = KColourCard
                        : maleCardColour = KInactiveColour,
                    childCard: Center(
                      child: StrucChoiceCard(
                          iconKind: FontAwesomeIcons.neuter,
                          textKind: 'female'),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ReusableCard(
              colour: KColourCard,
              childCard: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'height'.toUpperCase(),
                    style: KTextStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: <Widget>[
                      Text(
                        '$height',
                        style: KBigNumberStyle,
                      ),
                      Text(
                        'cm',
                        style: TextStyle(
                          fontSize: 19,
                        ),
                      ),
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      thumbShape:
                          RoundSliderThumbShape(enabledThumbRadius: 15.0),
                      overlayShape:
                          RoundSliderOverlayShape(overlayRadius: 30.0),
                      thumbColor: Color(0XFFEB1555),
                      activeTrackColor: Colors.white,
                      overlayColor: Color(0X29EB1555),
                      inactiveTrackColor: Colors.white12,
                    ),
                    child: Slider(
                      min: 0.0,
                      max: 300.0,
                      value: height.toDouble(),
                      onChanged: (double newValue) {
                        setState(() {
                          height = newValue.round();
                        });
                      },
                    ),
                  )
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReusableCard(
                    colour: KColourCard,
                    childCard: new ControlAgeAndWeight(
                      labelName: 'weight',
                      numberKind: weight,
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    colour: KColourCard,
                    childCard: new ControlAgeAndWeight(
                      labelName: 'age',
                      numberKind: age,
                    ),
                  ),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              CalculatorBrain calc =
                  CalculatorBrain(height: height, weight: weight);

              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Result(
                    resultBMI: calc.calculateBMI(),
                    resultText: calc.getResult(),
                    interpretation: calc.getInterpretation(),
//
                  ),
                ),
              );
            },
            child: Container(
              color: KBottomContainerColour,
              margin: EdgeInsets.only(top: 10.0),
              width: double.infinity,
              height: KBottomContainerHeight,
              child: Center(
                child: Text(
                  'calculate your bmi'.toUpperCase(),
                  style: TextStyle(
                      letterSpacing: 5.0,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
