import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:suamusica_weather/app/modules/home/data/datasources/datasources.dart';
import 'package:suamusica_weather/app/modules/home/data/repositories/repositories.dart';
import 'package:suamusica_weather/app/modules/home/domain/entities/entities.dart';
import 'package:suamusica_weather/app/shared/domain/errors/errors.dart';
import 'package:suamusica_weather/app/shared/http_client/core/either/either.dart';

class ForecastIntraDayDatasourceImplMock extends Mock implements ForecastIntraDayDatasourceImpl {}

class GetIntraDayLocalDatasourceImplMock extends Mock implements GetIntraDayLocalDatasourceImpl {}

void main() {
  final intraDayDatasource = ForecastIntraDayDatasourceImplMock();
  final getDatasource = GetIntraDayLocalDatasourceImplMock();
  final repository = ForecastIntraDayRepositoryImpl(intraDayDatasource, getDatasource);

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
    test('Check location', () {
      when(() => intraDayDatasource.call(location: locationMock)).thenAnswer(
        (_) async => listMock,
      );
      when(() => getDatasource.call(location: locationMock)).thenAnswer(
        (_) async => listMock,
      );

      expect(repository.call(location: locationMock), completion(isA<Success>()));
    });
  });

  group('Fails when:', () {
    test('Check error', () {
      when(() => intraDayDatasource.call(location: locationMock)).thenAnswer(
        (_) async => throw Exception(),
      );
      when(() => getDatasource.call(location: locationMock)).thenAnswer(
        (_) async => throw Exception(),
      );

      expect(repository.call(location: locationMock), completion(isA<Failure>()));
    });

    test('', () async {
      when(() => intraDayDatasource.call(location: locationMock)).thenAnswer(
        (_) async => throw AppError(errorMessage: 'Error message from response.'),
      );
      when(() => getDatasource.call(location: locationMock)).thenAnswer(
        (_) async => throw AppError(errorMessage: 'Error message from response.'),
      );

      final result = await repository.call(location: locationMock);

      expect(result.get((error) => error, (success) => null), isA<AppError>());
      expect(result.get((error) => error.errorMessage, (success) => null), 'Error message from response.');
    });
  });

  group('Success:', () {
    test('Either should be a success', () async {
      when(() => intraDayDatasource.call(location: locationMock)).thenAnswer((_) async => listMock);
      when(() => getDatasource.call(location: locationMock)).thenAnswer((_) async => listMock);

      final result = await repository.call(location: locationMock);

      expect(result.isSuccess(), true);
    });

    test('Should return a List<WeatherIntraDayEntity>', () async {
      when(() => intraDayDatasource.call(location: locationMock)).thenAnswer((_) async => listMock);
      when(() => getDatasource.call(location: locationMock)).thenAnswer((_) async => listMock);

      final result = await repository.call(location: locationMock);

      expect(
        result.get((error) => error, (success) => success),
        isA<List<WeatherIntraDayEntity>>(),
      );
    });
  });

  group('Failure:', () {
    test('Either should be a failure when an error is thrown', () async {
      when(() => intraDayDatasource.call(location: locationMock)).thenThrow(Error());
      when(() => getDatasource.call(location: locationMock)).thenThrow(Error());

      final result = await repository.call(location: locationMock);

      expect(result.isFailure(), true);
    });

    test('Should return an AppError', () async {
      when(() => intraDayDatasource.call(location: locationMock)).thenThrow((_) async => AppError());
      when(() => getDatasource.call(location: locationMock)).thenThrow((_) async => AppError());

      final result = await repository.call(location: locationMock);

      expect(
        result.get((error) => error, (success) => success),
        isA<AppError>(),
      );
    });

    test('Should return an AppError when an error is thrown', () async {
      when(() => intraDayDatasource.call(location: locationMock)).thenThrow(Error());
      when(() => getDatasource.call(location: locationMock)).thenThrow(Error());

      final result = await repository.call(location: locationMock);

      expect(
        result.get((error) => error, (success) => success),
        isA<AppError>(),
      );
    });
  });
}
