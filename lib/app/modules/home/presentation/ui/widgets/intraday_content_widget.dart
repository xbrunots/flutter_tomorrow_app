import 'package:flutter/material.dart';
import 'package:suamusica_weather/app/modules/home/presentation/ui/utils/home_strings.dart';

import '../../../../../design_system/design_system.dart';
import '../../../domain/entities/entities.dart';
import 'widgets.dart';

class IntraDayContentWidget extends StatelessWidget {
  final List<WeatherIntraDayEntity> data;

  const IntraDayContentWidget({
    super.key,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: DSColors.neutral[80],
      ),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: DSText.labelMediumBold.draw(
              HomeStrings.intraDayTitle,
              textAlign: TextAlign.center,
              color: DSColors.neutral[50],
            ),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: data
                    .map((e) => IntraDayCardWidget(
                          entity: e,
                        ))
                    .toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
