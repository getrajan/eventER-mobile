import 'package:intl/intl.dart';

String myTimeFormat(DateTime time) {
  DateFormat timeFormat = DateFormat('HH:mm a');
  String newTime = timeFormat.format(time);
  return newTime;
}

String myDateFormat(DateTime date) {
  String newDate = DateFormat.yMMMMd().format(date);
  return newDate;
}
