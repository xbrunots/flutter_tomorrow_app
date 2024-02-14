import '../../../../../shared/domain/errors/errors.dart';
import '../../../../../shared/http_client/core/either/either.dart';
import '../../entities/entities.dart';
import '../../repositories/repositories.dart';
import 'forecast_intraday_usecase.dart';

class ForecastIntraDayUseCaseImpl implements ForecastIntraDayUseCase {
  final ForecastIntraDayRepository repository;

  const ForecastIntraDayUseCaseImpl(this.repository);

  @override
  Future<EitherOf<AppError, List<WeatherIntraDayEntity>>> call({
    required String location,
  }) async {
    return await repository(
      location: location,
    );
  }
}
