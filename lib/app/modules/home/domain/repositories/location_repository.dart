import '../../../../shared/domain/errors/errors.dart';
import '../../../../shared/http_client/core/either/either.dart';

abstract class LocationRepository {
  Future<EitherOf<AppError, bool>> set({
    required String location,
  });

  Future<EitherOf<AppError, String?>> get();
}
