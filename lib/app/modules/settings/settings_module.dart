import 'package:flutter_modular/flutter_modular.dart';
import 'package:suamusica_weather/app/modules/settings/data/datasources/datasource.dart';
import 'package:suamusica_weather/app/modules/settings/domain/repositories/clear_cache_repository.dart';
import 'package:suamusica_weather/app/modules/settings/presentation/cubit/settings_cubit.dart';

import '../../routes/routes.dart';
import '../../shared/dark_mode/data/datasources/datasource.dart';
import '../../shared/dark_mode/data/repositories/repositories.dart';
import '../../shared/dark_mode/domain/repositories/repositories.dart';
import '../../shared/dark_mode/domain/usecases/usecases.dart';
import '../../shared/local_storage/core/core.dart';
import 'data/repositories/repositories.dart';
import 'domain/usecases/usecases.dart';
import 'presentation/ui/settings_page.dart';

class SettingsModule extends Module {
  @override
  final List<Bind> binds = [
    // DataSources local
    Bind<GetDarkModeDatasource>((i) => GetDarkModeDatasourceImpl(i<LocalStorage>())),
    Bind<SetDarkModeDatasource>((i) => SetDarkModeDatasourceImpl(i<LocalStorage>())),
    Bind<ClearCacheDatasource>((i) => ClearCacheDatasourceImpl(i<LocalStorage>())),
    // Repository
    Bind<DarkModeRepository>((i) => DarkModeRepositoryImpl(i<GetDarkModeDatasource>(), i<SetDarkModeDatasource>())),
    Bind<ClearCacheRepository>((i) => ClearCacheRepositoryImpl(i<ClearCacheDatasource>())),
    // UseCase
    Bind<ClearCacheUseCase>((i) => ClearCacheUseCaseImpl(i<ClearCacheRepository>())),
    Bind<GetDarkModeUseCase>((i) => GetDarkModeUseCaseImpl(i<DarkModeRepository>())),
    Bind<SetDarkModeUseCase>((i) => SetDarkModeUseCaseImpl(i<DarkModeRepository>())),
    // Cubit
    Bind<SettingsCubit>(
      (i) => SettingsCubit(
        i<SetDarkModeUseCase>(),
        i<GetDarkModeUseCase>(),
        i<ClearCacheUseCase>(),
      ),
    ),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(Routes.empty, child: (context, args) => const SettingsPage()),
  ];
}
