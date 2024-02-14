import '../../../../shared/domain/errors/errors.dart';
import '../../../../shared/http_client/core/either/either.dart';
import '../repositories/repositories.dart';
import 'usecases.dart';

class SetDarkModeUseCaseImpl implements SetDarkModeUseCase {
  final DarkModeRepository repository;

  const SetDarkModeUseCaseImpl(this.repository);

  @override
  Future<EitherOf<AppError, bool>> call({required bool enable}) async {
    return await repository.set(enable: enable);
  }
}
