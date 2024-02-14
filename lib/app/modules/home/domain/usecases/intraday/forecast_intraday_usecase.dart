import '../../../../../shared/domain/errors/errors.dart';
import '../../../../../shared/http_client/core/either/either.dart';
import '../../entities/entities.dart';

abstract class ForecastIntraDayUseCase {
  Future<EitherOf<AppError, List<WeatherIntraDayEntity>>> call({required String location, });
}
