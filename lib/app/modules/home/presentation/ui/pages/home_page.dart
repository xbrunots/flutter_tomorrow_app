import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:lottie/lottie.dart';
import 'package:suamusica_weather/app/modules/home/presentation/cubit/home_cubit.dart';
import 'package:suamusica_weather/app/modules/home/presentation/cubit/states/home_state.dart';
import 'package:suamusica_weather/app/modules/home/presentation/ui/pages/change_location_page.dart';
import 'package:suamusica_weather/app/shared/shared.dart';

import '../../../../../design_system/design_system.dart';
import '../utils/home_strings.dart';
import '../widgets/widgets.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final cubit = Modular.get<HomeCubit>();
  final args = Modular.args;

  @override
  void initState() {
    super.initState();
    verifyRoute();
  }

  verifyRoute() {
    final showLocalDialog = (args.data != null && args.data[HomeStrings.keyUpdateLocal] == true);
    if (showLocalDialog) {
      SchedulerBinding.instance.addPostFrameCallback((_) {
        ChangeLocationPage.show(context, cubit);
      });
    } else {
      cubit.init();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: DSColors.neutral[100],
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Stack(
          children: [
            Lottie.asset('assets/lottie/sky.json'),
            SingleChildScrollView(
              child: BlocBuilder(
                  bloc: cubit,
                  builder: (context, state) {
                    if (state is HomeStates) {
                      if (state.isLoading) {
                        return Container(
                          height: ScreenUtils(context).height,
                          width: ScreenUtils(context).width,
                          child: Center(
                            child: Container(
                              width: 56,
                              height: 56,
                              child: CircularProgressIndicator(),
                            ),
                          ),
                        );
                      }

                      if (state.error != null) {
                        WidgetsBinding.instance.addPostFrameCallback((_) {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: DSText.titleLargeBold.draw(
                              state.error!,
                              color: DSColors.error[100],
                            ),
                          ));
                        });
                      }

                      // if (state.currentLocal == null) {
                      //   WidgetsBinding.instance.addPostFrameCallback((_) {
                      //     Modular.to.popUntil((route) => route.isFirst);
                      //     Modular.to.pushReplacementNamed(
                      //       Routes.home,
                      //       arguments: {
                      //         HomeStrings.keyUpdateLocal: true,
                      //       },
                      //     );
                      //   });
                      // }

                      return RealtimeContentWidget(
                        state: state,
                        onRefresh: () {
                          cubit.init();
                        },
                      );
                    }

                    return SizedBox.shrink();
                  }),
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: BlocBuilder(
          bloc: cubit,
          builder: (context, state) {
            if (state is HomeStates) {
              return DSButton.large.primary.filled(
                state.realtimeEntity.toName(),
                prefixIcon: Icons.gps_fixed,
                onPressed: () {
                  SchedulerBinding.instance.addPostFrameCallback((_) {
                    ChangeLocationPage.show(
                      context,
                      cubit,
                      showClose: true,
                    );
                  });
                },
              );
            }
            return SizedBox.shrink();
          }),
    );
  }
}
