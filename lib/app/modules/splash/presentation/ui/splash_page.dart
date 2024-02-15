import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../../design_system/design_system.dart';
import '../../../../routes/routes.dart';
import '../../../../shared/shared.dart';
import '../cubit/splash_cubit.dart';
import '../cubit/states/states.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  final cubit = Modular.get<SplashCubit>();

  @override
  void initState() {
    super.initState();
    setupStatusBar();
    cubit.init();
  }

  setupStatusBar() {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: DSColors.darkMode ? Brightness.light : Brightness.dark,
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: DSColors.neutral[100],
      body: Container(
        width: ScreenUtils(context).width,
        height: ScreenUtils(context).height,
        child: BlocBuilder(
            bloc: cubit,
            builder: (context, state) {
              if (state is ErrorState) {
                WidgetsBinding.instance.addPostFrameCallback((_) {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: DSText.titleLargeBold.draw(
                      state.error!,
                      color: DSColors.error[100],
                    ),
                  ));
                });
              }

              if (state is NavigateHomeState) {
                SchedulerBinding.instance.addPostFrameCallback((_) {
                  Modular.to.pushReplacementNamed(Routes.home);
                });
              }

              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  DSImageAsset(
                    ImageStrings.logoAnimate,
                    width: ScreenUtils(context).width,
                    height: 200,
                  ),
                  SizedBox(
                    height: 32,
                  ),
                ],
              );
            }),
      ),
    );
  }
}
