import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:lottie/lottie.dart';
import 'package:suamusica_weather/app/modules/home/presentation/ui/utils/home_strings.dart';
import 'package:suamusica_weather/app/shared/shared.dart';

import '../../../../../design_system/design_system.dart';

class ChangeLocationWidget extends StatefulWidget {
  final Function(String)? onSubmit;
  final Function()? onRequestPermission;
  final String? currentLocal;
  final bool? showClose;

  const ChangeLocationWidget({
    super.key,
    this.onSubmit,
    this.currentLocal,
    this.onRequestPermission, this.showClose,
  });

  @override
  State<ChangeLocationWidget> createState() => _ChangeLocationWidgetState();
}

class _ChangeLocationWidgetState extends State<ChangeLocationWidget> {
  String local = '';
  bool loading = false;
  late TextEditingController controller;
  late FocusNode focus;

  @override
  void initState() {
    controller = TextEditingController();
    focus = FocusNode();
    super.initState();
  }

  @override
  void dispose() {
    focus.dispose();
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = ScreenUtils(context).width;
    double screenHeight = ScreenUtils(context).height;

    return Container(
      color: DSColors.neutral[100],
      width: screenWidth,
      height: screenHeight,
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
                      Visibility(
                          visible: widget.currentLocal != null || widget.showClose == true,
                          child: IconButton.filledTonal(onPressed: () => Modular.to.pop(), icon: Icon(Icons.close))),
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
                  GestureDetector(
                    child: TextFormField(
                      cursorColor: DSColors.primary[0],
                      autocorrect: true,
                      autofocus: false,
                      textInputAction: TextInputAction.none,
                      controller: controller,
                      focusNode: focus,
                      textAlign: TextAlign.start,
                      style: DSText.headlineMedium.copyWith(color: DSColors.neutral[0]),
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
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  DSButton.large.wizard.filled(HomeStrings.searchLocal,
                      expanded: true,
                      prefixIcon: Icons.search,
                      onPressed: local.isNotEmpty
                          ? () {
                              setState(() {
                                loading = true;
                              });
                              SystemChannels.textInput.invokeMethod('TextInput.hide');

                              widget.onSubmit?.call(local);
                            }
                          : null),
                  SizedBox(
                    height: 16,
                  ),
                  DSText.bodyLargeBold.draw(
                    HomeStrings.or,
                    color: DSColors.primary[0],
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  DSButton.large.wizard.tonal(HomeStrings.getLocal.toUpperCase(),
                      expanded: true, prefixIcon: Icons.gps_fixed_outlined, onPressed: () {
                    setState(() {
                      loading = true;
                    });
                    SystemChannels.textInput.invokeMethod('TextInput.hide');

                    widget.onRequestPermission?.call();
                  }),
                ],
              ),
            ),
            Positioned(
                left: 0,
                top: 0,
                child: Visibility(
                  visible: loading,
                  child: Container(
                    width: screenWidth,
                    height: screenHeight,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Lottie.asset(
                          'assets/lottie/happy_map_loading.json',
                          repeat: true,
                          width: screenWidth * 0.8,
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
