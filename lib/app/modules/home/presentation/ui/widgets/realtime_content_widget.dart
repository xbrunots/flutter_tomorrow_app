import 'package:flutter/material.dart';

import '../../../../../design_system/design_system.dart';
import '../../../../../shared/data/local/weather_types_mock.dart';
import '../../../../../shared/domain/enums/weather_types_enum.dart';
import '../../../../../shared/shared.dart';
import '../../cubit/states/states.dart';
import '../utils/home_strings.dart';
import 'widgets.dart';

class RealtimeContentWidget extends StatelessWidget {
  final Function? onRefresh;
  final HomeStates state;

  const RealtimeContentWidget({super.key, this.onRefresh, required this.state});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: ScreenUtils(context).height,
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              height: 32,
            ),
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                children: [
                  DSImageAsset(
                    state.realtimeEntity.weatherCode.toString().getIconAssetByWeatherCode(),
                    width: 100,
                    height: 100,
                    assetNameForErrors: state.realtimeEntity.weatherCode.toString().getIconAssetDefault(),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  DSText.bodyPlusLarge.draw(
                    weatherTypes[state.realtimeEntity.weatherCode] ?? '',
                    color: DSColors.neutral[0],
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Container(
                    child: DSText.labelMediumBold.draw(
                        WeatherTypesEnum.fromValue(state.realtimeEntity.temperature).label.toUpperCase(),
                        color: WeatherTypesEnum.fromValue(state.realtimeEntity.temperature).textColor),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      color: WeatherTypesEnum.fromValue(state.realtimeEntity.temperature).color,
                    ),
                    padding: EdgeInsets.only(right: 8, left: 8, top: 4, bottom: 4),
                  ),
                  DSText.bodySuperExtraLargeBold.draw(state.realtimeEntity.temperature.toFriendlyTemperature,
                    color: DSColors.neutral[0],),
                  SizedBox(
                    width: 8,
                  ),
                  Container(
                    width: ScreenUtils(context).width,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        DSText.labelMediumBold.draw(HomeStrings.maxSubTitle(
                            state.weekList.first.forecast?.temperatureMax.toFriendlyTemperature),
                          color: DSColors.neutral[0],),
                        SizedBox(
                          width: 16,
                        ),
                        DSText.labelMediumBold.draw(HomeStrings.minSubTitle(
                            state.weekList.first.forecast?.temperatureMin.toFriendlyTemperature),
                          color: DSColors.neutral[0],),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  DSButton.medium.primary.tonal(
                    HomeStrings.update,
                    prefixIcon: state.isLoading != true ? Icons.sync : null,
                    isLoading: state.isLoading == true,
                    onPressed: () {
                      onRefresh?.call();
                    },
                  ),
                ],
              ),
            ),
            IntraDayContentWidget(
              data: state.intraDayList,
            ),
            AverageContentWidget(
              data: state.weekList,
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 32, left: 24, right: 24),
              child: DSText.labelMedium.draw(
                state.realtimeEntity.name,
                textAlign: TextAlign.center,
                color: DSColors.neutral[50],
              ),
            ),
            SizedBox(
              height: 40,
            ),
          ],
        ),
      ),
    );
  }
}
