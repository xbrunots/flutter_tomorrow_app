import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:suamusica_weather/app/modules/home/data/repositories/repositories.dart';
import 'package:suamusica_weather/app/modules/home/domain/entities/entities.dart';
import 'package:suamusica_weather/app/modules/home/domain/usecases/usecases.dart';
import 'package:suamusica_weather/app/shared/domain/errors/errors.dart';
import 'package:suamusica_weather/app/shared/http_client/core/either/either.dart';

class ForecastRealtimeRepositoryImplMock extends Mock implements ForecastRealtimeRepositoryImpl {}

void main() {
  final repository = ForecastRealtimeRepositoryImplMock();
  final useCase = ForecastRealtimeUseCaseImpl(repository);

  final String locationMock = 'Sorocaba';

  RealtimeEntity resultEntityMock = RealtimeEntity(
    temperature: 60,
    lat: -23.50034523010254,
    lon: -47.45828628540039,
    name:
        "Sorocaba, Região Imediata de Sorocaba, Região Metropolitana de Sorocaba, Região Geográfica Intermediária de Sorocaba, São Paulo, Região Sudeste, Brasil",
    weatherCode: 1001,
    time: "2024-02-14T15:53:00Z",
  );

  group('Success when:', () {
    test('', () {
      when(() => repository.call(location: locationMock)).thenAnswer(
        (_) async => Success(resultEntityMock),
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
