
 
import '../../../../domain/entities/entities.dart';

abstract class ForecastWeekDatasource {
  Future<List<WeatherWeekEntity>> call({required String location, });
}
