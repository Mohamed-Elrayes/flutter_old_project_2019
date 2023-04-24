
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'src/app/pages/lecture_tables_screen.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        textTheme: GoogleFonts.cairoTextTheme(
          Theme.of(context).textTheme,
        ),
      ),
      home: LectureTablesScreen()
    );
  }
}
