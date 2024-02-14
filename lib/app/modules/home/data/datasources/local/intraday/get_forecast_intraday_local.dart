import '../../../../domain/entities/entities.dart';

abstract class GetIntraDayLocalDatasource {
  Future<List<WeatherIntraDayEntity>> call({required String location, });
}
