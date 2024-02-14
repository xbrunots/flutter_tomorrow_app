import '../../domain/entities/entities.dart';

extension IntraDayDto on IntraDayEntity {
  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'temperature': temperature,
      'weatherCode': weatherCode,
    };
  }

  static IntraDayEntity fromMap(Map<String, dynamic> map) {
    return IntraDayEntity(
      temperature: (double.tryParse(map['temperature'].toString()) ?? .0).round(),
      weatherCode: map['weatherCode'] ?? 1000,
    );
  }
}
