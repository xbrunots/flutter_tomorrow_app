import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:suamusica_weather/app/modules/home/data/repositories/repositories.dart';
import 'package:suamusica_weather/app/modules/home/domain/entities/entities.dart';
import 'package:suamusica_weather/app/modules/home/domain/usecases/usecases.dart';
import 'package:suamusica_weather/app/shared/domain/errors/errors.dart';
import 'package:suamusica_weather/app/shared/http_client/core/either/either.dart';

class ForecastIntraDayRepositoryImplMock extends Mock implements ForecastIntraDayRepositoryImpl {}

void main() {
  final repository = ForecastIntraDayRepositoryImplMock();
  final useCase = ForecastIntraDayUseCaseImpl(repository);

  final String locationMock = 'Sorocaba';

  final List<WeatherIntraDayEntity> listMock = [
    WeatherIntraDayEntity(time: "2024-02-14T15:53:00Z", forecast: IntraDayEntity()),
    WeatherIntraDayEntity(time: "2024-02-14T15:53:00Z", forecast: IntraDayEntity()),
    WeatherIntraDayEntity(time: "2024-02-14T15:53:00Z", forecast: IntraDayEntity()),
    WeatherIntraDayEntity(time: "2024-02-14T15:53:00Z", forecast: IntraDayEntity()),
    WeatherIntraDayEntity(time: "2024-02-14T15:53:00Z", forecast: IntraDayEntity()),
    WeatherIntraDayEntity(time: "2024-02-14T15:53:00Z", forecast: IntraDayEntity()),
    WeatherIntraDayEntity(time: "2024-02-14T15:53:00Z", forecast: IntraDayEntity()),
    WeatherIntraDayEntity(time: "2024-02-14T15:53:00Z", forecast: IntraDayEntity()),
    WeatherIntraDayEntity(time: "2024-02-14T15:53:00Z", forecast: IntraDayEntity()),
    WeatherIntraDayEntity(time: "2024-02-14T15:53:00Z", forecast: IntraDayEntity()),
  ];

  group('Success when:', () {
    test('', () {
      when(() => repository.call(location: locationMock)).thenAnswer(
        (_) async => Success(listMock),
      );

      expect(useCase.call(location: locationMock), completion(isA<Success>()));
    });
  });

  group('Fails when:', () {
    test('', () {
      when(() => repository.call(location: locationMock)).thenAnswer(
        (_) async => Failure(AppError()),
      );

      expect(useCase.call(location: locationMock), completion(isA<Failure>()));
    });
  });
}
