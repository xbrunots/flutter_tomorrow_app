import '../../../../../../shared/http_client/http_client.dart';
import '../../../../domain/entities/entities.dart';
import '../../datasources.dart';

class ForecastWeekDatasourceImpl implements ForecastWeekDatasource {
  final AppHttpClient httpClient;
  final SetWeekLocalDatasource setWeekLocal;

  const ForecastWeekDatasourceImpl(this.httpClient, this.setWeekLocal);

  @override
  Future<List<WeatherWeekEntity>> call({
    required String location,
  }) async {
    return [
      WeatherWeekEntity(time: "2024-02-14T15:53:00Z", forecast: WeekEntity()),
      WeatherWeekEntity(time: "2024-02-14T15:53:00Z", forecast: WeekEntity()),
      WeatherWeekEntity(time: "2024-02-14T15:53:00Z", forecast: WeekEntity()),
      WeatherWeekEntity(time: "2024-02-14T15:53:00Z", forecast: WeekEntity()),
      WeatherWeekEntity(time: "2024-02-14T15:53:00Z", forecast: WeekEntity()),
      WeatherWeekEntity(time: "2024-02-14T15:53:00Z", forecast: WeekEntity()),
      WeatherWeekEntity(time: "2024-02-14T15:53:00Z", forecast: WeekEntity()),
      WeatherWeekEntity(time: "2024-02-14T15:53:00Z", forecast: WeekEntity()),
    ];

    //
    // final response = await httpClient.get(
    //   path: 'forecast?location=$location&timesteps=1d&apikey=${Env.tomorrowToken}',
    // );
    //
    // if (response.data['code'] != null) {
    //   throw AppError(errorMessage: response.data['message']);
    // }
    //
    // await setWeekLocal(data: response.data, location: location);
    //
    // List<WeatherWeekEntity> list =
    //     (response.data['timelines']['daily'] as List).map((item) => WeatherForecastWeekDto.fromMap(item)).toList();
    //
    // return list ?? [];
  }
}
