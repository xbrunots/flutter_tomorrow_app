import 'package:suamusica_weather/app/shared/constants/app_strings.dart';

import '../../domain/entities/entities.dart';

extension RealtimeDto on RealtimeEntity {
  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'temperature': temperature,
      'lat': lat,
      'lon': lon,
      'name': name,
      'weatherCode': weatherCode,
      'time': time,
    };
  }

  static RealtimeEntity fromMap(Map<String, dynamic> map) {
    return RealtimeEntity(
      temperature: (double.tryParse(map['temperature'].toString()) ?? .0).round(),
      lat: double.tryParse(map['lat'].toString()) ?? .0,
      lon: double.tryParse(map['lon'].toString()) ?? .0,
      name: map['name'] ?? AppStrings.unknow,
      weatherCode: map['weatherCode'] ?? 1000,
      time: map['time'] ?? '',
    );
  }
}
