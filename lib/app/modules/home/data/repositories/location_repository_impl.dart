import '../../../../shared/domain/errors/errors.dart';
import '../../../../shared/http_client/core/either/either.dart';
import '../../domain/repositories/repositories.dart';
import '../datasources/datasources.dart';

class LocationRepositoryImpl implements LocationRepository {
  final GetLocationLocalDatasource getLocationLocalDatasource;
  final SetLocationLocalDatasource setLocationLocalDatasource;

  const LocationRepositoryImpl(this.getLocationLocalDatasource, this.setLocationLocalDatasource);

  @override
  Future<EitherOf<AppError, String?>> get() async {
    try {
      final result = await getLocationLocalDatasource();
      return Success(result);
    } on AppError catch (e) {
      return Failure(e);
    } catch (e) {
      return Failure(AppError());
    }
  }

  @override
  Future<EitherOf<AppError, bool>> set({required String location}) async {
    try {
      final result = await setLocationLocalDatasource(location: location);
      return Success(result);
    } on AppError catch (e) {
      return Failure(e);
    } catch (e) {
      return Failure(AppError());
    }
  }
}
