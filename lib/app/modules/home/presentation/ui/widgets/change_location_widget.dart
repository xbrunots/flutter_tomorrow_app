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
  final bool? showClose;

  const ChangeLocationWidget({
    super.key,
    this.onSubmit,
    this.currentLocal,
    this.onRequestPermission,
    this.showClose,
  });

  @override
  State<ChangeLocationWidget> createState() => _ChangeLocationWidgetState();
}

class _ChangeLocationWidgetState extends State<ChangeLocationWidget> {
  String local = '';
  bool loading = false;

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
              reverse: true,
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
                  Visibility(
                      visible: widget.onSubmit != null,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 16.0),
                        child: DSTextField(),
                      )),
                  Visibility(
                    visible: widget.onSubmit != null,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 16.0),
                      child: DSButton.large.wizard.filled(HomeStrings.searchLocal,
                          expanded: true,
                          prefixIcon: Icons.search,
                          onPressed: local.isNotEmpty
                              ? () {
                                  setState(() {
                                    loading = true;
                                  });

                                  widget.onSubmit?.call(local);
                                }
                              : null),
                    ),
                  ),
                  SizedBox(
                    height: 32,
                  ),
                  DSButton.large.wizard.tonal(HomeStrings.getLocal.toUpperCase(),
                      expanded: true, prefixIcon: Icons.gps_fixed_outlined, onPressed: () {
                    setState(() {
                      loading = true;
                    });

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
