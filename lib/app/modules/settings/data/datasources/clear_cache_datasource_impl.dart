import '../../../../shared/local_storage/core/core.dart';
import 'datasource.dart';

class ClearCacheDatasourceImpl implements ClearCacheDatasource {
  final LocalStorage localStorageService;

  const ClearCacheDatasourceImpl(this.localStorageService);

  @override
  Future<bool> call() async {
    await localStorageService.clean();
    return true;
  }
}
