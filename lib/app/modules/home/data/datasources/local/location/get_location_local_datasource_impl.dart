import '../../../../../../shared/local_storage/core/local_storage.dart';
import '../../datasources.dart';
import 'constants/location_constants.dart';

class GetLocationLocalDatasourceImpl implements GetLocationLocalDatasource {
  final LocalStorage localStorageService;

  const GetLocationLocalDatasourceImpl(this.localStorageService);

  @override
  Future<String?> call() async {
    final data = await localStorageService.getString(LocationConstants.locationKey);
    return data;
  }
}
