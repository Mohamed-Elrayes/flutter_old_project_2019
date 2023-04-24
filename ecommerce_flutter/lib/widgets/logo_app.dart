import 'package:flutter/material.dart';

class LogoApp extends StatelessWidget {
  final double size ;

  LogoApp(this.size);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50+size,
      width: 50+size,
      decoration: BoxDecoration(color: Colors.white,
        borderRadius: BorderRadius.circular(10+size/2)
      ),
      child: Icon(Icons.arrow_drop_down_circle , size: 35+size,color: Colors.deepPurpleAccent,),
    );
  }
}
