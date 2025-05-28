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
