import 'package:flutter_modular/flutter_modular.dart';
import 'package:suamusica_weather/app/modules/splash/presentation/cubit/splash_cubit.dart';
import 'package:suamusica_weather/app/modules/splash/presentation/ui/splash_page.dart';

import '../../routes/routes.dart';
import '../../shared/dark_mode/data/datasources/datasource.dart';
import '../../shared/dark_mode/data/repositories/repositories.dart';
import '../../shared/dark_mode/domain/repositories/repositories.dart';
import '../../shared/dark_mode/domain/usecases/usecases.dart';
import '../../shared/local_storage/core/core.dart';

class SplashModule extends Module {
  @override
  final List<Bind> binds = [
    // DataSources local
    Bind<GetDarkModeDatasource>((i) => GetDarkModeDatasourceImpl(i<LocalStorage>())),
    Bind<SetDarkModeDatasource>((i) => SetDarkModeDatasourceImpl(i<LocalStorage>())),
    // Repository
    Bind<DarkModeRepository>((i) => DarkModeRepositoryImpl(i<GetDarkModeDatasource>(), i<SetDarkModeDatasource>())),
    // UseCase
    Bind<GetDarkModeUseCase>((i) => GetDarkModeUseCaseImpl(i<DarkModeRepository>())),
    Bind<SetDarkModeUseCase>((i) => SetDarkModeUseCaseImpl(i<DarkModeRepository>())),
    // Cubit
    Bind<SplashCubit>(
      (i) => SplashCubit(
        i<SetDarkModeUseCase>(),
        i<GetDarkModeUseCase>(),
      ),
    ),
  ];

  @override
  List<ModularRoute> routes = [
    ChildRoute(Routes.splash, child: (context, args) => const SplashPage()),
  ];
}
