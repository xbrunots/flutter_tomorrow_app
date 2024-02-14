import '../../../../domain/entities/entities.dart';

abstract class SetLocationLocalDatasource {
  Future<bool> call({
    required String location,
  });
}
