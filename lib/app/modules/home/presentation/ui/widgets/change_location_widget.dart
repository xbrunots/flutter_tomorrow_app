import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:lottie/lottie.dart';
import 'package:suamusica_weather/app/modules/home/presentation/ui/utils/home_strings.dart';
import 'package:suamusica_weather/app/shared/shared.dart';

import '../../../../../design_system/design_system.dart';

class ChangeLocationWidget extends StatefulWidget {
  final Function(String)? onSubmit;
  final Function()? onRequestPermission;
  final String? currentLocal;

  const ChangeLocationWidget({super.key, this.onSubmit, this.currentLocal, this.onRequestPermission});

  @override
  State<ChangeLocationWidget> createState() => _ChangeLocationWidgetState();
}

class _ChangeLocationWidgetState extends State<ChangeLocationWidget> {
  final GlobalKey<TooltipState> tooltipKey = GlobalKey<TooltipState>();
  late TextEditingController controller;
  late FocusNode focus;
  String local = '';
  bool loading = false;

  @override
  void initState() {
    super.initState();
    controller = TextEditingController();
    focus = FocusNode();
    tooltipKey.currentState?.ensureTooltipVisible();
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
    focus.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: DSColors.neutral[100],
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      IconButton.filledTonal(onPressed: () => Modular.to.pop(), icon: Icon(Icons.close)),
                      SizedBox(
                        width: 8,
                      ),
                      DSText.titleLargeBold.draw(
                        HomeStrings.changeLocationTitle.toUpperCase(),
                        color: DSColors.neutral[0],
                      ),
                    ],
                  ),
                  Lottie.asset('assets/lottie/location.json', height: 200, repeat: false),
                  DSText.bodyLargeBold.draw(
                    HomeStrings.changeLocationDetails,
                    color: DSColors.primary[0],
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  TextField(
                    controller: controller,
                    focusNode: focus,
                    keyboardType: TextInputType.streetAddress,
                    textAlign: TextAlign.start,
                    style: DSText.headlineMedium,
                    onTap: () {
                      tooltipKey.currentState?.ensureTooltipVisible();
                    },
                    onChanged: (value) {
                      local = value;
                      setState(() {});
                    },
                    decoration: InputDecoration(
                        counterText: HomeStrings.changeLocationCounterText,
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: DSColors.wizard[50]!, width: 2),
                        ),
                        labelText: widget.currentLocal != null
                            ? widget.currentLocal!.toUpperCase()
                            : HomeStrings.myLocal.toUpperCase(),
                        labelStyle: DSText.labelMediumBold.copyWith(color: DSColors.wizard[50]),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: DSColors.wizard[50]!, width: 2),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: DSColors.wizard[50]!, width: 2),
                        ),
                        suffixIcon: Tooltip(
                          message: HomeStrings.clickHereForUseULocation,
                          verticalOffset: -66,
                          key: tooltipKey,
                          triggerMode: TooltipTriggerMode.manual,
                          showDuration: const Duration(seconds: 1),
                          child: Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Container(
                              child: loading
                                  ? CircularProgressIndicator()
                                  : IconButton.filledTonal(
                                      onPressed: () {
                                        setState(() {
                                          loading = true;
                                        });
                                        widget.onRequestPermission?.call();
                                      },
                                      focusColor: DSColors.wizard[100],
                                      icon: Icon(
                                        Icons.gps_fixed_outlined,
                                      )),
                            ),
                          ),
                        )),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  DSButton.large.wizard.filled(HomeStrings.searchLocal,
                      expanded: true,
                      onPressed: local.isNotEmpty
                          ? () {
                              setState(() {
                                loading = true;
                              });
                              widget.onSubmit?.call(controller.text);
                            }
                          : null),
                ],
              ),
            ),
            Positioned(
                left: 0,
                top: 0,
                child: Visibility(
                  visible: loading,
                  child: Container(
                    width: ScreenUtils(context).width,
                    height: ScreenUtils(context).height * 0.6,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Lottie.asset(
                          'assets/lottie/happy_map_loading.json',
                          repeat: true,
                          width: ScreenUtils(context).width * 0.8,
                        ),
                        DSText.bodyPlusLarge.draw(
                          HomeStrings.loadingText,
                          color: DSColors.primary[0],
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                    color: DSColors.neutral[100]!.withOpacity(0.9),
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
