import 'package:intl/intl.dart';
import 'package:flutter/material.dart';


class DateHelper {
  static String formatDate(DateTime date) {
    final DateFormat formatter = DateFormat('yyyy-MM-dd');
    return formatter.format(date);
  }

  static String formatTime(TimeOfDay time) {
    final now = DateTime.now();
    final dt = DateTime(now.year, now.month, now.day, time.hour, time.minute);
    final format = DateFormat.jm(); 
    return format.format(dt);
  }

}
