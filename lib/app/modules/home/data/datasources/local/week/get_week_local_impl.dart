import 'dart:convert';

import '../../../../../../shared/local_storage/core/local_storage.dart';
import '../../../../domain/entities/entities.dart';
import '../../../dtos/dtos.dart';
import '../../datasources.dart';
import 'constants/week_constants.dart';

class GetWeekLocalDatasourceImpl implements GetWeekLocalDatasource {
  final LocalStorage localStorageService;

  const GetWeekLocalDatasourceImpl(this.localStorageService);

  @override
  Future<List<WeatherWeekEntity>> call({
    required String location,
  }) async {
    final data = await localStorageService.getString(WeekConstants.weekIntraDayKey(location));

    if (data == null) {
      return [];
    }

    final jsonList = json.decode(data);

    List<WeatherWeekEntity> list =
        (jsonList['timelines']['daily'] as List).map((item) => WeatherForecastWeekDto.fromMap(item)).toList();

    return list;
  }
}
