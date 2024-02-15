import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:suamusica_weather/app/modules/home/domain/entities/entities.dart';
import 'package:suamusica_weather/app/modules/settings/data/datasources/datasource.dart';
import 'package:suamusica_weather/app/modules/settings/data/repositories/repositories.dart';
import 'package:suamusica_weather/app/shared/domain/errors/errors.dart';
import 'package:suamusica_weather/app/shared/http_client/core/either/either.dart';

class ClearCacheDatasourceImplMock extends Mock implements ClearCacheDatasourceImpl {}

void main() {
  final datasource = ClearCacheDatasourceImplMock();
  final repository = ClearCacheRepositoryImpl(datasource);

  group('Success when:', () {
    test('Check location', () {
      when(() => datasource.call()).thenAnswer(
        (_) async => true,
      );

      expect(repository.call(), completion(isA<Success>()));
    });
  });

  group('Fails when:', () {
    test('Check error', () {
      when(() => datasource.call()).thenAnswer(
        (_) async => throw Exception(),
      );

      expect(repository.call(), completion(isA<Failure>()));
    });

    test('', () async {
      when(() => datasource.call()).thenAnswer(
        (_) async => throw AppError(errorMessage: 'Error message from response.'),
      );

      final result = await repository.call();

      expect(result.get((error) => error, (success) => null), isA<AppError>());
      expect(result.get((error) => error.errorMessage, (success) => null), 'Error message from response.');
    });
  });

  group('Success:', () {
    test('Either should be a success', () async {
      when(() => datasource.call()).thenAnswer((_) async => true);

      final result = await repository.call();

      expect(result.isSuccess(), true);
    });

    test('Should return a bool', () async {
      when(() => datasource.call()).thenAnswer((_) async => true);

      final result = await repository.call();

      expect(
        result.get((error) => error, (success) => success),
        isA<bool>(),
      );
    });
  });

  group('Failure:', () {
    test('Either should be a failure when an error is thrown', () async {
      when(() => datasource.call()).thenThrow(Error());

      final result = await repository.call();

      expect(result.isFailure(), true);
    });

    test('Should return an AppError', () async {
      when(() => datasource.call()).thenThrow((_) async => AppError());

      final result = await repository.call();

      expect(
        result.get((error) => error, (success) => success),
        isA<AppError>(),
      );
    });

    test('Should return an AppError when an error is thrown', () async {
      when(() => datasource.call()).thenThrow(Error());

      final result = await repository.call();

      expect(
        result.get((error) => error, (success) => success),
        isA<AppError>(),
      );
    });
  });
}
