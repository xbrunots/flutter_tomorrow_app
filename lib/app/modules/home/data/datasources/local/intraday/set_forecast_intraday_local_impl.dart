import 'dart:convert';

import 'package:suamusica_weather/app/modules/home/data/dtos/weather_forecast_intraday_dto.dart';

import '../../../../../../shared/local_storage/core/core.dart';
import '../../../../domain/entities/entities.dart';
import '../../datasources.dart';
import 'constants/intraday_constants.dart';

class SetIntraDayLocalDatasourceImpl implements SetIntraDayLocalDatasource {
  final LocalStorage localStorageService;

  const SetIntraDayLocalDatasourceImpl(this.localStorageService);

  @override
  Future<void> call({required dynamic data, required String location}) async {

    String jsonList = json.encode(data);

    return await localStorageService.setString(IntraDayConstants.forecastIntraDayKey(location), jsonList);
  }
}
