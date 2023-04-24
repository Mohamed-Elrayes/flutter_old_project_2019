import 'package:ToDoApp/enum/kind_task.dart';
import 'package:flutter/material.dart';

class Task {
  String taskId;
  String taskName;
  DateTime dateTime;
  KindTask kindTask;
  Color color;
  bool isDone = false;
  bool rememberMe = false;

  Task(
      {this.taskId,
      this.taskName,
      this.dateTime,
      this.isDone,
      this.rememberMe,
      this.kindTask,
      this.color});


  Task.fromJson(Map<String, dynamic> map) {
    this.taskId = map['taskId'];
    this.taskName = map['taskName'];
    this.dateTime = map['dataTime'];
    this.isDone = map['isDone'];
    this.rememberMe = map['rememberMe'];
    this.kindTask = map['kindTask'];
    this.color = map['color'];
  }

  Map<String, dynamic> tomap() {
    return {
      'taskId': this.taskId,
      'taskName': this.taskName,
      'dataTime': this.dateTime,
      'isDone': this.isDone,
      'rememberMe': this.rememberMe,
      'kindTask': this.kindTask,
      'color': this.color,
    };
  }
}
