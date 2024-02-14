import 'package:suamusica_weather/app/modules/home/domain/repositories/location_repository.dart';

import '../../../../../shared/domain/errors/errors.dart';
import '../../../../../shared/http_client/core/either/either.dart';
import '../usecases.dart';

class GetLocationUseCaseImpl implements GetLocationUseCase {
  final LocationRepository repository;

  const GetLocationUseCaseImpl(this.repository);

  @override
  Future<EitherOf<AppError, String?>> call() async {
    return await repository.get();
  }
}
