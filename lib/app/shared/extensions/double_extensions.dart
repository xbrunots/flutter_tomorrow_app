extension DoubleExtensions on double {
  String get toFriendlyTemperature => '$this°C';
  String get rainPercents => '${((this * 100) < 100 ? (this * 100): 100).toString().split('.')[0]}%';
}
