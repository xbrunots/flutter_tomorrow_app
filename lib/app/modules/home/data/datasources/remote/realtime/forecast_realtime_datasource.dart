

import '../../../../domain/entities/entities.dart';

abstract class ForecastRealtimeDatasource {
  Future<RealtimeEntity> call({required String location});
}
