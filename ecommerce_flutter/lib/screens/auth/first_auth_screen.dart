import '../../model/auth_mode.dart';
import '../../screens/auth/signin_screen.dart';
import '../../screens/auth/signup_screen.dart';
import '../../screens/homepage.dart';
import '../../utilities.dart';
import '../../widgets/logo_app.dart';
import '../../widgets/shape_bg.dart';
import 'package:flutter/material.dart';


class FirstAuthScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final sizeScreen = MediaQuery.of(context).size;

    Widget widgetScreen (){
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          LogoApp(30),
          sizeBox(20.0),
          Center(
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              elevation: 8.0,
              child: Container(
                width: sizeScreen.width * .75,
                height: 320,
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Text(
                      'Welcome to KoKo-Shop.',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    sizeBox(6.0),
                    Text(
                      'Discover Amazing Thing Near Around You.',
                      textAlign: TextAlign.center,
                    ),
                    sizeBox(30.0),
                    RaisedButton(
                      padding: EdgeInsets.symmetric(horizontal: 110),
                      child: Text(
                        'Sign In',
                        style: TextStyle(color: Colors.white),
                      ),
                      onPressed: () => _submit(AuthMode.Signin, context),
                      color: colorAuth,
                      shape: RoundedRectangleBorder(
                        side: BorderSide(
                          color: colorAuth,
                        ),
                      ),
                    ),
                    RaisedButton(
                      padding: EdgeInsets.symmetric(horizontal: 108),
                      child: Text(
                        'Sign Up',
                        style: TextStyle(color: colorAuth),
                      ),
                      onPressed: () => _submit(AuthMode.Signup, context),
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                        side: BorderSide(
                          color: colorAuth,
                        ),
                      ),
                    ),
                    sizeBox(10.0),
                    Stack(
                      alignment: Alignment.center,
                      children: <Widget>[
                        Divider(
                          thickness: 1.5,
                        ),
                        Container(
                          color: Colors.white,
                          child: Text(
                            '   Or connect useing   ',
                          ),
                        ),
                      ],
                    ),
                    sizeBox(25.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(
                            height: 40,
                            width: 40,
                            color: Colors.blue,
                            margin: EdgeInsets.symmetric(horizontal: 10)),
                        Container(
                            height: 40,
                            width: 40,
                            color: Colors.red,
                            margin: EdgeInsets.symmetric(horizontal: 10)),
                        Container(
                            height: 40,
                            width: 40,
                            color: Colors.brown,
                            margin: EdgeInsets.symmetric(horizontal: 10)),
                        Container(
                            height: 40,
                            width: 40,
                            color: Colors.blueGrey,
                            margin: EdgeInsets.symmetric(horizontal: 10)),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
          sizeBox(15.0),
          FlatButton(
            onPressed: () {
              Navigator.of(context).pushNamed(Homepage.rootName);
            },
            child: Text(
              'SKIP',
              style: TextStyle(fontSize: 30, color: Colors.grey),
            ),
          ),
        ],
      );
    }
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: <Widget>[
            ShapeBg(
              heightShape: HeightShape.Half,
            ),
            OrientationBuilder(builder: (ctx ,oriant)=>oriant ==Orientation.portrait ? widgetScreen() : SingleChildScrollView(padding: EdgeInsets.only(top: 35),child: widgetScreen() ,),)
          ],
        ),
      ),
    );
 

  
  }
  
  SizedBox sizeBox(height) => SizedBox(
        height: height,
      );

  _submit(authMode, ctx) {
    if (authMode == AuthMode.Signin) {
      return Navigator.of(ctx).pushNamed(SigninScreen.routeName);
    }
    if (authMode == AuthMode.Signup) {
      return Navigator.of(ctx).pushNamed(SignupScreen.routeName);
    }
  }


}
