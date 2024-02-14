import 'package:flutter_modular/flutter_modular.dart';
import 'package:suamusica_weather/app/modules/home/data/datasources/datasources.dart';
import 'package:suamusica_weather/app/modules/home/domain/repositories/repositories.dart';
import 'package:suamusica_weather/app/modules/home/domain/usecases/usecases.dart';
import 'package:suamusica_weather/app/modules/home/presentation/cubit/home_cubit.dart';
import 'package:suamusica_weather/app/modules/home/presentation/ui/home_page.dart';

import '../../routes/routes.dart';
import '../../shared/http_client/http_client.dart';
import '../../shared/local_storage/core/local_storage.dart';
import 'data/repositories/repositories.dart';

class HomeModule extends Module {
  @override
  final List<Bind> binds = [
    // DataSources remote
    Bind<ForecastWeekDatasource>((i) => ForecastWeekDatasourceImpl(i<AppHttpClient>(), i<SetWeekLocalDatasource>())),
    Bind<ForecastRealtimeDatasource>((i) => ForecastRealtimeDatasourceImpl(i<AppHttpClient>())),
    Bind<ForecastIntraDayDatasource>((i) => ForecastIntraDayDatasourceImpl(
          i<AppHttpClient>(),
          i<SetIntraDayLocalDatasource>(),
        )),
    // DataSources local
    Bind<GetIntraDayLocalDatasource>((i) => GetIntraDayLocalDatasourceImpl(i<LocalStorage>())),
    Bind<SetIntraDayLocalDatasource>((i) => SetIntraDayLocalDatasourceImpl(i<LocalStorage>())),
    Bind<GetLocationLocalDatasource>((i) => GetLocationLocalDatasourceImpl(i<LocalStorage>())),
    Bind<SetLocationLocalDatasource>((i) => SetLocationLocalDatasourceImpl(i<LocalStorage>())),
    Bind<SetWeekLocalDatasource>((i) => SetWeekLocalDatasourceImpl(i<LocalStorage>())),
    Bind<GetWeekLocalDatasource>((i) => GetWeekLocalDatasourceImpl(i<LocalStorage>())),
    // Repository
    Bind<ForecastWeekRepository>((i) => ForecastWeekRepositoryImpl(i<ForecastWeekDatasource>(), i<GetWeekLocalDatasource>())),
    Bind<ForecastIntraDayRepository>(
        (i) => ForecastIntraDayRepositoryImpl(i<ForecastIntraDayDatasource>(), i<GetIntraDayLocalDatasource>())),
    Bind<ForecastRealtimeRepository>((i) => ForecastRealtimeRepositoryImpl(i<ForecastRealtimeDatasource>())),
    Bind<LocationRepository>(
        (i) => LocationRepositoryImpl(i<GetLocationLocalDatasource>(), i<SetLocationLocalDatasource>())),
    // UseCase
    Bind<ForecastWeekUseCase>((i) => ForecastWeekUseCaseImpl(i<ForecastWeekRepository>())),
    Bind<ForecastRealtimeUseCase>((i) => ForecastRealtimeUseCaseImpl(i<ForecastRealtimeRepository>())),
    Bind<ForecastIntraDayUseCase>((i) => ForecastIntraDayUseCaseImpl(i<ForecastIntraDayRepository>())),
    Bind<SetLocationUseCase>((i) => SetLocationUseCaseImpl(i<LocationRepository>())),
    Bind<GetLocationUseCase>((i) => GetLocationUseCaseImpl(i<LocationRepository>())),
    // Cubit
    Bind<HomeCubit>(
      (i) => HomeCubit(
        i<ForecastWeekUseCase>(),
        i<ForecastRealtimeUseCase>(),
        i<ForecastIntraDayUseCase>(),
        i<SetLocationUseCase>(),
        i<GetLocationUseCase>(),
      ),
    ),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(Routes.empty, child: (context, args) => const HomePage()),
  ];
}
