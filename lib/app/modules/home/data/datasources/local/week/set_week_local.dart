import '../../../../domain/entities/entities.dart';

abstract class SetWeekLocalDatasource {
  Future<void> call({
    required dynamic data,
    required String location,
  });
}
