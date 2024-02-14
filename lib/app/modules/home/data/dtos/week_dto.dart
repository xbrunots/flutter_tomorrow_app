import '../../domain/entities/entities.dart';

extension WeekDto on WeekEntity {
  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'temperatureAvg': temperatureAvg,
      'temperatureMax': temperatureMax,
      'temperatureMin': temperatureMin,
      'weatherCodeMax': weatherCodeMax,
      'weatherCodeMin': weatherCodeMin,
      'rainIntensityAvg': rainIntensityAvg,
    };
  }

  static WeekEntity fromMap(Map<String, dynamic> map) {
    return WeekEntity(
      temperatureAvg: (double.tryParse(map['temperatureAvg'].toString()) ?? .0).round(),
      temperatureMax: (double.tryParse(map['temperatureMax'].toString()) ?? .0).round(),
      temperatureMin: (double.tryParse(map['temperatureMin'].toString()) ?? .0).round(),
      weatherCodeMin: map['weatherCodeMin'] ?? 1000,
      weatherCodeMax: map['weatherCodeMax'] ?? 1000,
      rainIntensityAvg: double.tryParse(map['rainIntensityAvg'].toString()) ?? .0,
    );
  }
}

