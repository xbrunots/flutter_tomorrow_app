import '../../../../shared/domain/errors/errors.dart';
import '../../../../shared/http_client/core/either/either.dart';

abstract class SetDarkModeUseCase {
  Future<EitherOf<AppError, bool>> call({required bool enable});
}
