import 'package:ecommerce_flutter/model/auth_mode.dart';
import 'package:ecommerce_flutter/widgets/shape_bg.dart';
import 'package:ecommerce_flutter/widgets/appbar_custom.dart';
import 'package:ecommerce_flutter/widgets/title_auth_custom.dart';
import 'package:flutter/material.dart';

import '../../utilities.dart';

class SigninScreen extends StatelessWidget {
  static const routeName = '/Signin_screen';

  final GlobalKey<FormState> _formKey = GlobalKey();

  final TextEditingController _passwordController = TextEditingController();
  final FocusNode focusPassword = FocusNode();

  final Map<String, String> _authData = {
    'email': '',
    'pasword': '',
  };

  _submit() {
    //code for button
  }

  @override
  Widget build(BuildContext context) {
    final sizeScreen = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: <Widget>[
            ShapeBg(heightShape: HeightShape.Quarter),
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  AppBarCustom(sizeScreen: sizeScreen ),
                  TitleAuthCustom( authMode: AuthMode.Signin ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Center(
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          elevation: 8.0,
                          child: Container(
                            width: sizeScreen.width * .75,
                            padding: const EdgeInsets.only(
                                top: 20.0, left: 20.0, right: 20.0, bottom: 10),
                            child: Form(
                              key: _formKey,
                              child: inputField(context),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Column inputField(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        TextFormField(
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.grey.withOpacity(0.16),
            border: InputBorder.none,
            focusColor: Colors.deepOrangeAccent,
            hintText: 'E-Mail',
            prefixIcon: Icon(Icons.email),
          ),
          validator: (val) {
            if (val.isEmpty || !val.contains('@')) {
              return 'Invalid email!';
            }
          },
          onSaved: (value) {
            _authData['email'] = value;
          },
          keyboardType: TextInputType.emailAddress,
          textInputAction: TextInputAction.next,
          onFieldSubmitted: (_) {
            FocusScope.of(context).requestFocus(focusPassword);
          },
        ),
        SizedBox(height: 10),
        TextFormField(
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.grey.withOpacity(0.16),
              border: InputBorder.none,
              hintText: 'Password',
              prefixIcon: Icon(Icons.lock),
            ),
            obscureText: true,
            controller: _passwordController,
            validator: (val) {
              if (val.isEmpty || val.length < 5) {
                return 'Password is too short!.';
              }
            },
            keyboardType: TextInputType.visiblePassword,
            textInputAction: TextInputAction.done,
            focusNode: focusPassword,
            ),
        SizedBox(height: 10),
        RaisedButton(
          padding: EdgeInsets.symmetric(horizontal: 110),
          child: Text(
            'Sign up',
            style: TextStyle(color: Colors.white),
          ),
          onPressed: () => _submit(),
          color: colorAuth,
          shape: RoundedRectangleBorder(
            side: BorderSide(
              color: colorAuth,
            ),
          ),
        ),
        FlatButton(
          onPressed: () {},
          child: Text(
            'forgot Password',
            style: TextStyle(color: colorAuth),
          ),
        ),
      ],
    );
  }
}
