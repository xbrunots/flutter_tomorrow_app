import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:suamusica_weather/app/modules/home/presentation/cubit/home_cubit.dart';

import '../../../../../design_system/design_system.dart';
import '../../../../../routes/routes.dart';
import '../widgets/widgets.dart';

class ChangeLocationPage extends StatefulWidget {
  final HomeCubit cubit;
  final String? currentLocal;
  final bool? showClose;

  const ChangeLocationPage({super.key, required this.cubit, this.currentLocal, this.showClose});

  @override
  State<ChangeLocationPage> createState() => _ChangeLocationPageState();

  static show(BuildContext context, HomeCubit cubit, {bool? showClose, String? currentLocal}) {
    showDialog(
      barrierDismissible: false,
      useRootNavigator: false,
      context: context,
      builder: (context) => Theme(
        data: ThemeData(
          dialogBackgroundColor: DSColors.neutral[100],
          dialogTheme: DialogTheme(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            backgroundColor: DSColors.neutral[100],
          ),
        ),
        child: Dialog(
          insetPadding: EdgeInsets.zero,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          backgroundColor: DSColors.neutral[100],
          elevation: 0,
          child: ChangeLocationPage(
            cubit: cubit,
            showClose: showClose,
            currentLocal: currentLocal,
          ),
        ),
      ),
    );
  }
}

class _ChangeLocationPageState extends State<ChangeLocationPage> {
  @override
  Widget build(BuildContext context) {
    return ChangeLocationWidget(
      currentLocal: widget.currentLocal,
      showClose: widget.showClose,
      onSubmit: (local) async {
        await widget.cubit.setCurrentLocal(local);
        Modular.to.pushNamed(
          Routes.home,
        );
      },
      onRequestPermission: () async {
        await widget.cubit.requestPermission();
        Modular.to.pushNamed(
          Routes.home,
        );
      },
    );
  }
}
