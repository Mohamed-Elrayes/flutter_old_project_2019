import 'package:ToDoApp/theme/app_theme.dart';
import 'package:ToDoApp/theme/light_color.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TaskWidget extends StatelessWidget {
  final bool taskIsDone, isNotifications;
  final Color colorSideContainer;
  final String taskName;
  final Function checkBoxButton, bellButton;

  TaskWidget({
    this.taskIsDone = false,
    this.isNotifications = false,
    @required this.colorSideContainer,
    @required this.taskName,
    @required this.checkBoxButton,
    @required this.bellButton,
  });

  final double _round = 5;
  final double _height = 60;
//  void _onTap() {
//    setState(() {
//      _isDone = !_isDone;
//    });
//  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          padding: EdgeInsets.symmetric(horizontal: 15),
          height: _height,
          decoration: BoxDecoration(
            color: LightColor.text3,
            borderRadius: BorderRadius.circular(_round),
            boxShadow: [
              BoxShadow(
                color: Color.fromRGBO(0, 0, 0, 0.05),
                offset: Offset(0.0, 4.0), //(x,y)
                blurRadius: 4.0,
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              _RoundedCheckBox(
                isSelected: taskIsDone,
                onTap: checkBoxButton,
              ),
              SizedBox(
                width: 10.w,
              ),
              Text(
                DateFormat('hh:mm aaa').format(DateTime.now()),
                style:
                    AppTheme.h6Style.copyWith(color: LightColor.subTitleText),
              ),
              SizedBox(
                width: 10.w,
              ),
              Text(
                (taskName[0].toUpperCase() + taskName.substring(1)),
                style: AppTheme.h4Style.copyWith(
                    fontWeight: FontWeight.w600,
                    color: !taskIsDone
                        ? LightColor.titleText1
                        : LightColor.unselectIcon1,
                    decoration: taskIsDone
                        ? TextDecoration.lineThrough
                        : TextDecoration.none),
              ),
              Spacer(),
              IconButton(
                  constraints: BoxConstraints.tightForFinite(),
                  padding: EdgeInsets.all(0),
                  iconSize: 20,
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  icon: Icon(
                    Icons.notifications,
                  ),
                  color: isNotifications
                      ? LightColor.colorPersonal
                      : LightColor.unselectIcon1,
                  onPressed: bellButton)
            ],
          ),
        ),
        Container(
          width: 6,
          height: _height,
          decoration: BoxDecoration(
              color: colorSideContainer,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(_round),
                topLeft: Radius.circular(_round),
              )),
        ),
      ],
    );
  }
}

class _RoundedCheckBox extends StatelessWidget {
  final Function onTap;
  final bool isSelected;
  final double size;

  _RoundedCheckBox({
    Key key,
    @required this.onTap,
    @required this.isSelected,
    this.size = 22,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 6),
      child: InkWell(
        borderRadius: BorderRadius.circular(50),
        onTap: onTap,
        child: Container(
          width: size,
          height: size,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
                color:
                    isSelected ? Colors.transparent : LightColor.unSelectIcon2,
                width: 1.4.w),
            color: isSelected ? LightColor.colorTrue : Colors.transparent,
          ),
          child: isSelected
              ? Icon(Icons.check, size: 18.0, color: LightColor.text3)
              : null,
        ),
      ),
    );
  }
}
