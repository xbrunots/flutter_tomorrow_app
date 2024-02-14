import '../../../../shared/domain/errors/errors.dart';
import '../../../../shared/http_client/core/either/either.dart';
import '../repositories/repositories.dart';
import 'usecases.dart';

class ClearCacheUseCaseImpl implements ClearCacheUseCase {
  final ClearCacheRepository repository;

  const ClearCacheUseCaseImpl(this.repository);

  @override
  Future<EitherOf<AppError, bool>> call() async {
    return await repository();
  }
}
