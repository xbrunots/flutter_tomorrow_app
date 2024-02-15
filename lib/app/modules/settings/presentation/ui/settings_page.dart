import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:suamusica_weather/app/modules/settings/presentation/cubit/settings_cubit.dart';
import 'package:suamusica_weather/app/modules/settings/presentation/cubit/states/clear_cache_state.dart';
import 'package:suamusica_weather/app/modules/settings/presentation/ui/utils/settings_strings.dart';
import 'package:suamusica_weather/app/shared/shared.dart';

import '../../../../design_system/design_system.dart';
import '../../../../design_system/widgets/utils/restart_widget.dart';
import '../../../../shared/env/env.dart';
import '../cubit/states/states.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  final cubit = Modular.get<SettingsCubit>();
  bool currentEnable = true;

  @override
  void initState() {
    super.initState();
    cubit.get();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: DSColors.neutral[100],
      body: SafeArea(
        child: BlocBuilder(
            bloc: cubit,
            builder: (context, state) {
              if (state is ResetUIState || state is ClearCacheState) {
                WidgetsBinding.instance.addPostFrameCallback((_) {
                  RestartWidget.restartApp(context);
                });
              }

              if (state is LoadingState) {
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

              if (state is DarkModeState) {
                currentEnable = state.darkMode == true;
              }

              return Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        DSButton.large.primary.iconGhost(
                          icon: Icons.close,
                          onPressed: () => Modular.to.pop(),
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        DSText.titleLargeBold.draw(
                          SettingsStrings.settings,
                          color: DSColors.neutral[0],
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 24),
                    child: SingleChildScrollView(
                      child: Container(
                        width: ScreenUtils(context).width,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: 24,
                            ),
                            DSText.titleLargeBold
                                .draw(SettingsStrings.darkMode.toUpperCase(), color: DSColors.neutral[0]),

                            Container(
                              padding: EdgeInsets.all(0),
                              margin: EdgeInsets.only(bottom: 16, top: 16),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  GestureDetector(
                                    child: Container(
                                      padding: EdgeInsets.all(8),
                                      decoration: BoxDecoration(
                                          color: currentEnable ? DSColors.success[50] : DSColors.neutral[80],
                                          borderRadius: BorderRadius.circular(10)),
                                      child: DSImageAsset(
                                        'assets/images/dark_theme.png',
                                        width: (ScreenUtils(context).width * 0.50) - 60,
                                        height: 128,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    onTap: () {
                                      cubit.set(true);
                                    },
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      cubit.set(false);
                                    },
                                    child: Container(
                                      padding: EdgeInsets.all(8),
                                      decoration: BoxDecoration(
                                          color: currentEnable ? DSColors.neutral[80] : DSColors.success[50],
                                          borderRadius: BorderRadius.circular(10)),
                                      child: DSImageAsset(
                                        'assets/images/light_theme.png',
                                        width: (ScreenUtils(context).width * 0.50) - 60,
                                        height: 128,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.all(24),
                              margin: EdgeInsets.only(bottom: 16),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16),
                                color: DSColors.neutral[80],
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  DSText.titleLargeBold.draw(
                                    SettingsStrings.keyTitle,
                                    color: DSColors.neutral[0],
                                    textAlign: TextAlign.start,
                                  ),
                                  SizedBox(
                                    height: 16,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      DSText.labelMediumBold.draw(Env.tomorrowTokenKey1, color: DSColors.neutral[0]),
                                      CupertinoSwitch(
                                        value: Env.tomorrowTokenKey1 == Env.tomorrowToken,
                                        onChanged: (value) {
                                          if (value) {
                                            cubit.changeToken(Env.tomorrowTokenKey1);
                                          }
                                        },
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 4,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      DSText.labelMediumBold.draw(Env.tomorrowTokenKey2, color: DSColors.neutral[0]),
                                      CupertinoSwitch(
                                        value: Env.tomorrowTokenKey2 == Env.tomorrowToken,
                                        onChanged: (value) {
                                          if (value) {
                                            cubit.changeToken(Env.tomorrowTokenKey2);
                                          }
                                        },
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 4,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      DSText.labelMediumBold.draw(Env.tomorrowTokenKey3, color: DSColors.neutral[0]),
                                      CupertinoSwitch(
                                        value: Env.tomorrowTokenKey3 == Env.tomorrowToken,
                                        onChanged: (value) {
                                          if (value) {
                                            cubit.changeToken(Env.tomorrowTokenKey3);
                                          }
                                        },
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.all(24),
                              margin: EdgeInsets.only(bottom: 16),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16),
                                color: DSColors.neutral[80],
                              ),
                              child: DSButton.large.error.tonal(
                                SettingsStrings.clearCache.toUpperCase(),
                                expanded: true,
                                onPressed: () => cubit.clearCache(),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: DSText.labelLarge.draw(
                          SettingsStrings.footerText,
                          textAlign: TextAlign.center,
                          color: DSColors.neutral[50],
                        ),
                      ),
                      DSText.labelPlusLargeBold.draw(
                        SettingsStrings.whatsApp,
                        textAlign: TextAlign.center,
                        color: DSColors.neutral[0],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: DSButton.large.primary.outlined(
                          'VOLTAR',
                          expanded: true,
                          onPressed: () => Modular.to.pop(),
                        ),
                      ),
                    ],
                  )
                ],
              );
            }),
      ),
    );
  }
}
