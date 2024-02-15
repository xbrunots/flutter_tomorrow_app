import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:suamusica_weather/app/modules/settings/data/repositories/repositories.dart';
import 'package:suamusica_weather/app/modules/settings/domain/usecases/usecases.dart';
import 'package:suamusica_weather/app/shared/domain/errors/errors.dart';
import 'package:suamusica_weather/app/shared/http_client/core/either/either.dart';

class ClearCacheRepositoryImplMock extends Mock implements ClearCacheRepositoryImpl {}

void main() {
  final repository = ClearCacheRepositoryImplMock();
  final useCase = ClearCacheUseCaseImpl(repository);

  group('Success when:', () {
    test('', () {
      when(() => repository.call()).thenAnswer(
        (_) async => Success(true),
      );

      expect(useCase.call(), completion(isA<Success>()));
    });
  });

  group('Fails when:', () {
    test('', () {
      when(() => repository.call()).thenAnswer(
        (_) async => Failure(AppError()),
      );

      expect(useCase.call(), completion(isA<Failure>()));
    });
  });
}
