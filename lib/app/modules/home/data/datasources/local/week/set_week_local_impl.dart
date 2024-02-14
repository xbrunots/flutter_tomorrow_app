import 'dart:convert';

import '../../../../../../shared/local_storage/core/core.dart';
import '../../datasources.dart';
import 'constants/week_constants.dart';

class SetWeekLocalDatasourceImpl implements SetWeekLocalDatasource {
  final LocalStorage localStorageService;

  const SetWeekLocalDatasourceImpl(this.localStorageService);

  @override
  Future<void> call({required dynamic data, required String location}) async {
    String jsonList = json.encode(data);

    return await localStorageService.setString(WeekConstants.weekIntraDayKey(location), jsonList);
  }
}
