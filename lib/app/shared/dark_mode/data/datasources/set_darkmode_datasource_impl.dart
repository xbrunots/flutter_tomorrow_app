

import '../../../../shared/local_storage/core/core.dart';
import 'constants/darkmode_constants.dart';
import 'datasource.dart';

class SetDarkModeDatasourceImpl implements SetDarkModeDatasource {
  final LocalStorage localStorageService;

  const SetDarkModeDatasourceImpl(this.localStorageService);

  @override
  Future<void> call({required dynamic enable}) async {
    return await localStorageService.setBool(DarkModeConstants.darkModeKey, enable);
  }
}
