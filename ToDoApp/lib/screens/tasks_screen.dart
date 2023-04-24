import 'package:ToDoApp/theme/light_color.dart';
import 'package:ToDoApp/widgets/appBar.dart';
import 'package:flutter/material.dart';

class TasksScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: LightColor.background,
      appBar: appBar(context),
      body: Container(),
    );
  }
}