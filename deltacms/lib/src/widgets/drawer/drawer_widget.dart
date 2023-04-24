import 'package:deltacms/src/app/pages/absence_screen.dart';
import 'package:deltacms/src/app/pages/money_screen.dart';
import 'package:deltacms/src/app/pages/personal_data_screen.dart';


import 'package:deltacms/src/app/pages/study_results_screen.dart';
import 'package:deltacms/src/app/pages/lecture_tables_screen.dart';
import 'package:flutter/material.dart';

import '../../../theme_color.dart';
import 'tile_description_widget.dart';

class DrawerWidget extends StatelessWidget {



  @override
  Widget build(BuildContext context) {
     List<Widget> allListTile = <Widget>[
      UserAccountsDrawerHeader(
        decoration: BoxDecoration(color: mainColor),
        currentAccountPicture: CircleAvatar(
          child: FlutterLogo(),
        ),
        accountName: Text('Mohamed Salah'),
        accountEmail: Text('start4tec2@gmail.com'),

      ),
      TileDescriptionWidget(
        title: 'البيانات الشخصية',
        iconData: Icons.perm_contact_calendar,
        onTapListTile: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>PersonalDataScreen() ));
        },
      ),
      TileDescriptionWidget(
        title: 'النتائج الدراسية',
        iconData: Icons.assessment,
        onTapListTile: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=>StudyResultsScreen()));
        },
      ),
      TileDescriptionWidget(
        title: 'الجداول الدراسية',
        iconData: Icons.date_range,
        onTapListTile: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=>LectureTablesScreen()));
        },
      ),
      TileDescriptionWidget(
        title: 'مستحقات المالية',
        iconData: Icons.local_atm,
        onTapListTile: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=>MoneyScreen()));
        },
      ),
      TileDescriptionWidget(
        title: 'الغياب',
        iconData: Icons.assignment_turned_in,
        onTapListTile: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=>AbsenceScreen()));
        },
      ),
    ];
    return Drawer(
      elevation: 6,
      child: ListView(children: allListTile),
    );
  }
}
