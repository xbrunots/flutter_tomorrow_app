import 'package:flutter/material.dart';
import 'package:suamusica_weather/app/shared/shared.dart';

import '../../../../../design_system/design_system.dart';

class ChangeLocationInputWidget extends StatefulWidget {
  final Function(String)? onSubmit;
  final Function(String)? onChange;
  final Function()? onRequestPermission;
  final String? currentLocal;
  final bool? showClose;
  final bool? autoFocus;

  const ChangeLocationInputWidget({
    super.key,
    this.onSubmit,
    this.currentLocal,
    this.onRequestPermission,
    this.showClose,
    this.autoFocus,
    this.onChange,
  });

  @override
  State<ChangeLocationInputWidget> createState() => _ChangeLocationInputWidgetState();
}

class _ChangeLocationInputWidgetState extends State<ChangeLocationInputWidget> {
  String local = '';
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    double screenWidth = ScreenUtils(context).width;
    double screenHeight = ScreenUtils(context).height;

    return Container(
      color: DSColors.neutral[100],
      width: screenWidth,
      height: 60,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: screenWidth - 100,
                child: DSTextField(
                  autoFocus: widget.autoFocus == true,
                  onChange: (value) {
                    local = value;
                    widget.onChange?.call(value);
                  },
                ),
              ),
              IconButton.filledTonal(
                onPressed: () {
                  widget.onSubmit?.call(local);
                },
                icon: Icon(Icons.search),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
