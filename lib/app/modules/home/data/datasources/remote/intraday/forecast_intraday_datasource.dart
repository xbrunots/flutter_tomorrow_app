


import '../../../../domain/entities/entities.dart';

abstract class ForecastIntraDayDatasource {
  Future<List<WeatherIntraDayEntity>> call({required String location, });
}
