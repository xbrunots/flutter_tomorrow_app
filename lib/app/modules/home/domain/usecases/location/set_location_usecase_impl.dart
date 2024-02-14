import 'package:suamusica_weather/app/modules/home/domain/usecases/location/set_location_usecase.dart';

import '../../../../../shared/domain/errors/errors.dart';
import '../../../../../shared/http_client/core/either/either.dart';
import '../../repositories/repositories.dart';

class SetLocationUseCaseImpl implements SetLocationUseCase {
  final LocationRepository repository;

  const SetLocationUseCaseImpl(this.repository);

  @override
  Future<EitherOf<AppError, bool>> call({required String location}) async {
    return await repository.set(location: location);
  }
}
