extension IntExtensions on int {
  Duration get ms => Duration(milliseconds: this);

  Duration get sec => Duration(seconds: this);

  Duration get min => Duration(minutes: this);

  String get toFriendlyTemperature => '${this ?? 0}°C';

  String get toFriendlyTemperatureLite => '${this ?? 0}°';
}
