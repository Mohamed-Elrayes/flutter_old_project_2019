import 'package:deltacms/src/models/lecture_model.dart';

import '../format_weekDay.dart';

List<LectureItem> dummyDataForTables = [
  LectureItem(
    id: "${weekdays[0]}",
    place: 'مدرج 6 أ',
    lectureName: 'نظم معلومات محاسبية',
    doctorName: 'د : وليد حمدي',
    kindLecture: KindLecture.Discourse,
    day: dateFormatter(1),
  ),
  LectureItem(
    id: "${weekdays[2]}",
    place: 'مدرج 6 أ',
    lectureName: 'نظم معلومات محاسبية',
    doctorName: 'د : وليد حمدي',
    kindLecture: KindLecture.Discourse,
    day: dateFormatter(2),
  ),
  LectureItem(
    id: "2 ${weekdays[3]}",
    place: 'مدرج 6 ب',
    lectureName: 'دراسات محاسبيه بالانجليزي',
    doctorName: 'د : زكريا عبده',
    kindLecture: KindLecture.Discourse,
    day: dateFormatter(3),
  ),
  LectureItem(
    id: "${weekdays[0]}",
    place: 'مدرج 6 أ',
    lectureName: 'نظم معلومات محاسبية',
    doctorName: 'د : وليد حمدي',
    kindLecture: KindLecture.Discourse,
    day: dateFormatter(1),
  ),
  LectureItem(
    id: "${weekdays[2]}",
    place: 'مدرج 6 أ',
    lectureName: 'نظم معلومات محاسبية',
    doctorName: 'د : وليد حمدي',
    kindLecture: KindLecture.Discourse,
    day: dateFormatter(2),
  ),
  LectureItem(
    id: "2 ${weekdays[3]}",
    place: 'مدرج 6 ب',
    lectureName: 'دراسات محاسبيه بالانجليزي',
    doctorName: 'د : زكريا عبده',
    kindLecture: KindLecture.Discourse,
    day: dateFormatter(3),
  ),
  LectureItem(
    id: "${weekdays[0]}",
    place: 'مدرج 6 أ',
    lectureName: 'نظم معلومات محاسبية',
    doctorName: 'د : وليد حمدي',
    kindLecture: KindLecture.Discourse,
    day: dateFormatter(1),
  ),
];
