import 'package:flutter/material.dart';

enum KindLecture { Session, Discourse }

class LectureItem {
  final String id;
  final String lectureName;
  final String doctorName;
  final String place;
  final String day;
  final TimeOfDay startLecture;
  final TimeOfDay endLecture;

  final KindLecture kindLecture;

  LectureItem({
    this.id,
    this.lectureName,
    this.doctorName,
    this.place,
    this.startLecture,
    this.endLecture,
    this.kindLecture,
    this.day,
  });
}
