import '../../../../../shared/domain/errors/errors.dart';
import '../../../../../shared/http_client/core/either/either.dart';
import '../../entities/entities.dart';

abstract class ForecastWeekUseCase {
  Future<EitherOf<AppError, List<WeatherWeekEntity>>> call({required String location, });
}
