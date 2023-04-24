import 'package:ecommerce_flutter/screens/auth/first_auth_screen.dart';
import 'package:ecommerce_flutter/screens/auth/signin_screen.dart';
import 'package:ecommerce_flutter/screens/auth/signup_screen.dart';
import 'package:ecommerce_flutter/utilities.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'screens/homepage.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: colorAuth.withAlpha(120)
  ));
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: colorAuth
      ),
      home: FirstAuthScreen(),
      routes: {
        Homepage.rootName: (ctx) => Homepage(),
        SigninScreen.routeName: (ctx) => SigninScreen(),
        SignupScreen.routeName: (ctx) => SignupScreen(),
      },
    );
  }
}
