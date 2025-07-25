import 'package:intl/intl.dart';

String formatTime(DateTime currentTime) {
  String hour = currentTime.hour.toString().padLeft(2, '0');
  String min = currentTime.minute.toString().padLeft(2, '0');
  String sec = currentTime.second.toString().padLeft(2, '0');
  return '${hour} : ${min} : ${sec}';
}

String formatDate(DateTime currentDate) {
  final formatter = DateFormat('MMMM, d y', 'en_US');
  return formatter.format(currentDate);
}

String formatHourlyTime(DateTime timeStamp) {
  final formatter = DateFormat('h:mm a', 'en_US');
  return formatter.format(timeStamp);
}

bool isThisHour(DateTime dateTime) {
  final now = DateTime.now();
  return now.hour == dateTime.hour;
}

int isThisDay(DateTime dateTime) {
  final now = DateTime.now();
  if (dateTime.hour > 6 && dateTime.hour < 18) {
    return 1;
  }
  return 0;
}
