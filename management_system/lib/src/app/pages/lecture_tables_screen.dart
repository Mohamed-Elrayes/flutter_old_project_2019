import 'package:deltacms/src/app/pages/days_screen/friday_screen.dart';
import 'package:deltacms/src/helper/format_weekDay.dart';
import 'package:deltacms/src/widgets/for_lecture_table/inicators_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';

import '../../../theme_color.dart';
import 'days_screen/monday_screen.dart';
import 'days_screen/saturday_screen.dart';
import 'days_screen/sunday_screen.dart';
import 'days_screen/thursday_screen.dart';
import 'days_screen/tuesday_screen.dart';
import 'days_screen/wednesday_screen.dart';

class LectureTablesScreen extends StatefulWidget {
  @override
  _LectureTablesScreenState createState() => _LectureTablesScreenState();
}

class _LectureTablesScreenState extends State<LectureTablesScreen> {
//  static int dateConvert = convertDayToStratFromSaturday(5);
//  static int dateNow = dateConvert.clamp(0, 6);
//  static int dateNow = dateConvert.clamp(0, 6);

  PageController _pageController;
  String _isSelected;

//  List<String> _weekday = [...weekdays.getRange(0, 6)];
  List<String> _weekday = [...weekdays];

  int _currentPage = convertDayToStratFromSaturday(DateTime.now().weekday);

  @override
  void initState() {
    _pageController = PageController(initialPage: _currentPage);
  super.initState();
}

@override
void dispose() {
  _pageController.dispose();
  super.dispose();
}

  // This array for pageView => return all days screen
  final List<Widget> _daysScreenForPageView = [
    SaturdayScreen(),
    SundayScreen(),
    MondayScreen(),
    TuesdayScreen(),
    WednesdayScreen(),
    ThursdayScreen(),
    FridayScreen(),
  ];

  // The build method for all screen
  Widget _build(BuildContext context) {
    return Container(
      child: SafeArea(
        child: Column(
          children: <Widget>[
            Flexible( child: _buildTableHeader(context)),
            Expanded(child: _buildPages()),
          ],
        ),
      ),
    );
  }

  // Build Pages for Tables
  Container _buildPages() {
    return Container(
      color: Colors.white,
      child: PageView(
          controller: _pageController,
          onPageChanged: (position) {
//            print(position);

            // if page is move the title for day change to this day
            if (_pageController.keepScrollOffset) {
              setState(() {
                _currentPage = position;
                _isSelected = _weekday[_currentPage];
              });
            }
          },
          children: _daysScreenForPageView),
    );
  }

  Container _buildTableHeader(BuildContext context) {
    return Container(
      height: 160,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text('${DateFormat.yMMMMEEEEd().format(DateTime.now())}'),
          Text('لديك عدد 2 محاضرة'),
          SizedBox(
            height: 15,
          ),
          Container(width: 100, child: _dropdownButton()),
          Indicator(
            currentPage: _currentPage,
          )
        ],
      ),
    );
  }

  DropdownButton<String> _dropdownButton() {
    return DropdownButton<String>(
      hint: Center(
        child: Text('اليوم'),
      ),
      value: _isSelected,
      icon: Icon(Icons.keyboard_arrow_down),
      iconSize: 18,
      elevation: 16,
      isExpanded: true,
//      style: TextStyle(color: Colors.deepPurple),
      underline: SizedBox(
        height: 0,
      ),
//      underline: Container(
//        height: 2,
//        color: Colors.deepPurpleAccent,
//      ),
      items: _weekday.map((String day) {
//              _selectedPage  = weekdays.indexOf(days);
        return DropdownMenuItem<String>(
          value: day,
          child: _daysItems(day),
          onTap: () {
            setState(
              () {
                // update [ _currentPage ] to give the index for the day choose from box to move the pageView to the same page
                _currentPage = _weekday.indexWhere((aDay) => day == aDay);

                // go to the page that day choose from boxDays  [ _currentPage ]
                _pageController.jumpToPage(_currentPage);
              },
            );
          },
        );
      }).toList(),
      onChanged: (String newValue) {
        setState(() {
          _isSelected = newValue;
        });
      },
    );
  }

  Widget _daysItems(String day) {
    return Center(
      child: Text(
        day,
        textAlign: TextAlign.center,
        style: textStyle.copyWith(
          color: _isSelected == day ? Colors.red : null,
        ),
      ),
    );
  }

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: _build(context));
  }
}

