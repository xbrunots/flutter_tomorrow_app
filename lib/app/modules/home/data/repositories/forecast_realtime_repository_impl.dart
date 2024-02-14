import '../../../../shared/domain/errors/errors.dart';
import '../../../../shared/http_client/core/either/either.dart';
import '../../domain/entities/entities.dart';
import '../../domain/repositories/repositories.dart';
import '../datasources/datasources.dart';

class ForecastRealtimeRepositoryImpl implements ForecastRealtimeRepository {
  final ForecastRealtimeDatasource dataSource;

  const ForecastRealtimeRepositoryImpl(this.dataSource);

  @override
  Future<EitherOf<AppError, RealtimeEntity>> call({required String location}) async {
    try {
      final result = await dataSource(location: location);
      return Success(result);
    } on AppError catch (e) {
      return Failure(e);
    } catch (e) {
      return Failure(AppError());
    }
  }
}
