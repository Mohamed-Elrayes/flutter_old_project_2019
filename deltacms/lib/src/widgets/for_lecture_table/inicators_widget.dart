import 'package:deltacms/src/helper/format_weekDay.dart';
import 'package:flutter/material.dart';

class Indicator extends StatelessWidget {
  final int currentPage;


  Indicator({this.currentPage});

  @override
  Widget build(BuildContext context) {
    return Row(
      children:_pageIndicators()
    );
  }

  List<Widget> _pageIndicators() {
    List<Widget> _widgets = [];
    for (int i = 0; i < weekdays.length; i++) {
      _widgets.add(
        _shapeIndicator(
          currentPage == i ? Colors.amber : Colors.grey.withOpacity(0.4),
          i == weekdays.length - 1 ? 0 : 12,
        ),
      );
    }
    return _widgets;
  }

  Widget _shapeIndicator(Color color, double margin) {
    return Container(
      width: 19  ,
      height:3 ,
      margin: EdgeInsets.only(right: 2),
      decoration:
      BoxDecoration(color: color, borderRadius: BorderRadius.circular(25)),
    );
  }
}