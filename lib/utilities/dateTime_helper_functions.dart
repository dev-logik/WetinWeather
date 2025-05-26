import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

String formatTime(TimeOfDay currentTime) {
  String hour = currentTime.hour.toString().padLeft(2, '0');
  String min = currentTime.minute.toString().padLeft(2, '0');
  String sec = currentTime.minute.toString().padLeft(2, '0');
  return '${hour} : ${min} : ${sec}';
}

String formatDate(DateTime currentDate) {
  final formatter = DateFormat('EEE, dd-MM-yyyy');
  return formatter.format(currentDate);
}
