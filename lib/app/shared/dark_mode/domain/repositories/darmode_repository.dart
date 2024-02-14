import '../../../../shared/domain/errors/errors.dart';
import '../../../../shared/http_client/core/either/either.dart';

abstract class DarkModeRepository {
  Future<EitherOf<AppError, bool>> set({
    required bool enable,
  });

  Future<EitherOf<AppError, bool>> get();
}
