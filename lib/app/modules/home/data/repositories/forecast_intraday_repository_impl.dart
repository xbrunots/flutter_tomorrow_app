import '../../../../shared/domain/errors/errors.dart';
import '../../../../shared/http_client/core/either/either.dart';
import '../../domain/entities/entities.dart';
import '../../domain/repositories/repositories.dart';
import '../datasources/datasources.dart';

class ForecastIntraDayRepositoryImpl implements ForecastIntraDayRepository {
  final ForecastIntraDayDatasource dataSource;
  final GetIntraDayLocalDatasource getForecastIntraDayLocal;

  const ForecastIntraDayRepositoryImpl(
    this.dataSource,
    this.getForecastIntraDayLocal,
  );

  @override
  Future<EitherOf<AppError, List<WeatherIntraDayEntity>>> call({
    required String location,
  }) async {
    try {
      late List<WeatherIntraDayEntity> result;

      final cache = await getForecastIntraDayLocal(location: location);

      if (cache.isEmpty) {
        result = await dataSource(location: location);
      } else {
        result = cache;
      }

      return Success(result);
    } on AppError catch (e) {
      return Failure(e);
    } catch (e) {
      return Failure(AppError());
    }
  }
}
