import 'package:flutter_modular/flutter_modular.dart';
import 'package:suamusica_weather/app/modules/home/home_module.dart';
import 'package:suamusica_weather/app/modules/settings/settings_module.dart';
import 'package:suamusica_weather/app/modules/splash/splash_module.dart';
import 'package:suamusica_weather/app/routes/routes.dart';
import 'package:suamusica_weather/app/shared/http_client/app_http_client_module.dart';

import 'shared/local_storage/local_storage.dart';

class AppModule extends Module {
  @override
  final List<ModularRoute> routes = [
    ModuleRoute(Routes.home, module: HomeModule()),
    ModuleRoute(Routes.splash, module: SplashModule()),
    ModuleRoute(Routes.settings, module: SettingsModule()),
  ];

  @override
  final List<Module> imports = [
    AppHttpClientModule(),
    LocalStorageModule(),
  ];
}
