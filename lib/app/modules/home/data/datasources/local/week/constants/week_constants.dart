import 'package:suamusica_weather/app/shared/shared.dart';

class WeekConstants {
  static String weekIntraDayKey(String location) {
    final DateTime today = DateTime.now();
    return 'week${today.toFormattedString('yyyyMMdd')}${location.replaceAll(RegExp('[^A-Za-z0-9]'), '')}';
  }
}


