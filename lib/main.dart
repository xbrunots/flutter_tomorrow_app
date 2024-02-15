import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:suamusica_weather/app/design_system/theme/theme.dart';

import 'app/app_modules.dart';
import 'app/design_system/widgets/utils/restart_widget.dart';
import 'app/routes/routes.dart';
import 'app/shared/shared.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Modular.setInitialRoute(Routes.splash);
  runApp(
    RestartWidget(
      child: AppWidget(),
    ),
  );
}

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ModularApp(
      module: AppModule(),
      child: MaterialApp.router(
        title: AppStrings.appTitle,
        debugShowCheckedModeBanner: false,
        theme: appTheme,
        routerDelegate: Modular.routerDelegate,
        routeInformationParser: Modular.routeInformationParser,
        localizationsDelegates: GlobalMaterialLocalizations.delegates,
        supportedLocales: const [Locale('pt', 'BR')],
      ),
    );
  }
}
