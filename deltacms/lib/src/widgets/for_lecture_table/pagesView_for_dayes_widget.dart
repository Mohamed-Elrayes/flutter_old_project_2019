//import 'package:deltacms/src/app/pages/days_screen/saturday_screen.dart';
//import 'package:deltacms/src/app/pages/days_screen/sunday_screen.dart';
//import 'package:flutter/material.dart';
//
//class PagesViewForDays extends StatefulWidget {
//  @override
//  _PagesViewForDaysState createState() => _PagesViewForDaysState();
//}
//
//class _PagesViewForDaysState extends State<PagesViewForDays> {
//  PageController _pageController;
//  int _currentPage  ;
//
//  @override
//  void initState() {
//    _pageController = PageController();
//    super.initState();
//  }
//
//  @override
//  void dispose() {
//    _pageController.dispose();
//    super.dispose();
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    return Container(
//      color: Colors.white,
//      child: PageView(
//        controller: _pageController,
//        onPageChanged:(position){
//          setState(() {
//            _currentPage =position;
////            print(_currentPage);
//          });
//
//        },
//        children: <Widget>[
//          SaturdayScreen(),
//          SundayScreen(),
//        ],
//      ),
//    );
//  }
//}
//
////return Container(
////color: Colors.white,
////child: PageView(
////controller: _pageController,
////children: listSection.map((e) {
////return Container(
////child: LectureDetail(e.id),
////);
////}).toList()),
////);
