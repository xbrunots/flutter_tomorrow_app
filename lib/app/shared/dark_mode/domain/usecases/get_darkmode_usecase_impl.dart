import '../../../../shared/domain/errors/errors.dart';
import '../../../../shared/http_client/core/either/either.dart';
import '../repositories/darmode_repository.dart';
import 'usecases.dart';

class GetDarkModeUseCaseImpl implements GetDarkModeUseCase {
  final DarkModeRepository repository;

  const GetDarkModeUseCaseImpl(this.repository);

  @override
  Future<EitherOf<AppError, bool>> call() async {
    return await repository.get();
  }
}
