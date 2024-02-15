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
import '../widgets/widgets.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final cubit = Modular.get<HomeCubit>();
  bool showLocalSearch = false;
  TextEditingController controller = TextEditingController();
  FocusNode focus = FocusNode();

  @override
  void initState() {
    super.initState();
    cubit.init();
  }

  @override
  void dispose() {
    controller.dispose();
    focus.dispose();
    super.dispose();
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
            Visibility(
              visible: showLocalSearch,
              child: Form(
                child: DSTextField(
                  controller: controller,
                  focus: focus,
                  autoFocus: showLocalSearch == true,
                  onSubmit: () async {
                    await cubit.setCurrentLocal(controller.text);
                    controller.clear();
                    setState(() {
                      showLocalSearch = false;
                    });
                  },
                  onClose: () {
                    setState(() {
                      showLocalSearch = false;
                    });
                  },
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          BlocBuilder(
              bloc: cubit,
              builder: (context, state) {
                if (state is HomeStates) {
                  return DSButton.large.primary.filled(
                    cubit.currentLocal,
                    prefixIcon: showLocalSearch ? Icons.close : Icons.edit_outlined,
                    onPressed: () {
                      setState(() {
                        showLocalSearch = !showLocalSearch;
                      });
                    },
                  );
                }
                return SizedBox.shrink();
              }),
          SizedBox(
            width: 8,
          ),
          DSButton.large.primary.iconFilled(
            icon: Icons.gps_fixed,
            onPressed: () {
              SchedulerBinding.instance.addPostFrameCallback((_) {
                ChangeLocationPage.show(
                  context,
                  cubit,
                  showClose: true,
                );
              });
            },
          ),
        ],
      ),
    );
  }
}
