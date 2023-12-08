import 'package:intl/intl.dart';

String getReadableDate(DateTime date) {
  String month = DateFormat('MMMM').format(date);
  return month.substring(0, 3) + ' ' + date.day.toString() + ', ' + date.year.toString();
}