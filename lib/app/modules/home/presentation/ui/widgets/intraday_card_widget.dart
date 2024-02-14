import 'package:flutter/material.dart';
import 'package:suamusica_weather/app/modules/home/presentation/ui/utils/home_strings.dart';
import 'package:suamusica_weather/app/shared/shared.dart';

import '../../../../../design_system/design_system.dart';
import '../../../domain/entities/entities.dart';

class IntraDayCardWidget extends StatelessWidget {
  final WeatherIntraDayEntity entity;

  const IntraDayCardWidget({super.key, required this.entity});

  @override
  Widget build(BuildContext context) {
    bool isToday = DateTime.parse(entity.time!).isToday() == true;
    bool isNow = DateTime.parse(entity.time!).hourIsNow() == true;

    return Container(
      padding: EdgeInsets.all(16),
      decoration: isNow
          ? BoxDecoration(
              color: DSColors.neutral[100]!.withOpacity(0.8),
              borderRadius: BorderRadius.circular(10),
            )
          : null,
      child: Column(
        children: [
          Visibility(
            visible: !isToday,
            child: DSText.titleMedium.draw(DateTime.parse(entity.time!).toFormattedString('EEEE'),
                color: DSColors.neutral[isToday ? 10 : 60]),
          ),
          DSText.titleMediumBold.draw(
              isNow
                  ? HomeStrings.now
                  : DateTime.parse(entity.time!)
                      .toFormattedString(isToday ? 'HH' : 'HH:mm', suffix: isToday ? 'H' : ''),
              color: DSColors.neutral[isToday ? 10 : 60]),
          SizedBox(
            height: 8,
          ),
          DSImageAsset(
            (entity.forecast?.weatherCode).toString().getIconAssetByWeatherCode(),
            width: 28,
            height: 28,
            assetNameForErrors: (entity.forecast?.weatherCode).toString().getIconAssetDefault(),
          ),
          SizedBox(
            height: 8,
          ),
          DSText.titleMediumBold.draw(
            entity.forecast!.temperature.toFriendlyTemperature,
            color: DSColors.neutral[isToday ? 10 : 50],
          ),
        ],
      ),
    );
  }
}
