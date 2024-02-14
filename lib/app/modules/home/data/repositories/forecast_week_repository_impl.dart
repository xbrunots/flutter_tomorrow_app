import '../../../../shared/domain/errors/errors.dart';
import '../../../../shared/http_client/core/either/either.dart';
import '../../domain/entities/entities.dart';
import '../../domain/repositories/repositories.dart';
import '../datasources/datasources.dart';

class ForecastWeekRepositoryImpl implements ForecastWeekRepository {
  final ForecastWeekDatasource dataSource;
  final GetWeekLocalDatasource getWeekLocal;

  const ForecastWeekRepositoryImpl(this.dataSource, this.getWeekLocal);

  @override
  Future<EitherOf<AppError, List<WeatherWeekEntity>>> call({
    required String location,
  }) async {
    try {
      late List<WeatherWeekEntity> result;

      final cache = await getWeekLocal(location: location);

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
