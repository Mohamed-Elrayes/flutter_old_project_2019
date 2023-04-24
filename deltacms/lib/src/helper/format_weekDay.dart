import 'dart:convert';

const List<String> weekdays = const [
  'السبت',
  'الاحد',
  'الاثنين',
  'الثلاثاء',
  'الاربعاء',
  'الخميس',
  'الجمعه',
];

int convertDayToStratFromSaturday(int day){
  switch (day) {
    case  1 :{return 2 ; }
    break;
    case  2 :{return 3 ; }
    break;
    case  3 :{return 4 ; }
    break;
    case  4 :{return 5 ; }
    break;
    case  5 :{return 6 ; }
    break;
    case  6 :{return 0 ; }
    break;
    case  7 :{return 1 ; }
    break;
    default: { print("Invalid choice"); }
    break;
  }
}

String dateFormatter(int day) {
  dynamic dayData = '{'
      ' "1" : "${weekdays[0]}",'
      ' "2" : "${weekdays[1]}",'
      ' "3" : "${weekdays[2]}",'
      ' "4" : "${weekdays[3]}",'
      ' "5" : "${weekdays[4]}",'
      ' "6" : "${weekdays[5]}",'
      ' "7" : "${weekdays[6]}'
      ' }';

  if (day == null) {
    return 'Should Enter Number Day';
  } else if (day > 8) {
    return 'The WeekDay max 7 day! not $day .';
  } else if (day <= 0) {
    return 'day can not assign to this $day ';
  } else {
    return json.decode(dayData)['$day'];
  }
}

//  dynamic dayData ='{ "1" : "Mon", "2" : "Tue", "3" : "Wed", "4" : "Thur", "5" : "Fri", "6" : "Sat", "7" : "Sun" }';
//  return json.decode(dayData)['${date.weekday}'];

//dynamic dayData ='{ "1" : "${dayArabic[0].day}", "2" : "${dayArabic[1].day}", "3" : "${dayArabic[2].day}", "4" : "${dayArabic[3].day}", "5" : "${dayArabic[4].day}", "6" : "${dayArabic[5].day}", "7" : "${dayArabic[6].day}" }';
//class WeekDaysArabicWithId{
//  final String id;
//  final String day;
//
// const  WeekDaysArabicWithId({this.id, this.day});
//
//}
// List<WeekDaysArabicWithId> dayArabic =  [
//  WeekDaysArabicWithId(id:"01Sat" , day: 'السبـت' ),
//  WeekDaysArabicWithId(id:"02Sun" , day: 'الاحـــد' ),
//  WeekDaysArabicWithId(id:"03Mon" , day: 'الاثنيـن' ),
//  WeekDaysArabicWithId(id:"04Tue" , day: 'الثلاثاء' ),
//  WeekDaysArabicWithId(id:"05Wed" , day: 'الاربعاء' ),
//  WeekDaysArabicWithId(id:"06Thur" , day: 'الخميس' ),
//  WeekDaysArabicWithId(id:"07Fri" , day: 'الجمعه' ),
//
//];
