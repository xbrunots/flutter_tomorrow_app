import '../../domain/entities/entities.dart';
import 'dtos.dart';

extension WeatherForecastWeekDto on WeatherWeekEntity {
  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'time': time,
      'values': forecast,
    };
  }

  static WeatherWeekEntity fromMap(Map<String, dynamic> map) {
    return WeatherWeekEntity(
      time: map['time'],
      forecast: map['values'] != null ? WeekDto.fromMap(map['values']) : null,
    );
  }
}
