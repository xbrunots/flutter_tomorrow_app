import 'dart:convert';

import 'package:suamusica_weather/app/modules/home/data/dtos/weather_forecast_intraday_dto.dart';

import '../../../../../../shared/local_storage/core/core.dart';
import '../../../../domain/entities/entities.dart';
import '../../datasources.dart';
import 'constants/intraday_constants.dart';

class GetIntraDayLocalDatasourceImpl implements GetIntraDayLocalDatasource {
  final LocalStorage localStorageService;

  const GetIntraDayLocalDatasourceImpl(this.localStorageService);

  @override
  Future<List<WeatherIntraDayEntity>> call({
    required String location,
  }) async {
    final data = await localStorageService.getString(IntraDayConstants.forecastIntraDayKey(location));

    if (data == null) {
      return [];
    }

    final jsonList = json.decode(data);

    List<WeatherIntraDayEntity> list =
        (jsonList['timelines']['hourly'] as List).map((item) => WeatherForecastIntradayDto.fromMap(item)).toList();

    return list;
  }
}
