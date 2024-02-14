part of 'ds_loading_spin_mode.dart';

abstract class DSLoadingSpinSize {
  final DSLoadingCircularProgress large;
  final DSLoadingCircularProgress medium;
  final DSLoadingCircularProgress small;
  final DSLoadingCircularProgress xSmall;

  DSLoadingSpinSize({
    required this.large,
    required this.medium,
    required this.small,
    required this.xSmall,
  });
}

class DSLoadingSpinSizeBase implements DSLoadingSpinSize {
  final Color primaryColor;
  final Color secondaryColor;

  DSLoadingSpinSizeBase._({
    required this.primaryColor,
    required this.secondaryColor,
  });

  @override
  DSLoadingCircularProgress get large => DSLoadingCircularProgress(
        size: 64,
        primaryColor: primaryColor,
        secondaryColor: secondaryColor,
        strokeWidth: 9,
      );

  @override
  DSLoadingCircularProgress get medium => DSLoadingCircularProgress(
        size: 48,
        primaryColor: primaryColor,
        secondaryColor: secondaryColor,
        strokeWidth: 7,
      );

  @override
  DSLoadingCircularProgress get small => DSLoadingCircularProgress(
        size: 32,
        primaryColor: primaryColor,
        secondaryColor: secondaryColor,
        strokeWidth: 5,
      );

  @override
  DSLoadingCircularProgress get xSmall => DSLoadingCircularProgress(
        size: 20,
        primaryColor: primaryColor,
        secondaryColor: secondaryColor,
        strokeWidth: 4,
      );
}
