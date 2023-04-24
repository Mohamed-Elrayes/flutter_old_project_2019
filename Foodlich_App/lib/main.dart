import 'package:eco/util/index_util.dart';
import 'package:eco/views/screens/index_screens.dart';
import 'package:eco/views/widgets/safe_area_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'views/screens/auth_screens/sign_in_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        title: 'Flutter Demo',
        theme: AppTheme().light,
        home: SafeAreaWidget(child:  HomeScreen()));
  }
}
