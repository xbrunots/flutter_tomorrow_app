
 
import '../../../../domain/entities/entities.dart';

abstract class GetWeekLocalDatasource {
  Future<List<WeatherWeekEntity>> call({required String location, });
}
