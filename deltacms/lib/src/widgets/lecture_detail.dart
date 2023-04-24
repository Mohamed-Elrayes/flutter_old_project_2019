import 'package:flutter/material.dart';

class LectureDetail extends StatelessWidget {
  final String id;

  LectureDetail(this.id);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(id),
    );
  }
}