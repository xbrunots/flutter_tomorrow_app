import '../../../../design_system/colors/ds_colors.dart';
import '../../../../shared/domain/errors/errors.dart';
import '../../../../shared/http_client/core/either/either.dart';
import '../../domain/repositories/repositories.dart';
import '../datasources/datasource.dart';

class DarkModeRepositoryImpl implements DarkModeRepository {
  final GetDarkModeDatasource getDarkModeDatasource;
  final SetDarkModeDatasource setDarkModeDatasource;

  const DarkModeRepositoryImpl(this.getDarkModeDatasource, this.setDarkModeDatasource);

  @override
  Future<EitherOf<AppError, bool>> get() async {
    try {
      final result = await getDarkModeDatasource();
      DSColors.setDarkMode(result);
      return Success(result);
    } on AppError catch (e) {
      return Failure(e);
    } catch (e) {
      return Failure(AppError());
    }
  }

  @override
  Future<EitherOf<AppError, bool>> set({required bool enable}) async {
    try {
      await setDarkModeDatasource(enable: enable);
      DSColors.setDarkMode(enable);
      return Success(enable);
    } on AppError catch (e) {
      return Failure(e);
    } catch (e) {
      return Failure(AppError());
    }
  }
}
