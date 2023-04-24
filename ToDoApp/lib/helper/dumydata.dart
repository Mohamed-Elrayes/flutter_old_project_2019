import 'package:ToDoApp/enum/kind_task.dart';
import 'package:ToDoApp/helper/tasksColor.dart';
import 'package:ToDoApp/model/task.dart';

List<Task> dummyData = [
  Task(
    taskId: '1',
    isDone: false,
    taskName: 'go to supermarket',
    kindTask: KindTask.Personal,
    rememberMe: false,
    dateTime: DateTime.now(),
    color: tasksColor['KindTask.Personal'],
  ),
  Task(
    taskId: '2',
    isDone: false,
    taskName: 'play with mpo',
    kindTask: KindTask.Meeting,
    rememberMe: true,
    dateTime: DateTime.now(),
    color: tasksColor['KindTask.Meeting'],
  ),
];
