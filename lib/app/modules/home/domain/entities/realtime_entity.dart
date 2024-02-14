import '../../../../shared/shared.dart';

class RealtimeEntity {
  int temperature;
  String name;
  double lat;
  double lon;
  int weatherCode;
  String time;

  RealtimeEntity({
    this.temperature = 0,
    this.name = AppStrings.unknow,
    this.lat = -1.0,
    this.lon = -1.0,
    this.weatherCode = 1000,
    this.time = '',
  });

  String toName() {
    return name.split(',')[0];
  }
}
