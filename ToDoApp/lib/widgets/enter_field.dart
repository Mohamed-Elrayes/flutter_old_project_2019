import 'package:ToDoApp/theme/light_color.dart';
import 'package:flutter/material.dart';


class EnterField extends StatelessWidget {

  final String hint;
  final bool secure;
  final TextEditingController controller;
  final Function  validator;
  
  const EnterField(this.hint,{this.secure = false,this.controller , this.validator }) ;

  @override
  Widget build(BuildContext context) {
    return Container(
          padding:EdgeInsets.symmetric(vertical: 12) ,
          child: TextFormField(
            validator: validator,
        controller: controller,
        obscureText: secure,
        keyboardType: TextInputType.emailAddress,
        style: TextStyle(
          fontStyle: FontStyle.normal,
          fontWeight: FontWeight.normal,
        ),
        decoration: InputDecoration(
          hintText: hint,
          border: UnderlineInputBorder(),
          disabledBorder:
              UnderlineInputBorder(borderSide: BorderSide(color: LightColor.text1)),
          focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: LightColor.text2) , ),
          contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
        ),
        
      ),
    );
  }


}

