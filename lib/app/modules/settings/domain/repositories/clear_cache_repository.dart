import '../../../../shared/domain/errors/errors.dart';
import '../../../../shared/http_client/core/either/either.dart';

abstract class ClearCacheRepository {
  Future<EitherOf<AppError, bool>> call();
}
