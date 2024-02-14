import '../../domain/entities/entities.dart';
import 'dtos.dart';

extension WeatherForecastIntradayDto on WeatherIntraDayEntity {
  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'time': time,
      'values': forecast,
    };
  }

  static WeatherIntraDayEntity fromMap(Map<String, dynamic> map) {
    return WeatherIntraDayEntity(
      time: map['time'],
      forecast: map['values'] != null ? IntraDayDto.fromMap(map['values']) : null,
    );
  }
}
