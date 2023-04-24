import 'file:///D:/Flutter-Project/ToDoApp/lib/helper/dumydata.dart';
import 'package:ToDoApp/theme/light_color.dart';
import 'package:ToDoApp/widgets/appBar.dart';
import 'package:ToDoApp/widgets/task_widget.dart';

import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  Widget _body(BuildContext context) {
    return ListView.builder(
        itemCount: dummyData.length,
        itemBuilder: (context, index) => Dismissible(
            direction: DismissDirection.endToStart,
            background: Container(color: Colors.blue),
            secondaryBackground: Container(
                alignment: Alignment.centerRight,
                child: Container(
                    height: 30,
                    width: 30,
                    margin: EdgeInsets.only(right: 15),
                    decoration: BoxDecoration(
                        color: LightColor.colorFalse.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(20)),
                    child: Icon(
                      Icons.delete_outline,
                      color: LightColor.colorFalse,
                    ))),
            key: Key(dummyData[index].taskId),
            child: Container(
              padding: EdgeInsets.only(top: 8 , bottom: 8 , left:13 , right: 13),
              child:_taskWidget() )));
  }

  Widget _taskWidget (){
    void _bellButton(){}
    void _checkBoxButton(){}
    return TaskWidget(
      bellButton:_bellButton ,
      checkBoxButton:_checkBoxButton ,
      taskName: 'moooo',
      colorSideContainer: Colors.red,
      isNotifications: false,
      taskIsDone: false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: LightColor.background,
      appBar: appBar(context),
      body: _body(context),
    );
  }
}
