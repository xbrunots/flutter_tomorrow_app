import '../../../../../../shared/domain/errors/errors.dart';
import '../../../../../../shared/env/env.dart';
import '../../../../../../shared/http_client/http_client.dart';
import '../../../../domain/entities/entities.dart';
import '../../datasources.dart';

class ForecastRealtimeDatasourceImpl implements ForecastRealtimeDatasource {
  final AppHttpClient httpClient;

  const ForecastRealtimeDatasourceImpl(this.httpClient);

  @override
  Future<RealtimeEntity> call({required String location}) async {

    RealtimeEntity resultEntity = RealtimeEntity(
    temperature: 60,
    lat: -23.50034523010254,
    lon: -47.45828628540039,
    name:  "Sorocaba, Região Imediata de Sorocaba, Região Metropolitana de Sorocaba, Região Geográfica Intermediária de Sorocaba, São Paulo, Região Sudeste, Brasil",
    weatherCode: 1001,
    time: "2024-02-14T15:53:00Z",
  );

  return resultEntity;

    //
    // final response = await httpClient.get(
    //   path: 'realtime?location=$location&apikey=${Env.tomorrowToken}',
    // );
    //
    // if (response.data['code'] != null) {
    //   throw AppError(errorMessage: response.data['message']);
    // }
    //
    // RealtimeEntity resultEntity = RealtimeEntity(
    //   temperature: (double.tryParse(response.data['data']['values']['temperature'].toString()) ?? .0).round(),
    //   lat: double.tryParse(response.data['location']['lat'].toString()) ?? .0,
    //   lon: double.tryParse(response.data['location']['lon'].toString()) ?? .0,
    //   name: response.data['location']['name'],
    //   weatherCode: (int.tryParse(response.data['data']['values']['weatherCode'].toString()) ?? 1000),
    //   time: response.data['data']['time'],
    // );
    //
    // return resultEntity;
  }
}
