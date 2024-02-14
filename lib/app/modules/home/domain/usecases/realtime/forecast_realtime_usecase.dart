import '../../../../../shared/domain/errors/errors.dart';
import '../../../../../shared/http_client/core/either/either.dart';
import '../../entities/entities.dart';

abstract class ForecastRealtimeUseCase {
  Future<EitherOf<AppError, RealtimeEntity>> call({required String location});
}
