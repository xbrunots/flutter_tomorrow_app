import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:suamusica_weather/app/modules/home/data/datasources/datasources.dart';
import 'package:suamusica_weather/app/modules/home/data/repositories/repositories.dart';
import 'package:suamusica_weather/app/modules/home/domain/entities/entities.dart';
import 'package:suamusica_weather/app/shared/domain/errors/errors.dart';
import 'package:suamusica_weather/app/shared/http_client/core/either/either.dart';

class ForecastRealtimeDatasourceImplMock extends Mock implements ForecastRealtimeDatasourceImpl {}

void main() {
  final dataSource = ForecastRealtimeDatasourceImplMock();
  final repository = ForecastRealtimeRepositoryImpl(dataSource);

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
    test('Check location', () {
      when(() => dataSource.call(location: locationMock)).thenAnswer(
        (_) async => resultEntityMock,
      );

      expect(repository.call(location: locationMock), completion(isA<Success>()));
    });
  });

  group('Fails when:', () {
    test('Check error', () {
      when(() => dataSource.call(location: locationMock)).thenAnswer(
        (_) async => throw Exception(),
      );

      expect(repository.call(location: locationMock), completion(isA<Failure>()));
    });

    test('', () async {
      when(() => dataSource.call(location: locationMock)).thenAnswer(
        (_) async => throw AppError(errorMessage: 'Error message from response.'),
      );

      final result = await repository.call(location: locationMock);

      expect(result.get((error) => error, (success) => null), isA<AppError>());
      expect(result.get((error) => error.errorMessage, (success) => null), 'Error message from response.');
    });
  });

  group('Success:', () {
    test('Either should be a success', () async {
      when(() => dataSource.call(location: locationMock)).thenAnswer((_) async => resultEntityMock);

      final result = await repository.call(location: locationMock);

      expect(result.isSuccess(), true);
    });

    test('Should return a RealtimeEntity', () async {
      when(() => dataSource.call(location: locationMock)).thenAnswer((_) async => resultEntityMock);

      final result = await repository.call(location: locationMock);

      expect(
        result.get((error) => error, (success) => success),
        isA<RealtimeEntity>(),
      );
    });
  });

  group('Failure:', () {
    test('Either should be a failure when an error is thrown', () async {
      when(() => dataSource.call(location: locationMock)).thenThrow(Error());

      final result = await repository.call(location: locationMock);

      expect(result.isFailure(), true);
    });

    test('Should return an AppError', () async {
      when(() => dataSource.call(location: locationMock)).thenThrow((_) async => AppError());

      final result = await repository.call(location: locationMock);

      expect(
        result.get((error) => error, (success) => success),
        isA<AppError>(),
      );
    });

    test('Should return an AppError when an error is thrown', () async {
      when(() => dataSource.call(location: locationMock)).thenThrow(Error());

      final result = await repository.call(location: locationMock);

      expect(
        result.get((error) => error, (success) => success),
        isA<AppError>(),
      );
    });
  });
}
