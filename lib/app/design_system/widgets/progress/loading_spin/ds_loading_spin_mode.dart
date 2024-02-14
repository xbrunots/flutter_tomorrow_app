import 'package:flutter/material.dart';

import '../../../colors/ds_colors.dart';
import 'ds_loading_circular_progress.dart';

part 'ds_loading_spin_size.dart';

class DSLoadingSpinMode {
  DSLoadingSpinMode._();

  static DSLoadingSpinSize get dark => DSLoadingSpinSizeBase._(
        primaryColor: DSColors.neutral[100]!,
        secondaryColor: Colors.transparent,
      );

  static DSLoadingSpinSize get light => DSLoadingSpinSizeBase._(
        primaryColor: DSColors.primary[10]!,
        secondaryColor: Colors.transparent,
      );
}
