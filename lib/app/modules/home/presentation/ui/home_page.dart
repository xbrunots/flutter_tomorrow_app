import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:lottie/lottie.dart';
import 'package:suamusica_weather/app/modules/home/presentation/cubit/home_cubit.dart';
import 'package:suamusica_weather/app/modules/home/presentation/cubit/states/home_state.dart';
import 'package:suamusica_weather/app/shared/shared.dart';

import '../../../../design_system/design_system.dart';
import 'widgets/widgets.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final cubit = Modular.get<HomeCubit>();

  @override
  void initState() {
    super.initState();
    cubit.init();
  }

  void createModalChangeLocation(HomeCubit cubit) {
    showModalBottomSheet<void>(
      isScrollControlled: true,
      useRootNavigator: true,
      isDismissible: false,
      enableDrag: true,
      useSafeArea: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(topLeft: Radius.circular(16), topRight: Radius.circular(16)),
      ),
      constraints: BoxConstraints(
        maxWidth: ScreenUtils(context).width,
        maxHeight: ScreenUtils(context).height * 0.9,
      ),
      backgroundColor: Colors.transparent,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      context: context,
      builder: (BuildContext context) {
        return Padding(
          padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: BlocBuilder(
              bloc: cubit,
              builder: (context, state) {
                if (state is HomeStates) {
                  return ChangeLocationWidget(
                    currentLocal: state.currentLocal,
                    onSubmit: (local) async {
                      await cubit.setCurrentLocal(local);
                      Modular.to.pop();
                    },
                    onRequestPermission: () async {
                      await cubit.requestPermission();
                      Modular.to.pop();
                    },
                  );
                }

                return SizedBox.shrink();
              }),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: DSColors.neutral[100],
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
        
                      if (state.currentLocal == null) {
                        return SafeArea(
                          child: ChangeLocationWidget(
                            currentLocal: state.currentLocal,
                            onSubmit: (local) async {
                              await cubit.setCurrentLocal(local);
                              Modular.to.pop();
                            },
                            onRequestPermission: () async {
                              await cubit.requestPermission();
                              Modular.to.pop();
                            },
                          ),
                        );
                      }
        
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
              return state.currentLocal == null
                  ? SizedBox.shrink()
                  : DSButton.large.primary.filled(
                      state.realtimeEntity.toName(),
                      prefixIcon: Icons.gps_fixed,
                      onPressed: () => createModalChangeLocation(cubit),
                    );
            }

            return SizedBox.shrink();
          }),
    );
  }
}
