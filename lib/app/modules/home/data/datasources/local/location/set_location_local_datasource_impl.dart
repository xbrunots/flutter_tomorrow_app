import 'dart:convert';

import '../../../../../../shared/local_storage/core/core.dart';
import '../../datasources.dart';
import 'constants/location_constants.dart';

class SetLocationLocalDatasourceImpl implements SetLocationLocalDatasource {
  final LocalStorage localStorageService;

  const SetLocationLocalDatasourceImpl(this.localStorageService);

  @override
  Future<bool> call({required String location}) async {
     await localStorageService.setString(LocationConstants.locationKey, location);
     return true;
  }
}
