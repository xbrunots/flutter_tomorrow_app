import 'package:flutter/material.dart';
import 'package:suamusica_weather/app/modules/home/presentation/ui/utils/home_strings.dart';
import 'package:suamusica_weather/app/shared/shared.dart';

import '../../../../../design_system/design_system.dart';
import '../../../domain/entities/entities.dart';

class AverageCardWidget extends StatelessWidget {
  final WeatherWeekEntity entity;

  const AverageCardWidget({super.key, required this.entity});

  @override
  Widget build(BuildContext context) {
    bool isToday = DateTime.parse(entity.time!).isToday() == true;

    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
          border: Border(
              bottom: BorderSide(
        color: DSColors.neutral[0]!.withOpacity(0.1),
        width: 1,
      ))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          DSText.titleMediumBold.draw(
              isToday ? HomeStrings.today : DateTime.parse(entity.time!).toFormattedString('EEE').toUpperCase(),
              color: DSColors.neutral[10]),
          SizedBox(
            height: 8,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              DSImageAsset(
                (entity.forecast?.weatherCodeMax).toString().getIconAssetByWeatherCode(),
                width: 48,
                height: 48,
                assetNameForErrors: (entity.forecast?.weatherCodeMax).toString().getIconAssetDefault(),
              ),
              Visibility(
                visible: entity.forecast!.rainIntensityAvg > 0,
                child: DSText.titleMediumBold.draw(
                  entity.forecast!.rainIntensityAvg.rainPercents,
                  color: DSColors.neutral[10],
                ),
              ),
            ],
          ),
          SizedBox(
            height: 8,
          ),
          DSText.titleLargeBold.draw(
            'Mín: ${entity.forecast!.temperatureMin.toFriendlyTemperatureLite}',
            color: DSColors.neutral[60],
          ),
          SizedBox(
            height: 8,
          ),
          Row(
            children: [
              DSText.titleLargeBold.draw(
                'Máx: ${entity.forecast!.temperatureMax.toFriendlyTemperatureLite}',
                color: DSColors.neutral[10],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
