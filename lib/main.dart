import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:suamusica_weather/app/design_system/theme/theme.dart';

import 'app/app_modules.dart';
import 'app/routes/routes.dart';
import 'app/shared/cubit/app_cubit.dart';
import 'app/shared/cubit/state/states.dart';
import 'app/shared/shared.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Modular.setInitialRoute(Routes.splash);
  runApp(const AppWidget());
}

class AppWidget extends StatefulWidget {
  const AppWidget({super.key});

  @override
  State<AppWidget> createState() => _AppWidgetState();
}

class _AppWidgetState extends State<AppWidget> {
  final AppCubit appCubit = AppCubit();

  @override
  void initState() {
    super.initState();
    appCubit.setUpApp();
  }

  @override
  Widget build(BuildContext context) {
    return ModularApp(
      module: AppModule(),
      child: BlocBuilder(
          bloc: appCubit,
          builder: (context, state) {
            if (state is SuccessState) {
              return MaterialApp.router(
                title: AppStrings.appTitle,
                debugShowCheckedModeBanner: false,
                theme: appTheme,
                routerDelegate: Modular.routerDelegate,
                routeInformationParser: Modular.routeInformationParser,
                localizationsDelegates: GlobalMaterialLocalizations.delegates,
                supportedLocales: const [Locale('pt', 'BR')],
              );
            }

            return const SizedBox();
          }),
    );
  }
}
