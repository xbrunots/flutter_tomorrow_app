import 'package:intl/intl.dart';

extension StringsExtensions on String {
  String getIconAssetByWeatherCode() {
    DateTime date = DateTime.now().toLocal();

    bool day = date.hour < 18 && date.hour > 5;

    return day ? 'assets/images/icons/ic_${this}0.png' : 'assets/images/icons/ic_${this}1.png';
  }

  String getIconAssetDefault() {
    return 'assets/images/icons/ic_${this}0.png';
  }
}