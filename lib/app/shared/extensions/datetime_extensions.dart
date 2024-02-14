import 'package:intl/intl.dart';

extension DateTimeExtensions on DateTime {
  String toFormattedString(String format, {String suffix = ''}) {
    try {
      DateFormat inputFormat = DateFormat(format, 'pt_Br');
      return inputFormat.format(this) + suffix;
    } catch (_) {
      return this.toString();
    }
  }

  String toHourMinOnly() {
    try {
      return toFormattedString('EEEE, HH:mm');
    } catch (_) {
      return this.toString();
    }
  }

  bool hourIsNow() {
    final nowDateTime = DateTime.now();
    final receiveDateTime = this;
    return nowDateTime.hour == receiveDateTime.hour &&
        nowDateTime.day == receiveDateTime.day &&
        nowDateTime.month == receiveDateTime.month &&
        nowDateTime.year == receiveDateTime.year;
  }

  bool isToday() {
    final nowDateTime = DateTime.now();
    final receiveDateTime = this;
    return nowDateTime.day == receiveDateTime.day &&
        nowDateTime.month == receiveDateTime.month &&
        nowDateTime.year == receiveDateTime.year;
  }
}
