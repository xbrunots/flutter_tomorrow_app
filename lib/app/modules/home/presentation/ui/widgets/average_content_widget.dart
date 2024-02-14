import 'package:flutter/material.dart';
import 'package:suamusica_weather/app/shared/shared.dart';

import '../../../../../design_system/design_system.dart';
import '../../../domain/entities/entities.dart';
import 'widgets.dart';

class AverageContentWidget extends StatelessWidget {
  final List<WeatherWeekEntity> data;

  const AverageContentWidget({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(16),
      width: ScreenUtils(context).width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color:  DSColors.neutral[80],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: data
            .map((e) =>
            AverageCardWidget(
              entity: e,
            ))
            .toList(),
      ),
    );
  }
}
