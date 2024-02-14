import '../../../../shared/local_storage/core/core.dart';
import 'constants/darkmode_constants.dart';
import 'datasource.dart';

class GetDarkModeDatasourceImpl implements GetDarkModeDatasource {
  final LocalStorage localStorageService;

  const GetDarkModeDatasourceImpl(this.localStorageService);

  @override
  Future<bool> call() async {
    return await localStorageService.getBool(DarkModeConstants.darkModeKey) ?? false;
  }
}
