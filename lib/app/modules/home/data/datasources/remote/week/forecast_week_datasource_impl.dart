import '../../../../../../shared/domain/errors/errors.dart';
import '../../../../../../shared/env/env.dart';
import '../../../../../../shared/http_client/http_client.dart';
import '../../../../domain/entities/entities.dart';
import '../../../dtos/dtos.dart';
import '../../datasources.dart';

class ForecastWeekDatasourceImpl implements ForecastWeekDatasource {
  final AppHttpClient httpClient;
  final SetWeekLocalDatasource setWeekLocal;

  const ForecastWeekDatasourceImpl(this.httpClient, this.setWeekLocal);

  @override
  Future<List<WeatherWeekEntity>> call({
    required String location,
  }) async {
    final response = await httpClient.get(
      path: 'forecast?location=$location&timesteps=1d&apikey=${Env.tomorrowToken}',
    );

    if (response.data['code'] != null) {
      throw AppError(errorMessage: response.data['message']);
    }

    await setWeekLocal(data: response.data, location: location);

    List<WeatherWeekEntity> list =
        (response.data['timelines']['daily'] as List).map((item) => WeatherForecastWeekDto.fromMap(item)).toList();

    return list ?? [];
  }
}
