import 'package:flutter/material.dart';

class WednesdayScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children:  List.generate(100, (index) => Text('data')),
      ),
    );
  }
}
