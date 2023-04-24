import 'package:ecommerce_flutter/model/auth_mode.dart';
import 'package:flutter/material.dart';

class TitleAuthCustom extends StatelessWidget {
  final AuthMode authMode;

  TitleAuthCustom({ @required this.authMode,});

  String _kindAuth(authMode) {
    if (authMode == AuthMode.Signup) {
      return 'Sign Up';
    }
    if (authMode == AuthMode.Signin) {
      return 'Sign In';
    }
  }
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(top: 20 ,bottom: 20,left: 13),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              _kindAuth(authMode),
              style: TextStyle(color: Colors.white, fontSize: 25),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'Sign Up to discover amazing things near around you',
              style: TextStyle(color: Colors.white, fontSize: 15),
            ),
          ],
        ),
      ),
    );
  }
}
