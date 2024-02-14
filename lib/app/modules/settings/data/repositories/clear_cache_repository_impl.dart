import 'package:suamusica_weather/app/modules/settings/data/datasources/datasource.dart';

import '../../../../shared/domain/errors/errors.dart';
import '../../../../shared/http_client/core/either/either.dart';
import '../../domain/repositories/repositories.dart';

class ClearCacheRepositoryImpl implements ClearCacheRepository {
  final ClearCacheDatasource cacheDatasource;

  const ClearCacheRepositoryImpl(this.cacheDatasource);

  @override
  Future<EitherOf<AppError, bool>> call() async {
    try {
      final result = await cacheDatasource();
      return Success(result);
    } on AppError catch (e) {
      return Failure(e);
    } catch (e) {
      return Failure(AppError());
    }
  }
}
