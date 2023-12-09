import 'package:intl/intl.dart';

String getReadableDate(DateTime date) {
  String month = DateFormat('MMMM').format(date);
  return month.substring(0, 3) + ' ' + date.day.toString() + ', ' + date.year.toString();
}

String getReadableTime(DateTime date) {
  String hour = DateFormat('hh').format(date);
  String minute = DateFormat('mm').format(date);
  String ampm = DateFormat('a').format(date);
  return hour + ':' + minute + ' ' + ampm;
}

String getDayWithDate(DateTime date){
  // return date in the format: 'Wednesday\nSeptember 15th'
  String day = DateFormat('EEEE').format(date);
  String month = DateFormat('MMMM').format(date);
  String dayOfMonth = DateFormat('d').format(date);
  String suffix = getDayOfMonthSuffix(int.parse(dayOfMonth));
  return day + '\n' + month + ' ' + dayOfMonth + suffix;
}

String getDayOfMonthSuffix(int dayNum) {
  if (!(dayNum >= 1 && dayNum <= 31)) {
    throw Exception('Invalid day of month');
  }
  if (dayNum >= 11 && dayNum <= 13) {
    return 'th';
  }
  switch (dayNum % 10) {
    case 1:
      return 'st';
    case 2:
      return 'nd';
    case 3:
      return 'rd';
    default:
      return 'th';
  }
}

String getTimeAgo(DateTime date) {
  DateTime now = DateTime.now();
  Duration difference = now.difference(date);
  if (difference.inDays > 0) {
    return difference.inDays.toString() + 'd ago';
  } else if (difference.inHours > 0) {
    return difference.inHours.toString() + 'h ago';
  } else if (difference.inMinutes > 0) {
    return difference.inMinutes.toString() + 'm ago';
  } else {
    return difference.inSeconds.toString() + 's ago';
  }
}