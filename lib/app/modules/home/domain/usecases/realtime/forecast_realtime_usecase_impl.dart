import '../../../../../shared/domain/errors/errors.dart';
import '../../../../../shared/http_client/core/either/either.dart';
import '../../entities/entities.dart';
import '../../repositories/repositories.dart';
import 'forecast_realtime_usecase.dart';

class ForecastRealtimeUseCaseImpl implements ForecastRealtimeUseCase {
  final ForecastRealtimeRepository repository;

  const ForecastRealtimeUseCaseImpl(this.repository);

  @override
  Future<EitherOf<AppError, RealtimeEntity>> call({required String location}) async {
    return await repository(location: location);
  }
}
