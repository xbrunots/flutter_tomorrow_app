import '../../../../../shared/domain/errors/errors.dart';
import '../../../../../shared/http_client/core/either/either.dart';
import '../../entities/entities.dart';
import '../../repositories/repositories.dart';
import 'forecast_week_usecase.dart';

class ForecastWeekUseCaseImpl implements ForecastWeekUseCase {
  final ForecastWeekRepository repository;

  const ForecastWeekUseCaseImpl(this.repository);

  @override
  Future<EitherOf<AppError, List<WeatherWeekEntity>>> call({
    required String location,
  }) async {
    return await repository(
      location: location,
    );
  }
}
