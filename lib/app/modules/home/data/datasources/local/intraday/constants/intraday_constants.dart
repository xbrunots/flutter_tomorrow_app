import 'package:suamusica_weather/app/shared/shared.dart';

class IntraDayConstants {
  static String forecastIntraDayKey(String location) {
    final DateTime today = DateTime.now();
    return 'intraday${today.toFormattedString('yyyyMMdd')}${location.replaceAll(RegExp('[^A-Za-z0-9]'), '')}';
  }
}


