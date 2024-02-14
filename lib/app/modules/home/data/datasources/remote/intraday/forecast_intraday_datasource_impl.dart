import 'package:suamusica_weather/app/modules/home/data/dtos/weather_forecast_intraday_dto.dart';

import '../../../../../../shared/domain/errors/errors.dart';
import '../../../../../../shared/env/env.dart';
import '../../../../../../shared/http_client/http_client.dart';
import '../../../../domain/entities/entities.dart';
import '../../datasources.dart';

class ForecastIntraDayDatasourceImpl implements ForecastIntraDayDatasource {
  final AppHttpClient httpClient;
  final SetIntraDayLocalDatasource setForecastIntraDayLocal;

  const ForecastIntraDayDatasourceImpl(this.httpClient, this.setForecastIntraDayLocal);

  @override
  Future<List<WeatherIntraDayEntity>> call({required String location}) async {
    return   [
      WeatherIntraDayEntity(
          time: "2024-02-14T15:53:00Z", forecast: IntraDayEntity()),
      WeatherIntraDayEntity(
          time: "2024-02-14T15:53:00Z", forecast: IntraDayEntity()),
      WeatherIntraDayEntity(
          time: "2024-02-14T15:53:00Z", forecast: IntraDayEntity()),
      WeatherIntraDayEntity(
          time: "2024-02-14T15:53:00Z", forecast: IntraDayEntity()),
      WeatherIntraDayEntity(
          time: "2024-02-14T15:53:00Z", forecast: IntraDayEntity()),
      WeatherIntraDayEntity(
          time: "2024-02-14T15:53:00Z", forecast: IntraDayEntity()),
      WeatherIntraDayEntity(
          time: "2024-02-14T15:53:00Z", forecast: IntraDayEntity()),
      WeatherIntraDayEntity(
          time: "2024-02-14T15:53:00Z", forecast: IntraDayEntity()),
      WeatherIntraDayEntity(
          time: "2024-02-14T15:53:00Z", forecast: IntraDayEntity()),
      WeatherIntraDayEntity(
          time: "2024-02-14T15:53:00Z", forecast: IntraDayEntity()),
    ];
    //
    // final response = await httpClient.get(
    //   path: 'forecast?location=$location&timesteps=1h&apikey=${Env.tomorrowToken}',
    // );
    //
    // if (response.data['code'] != null) {
    //   throw AppError(errorMessage: response.data['message']);
    // }
    //
    // await setForecastIntraDayLocal(data: response.data, location: location);
    //
    // List<WeatherIntraDayEntity> list =
    //     (response.data['timelines']['hourly'] as List).map((item) => WeatherForecastIntradayDto.fromMap(item)).toList();
    //
    // return list ?? [];
  }
}
