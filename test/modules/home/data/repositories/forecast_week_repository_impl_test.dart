import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:suamusica_weather/app/modules/home/data/datasources/datasources.dart';
import 'package:suamusica_weather/app/modules/home/data/repositories/repositories.dart';
import 'package:suamusica_weather/app/shared/domain/errors/errors.dart';
import 'package:suamusica_weather/app/shared/http_client/core/either/either.dart';

class ForecastWeekDatasourceImplMock extends Mock implements ForecastWeekDatasourceImpl {}

class GetWeekLocalDatasourceImplMock extends Mock implements GetWeekLocalDatasourceImpl {}

void main() {
  final weekDataSource = ForecastWeekDatasourceImplMock();
  final getDatasource = GetWeekLocalDatasourceImplMock();
  final repository = ForecastWeekRepositoryImpl(weekDataSource, getDatasource);

  final String locationMock = 'Sorocaba';

  group('Fails when:', () {
    test('Check error', () {
      when(() => weekDataSource.call(location: locationMock)).thenAnswer(
            (_) async => throw Exception(),
      );

      expect(repository.call(location: locationMock), completion(isA<Failure>()));
    });
  });

  group('Failure:', () {
    test('Either should be a failure when an error is thrown', () async {
      when(() => weekDataSource.call(location: locationMock)).thenThrow(Error());

      final result = await repository.call(location: locationMock);

      expect(result.isFailure(), true);
    });

    test('Should return an AppError', () async {
      when(() => weekDataSource.call(location: locationMock)).thenThrow((_) async => AppError());

      final result = await repository.call(location: locationMock);

      expect(
        result.get((error) => error, (success) => success),
        isA<AppError>(),
      );
    });

    test('Should return an AppError when an error is thrown', () async {
      when(() => weekDataSource.call(location: locationMock)).thenThrow(Error());

      final result = await repository.call(location: locationMock);

      expect(
        result.get((error) => error, (success) => success),
        isA<AppError>(),
      );
    });
  });
}
