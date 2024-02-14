part of 'ds_button.dart';

class DSButtonTypeImpl implements DSButtonType {
  const DSButtonTypeImpl._({
    required this.iconSize,
    required this.buttonColor,
    required this.contentStyle,
    required this.heightButton,
    required this.buttonSize,
  });

  final double iconSize;
  final Color buttonColor;
  final DSTextStyle contentStyle;
  final double heightButton;
  final ButtonSizeEnum buttonSize;

  @override
  DSElevatedButton filled(
    String textButton, {
    IconData? prefixIcon,
    IconData? suffixIcon,
    Function()? onPressed,
    bool expanded = false,
    bool isLoading = false,
    bool separetedIcon = false,
  }) =>
      DSElevatedButton(
        loadingWidget: DSLoadingSpinMode.dark.xSmall,
        separetedIcon: separetedIcon,
        isLoading: isLoading,
        expanded: expanded,
        iconSize: iconSize,
        suffixIcon: suffixIcon,
        preffixIcon: prefixIcon,
        content: contentStyle.draw(textButton),
        onPressed: onPressed,
        backgroundColor: buttonColor,
        height: heightButton,
        buttonSize: buttonSize,
        foregroundColor: DSColors.neutral[100],
        hoveredColor: _getHoveredColorWithEffectOpacityBlack(buttonColor, 0.2),
        disabledColor: DSColors.black[8],
        foregroundDisabledColor: DSColors.neutral[50]!,
      );

  @override
  DSElevatedButton tonal(
    String textButton, {
    IconData? prefixIcon,
    IconData? suffixIcon,
    Function()? onPressed,
    bool expanded = false,
    bool isLoading = false,
    bool separetedIcon = false,
  }) =>
      DSElevatedButton(
        loadingWidget: DSLoadingSpinMode.light.xSmall,
        separetedIcon: separetedIcon,
        isLoading: isLoading,
        expanded: expanded,
        iconSize: iconSize,
        suffixIcon: suffixIcon,
        preffixIcon: prefixIcon,
        content: contentStyle.draw(textButton),
        onPressed: onPressed,
        backgroundColor: DSColors.primary[80]!,
        height: heightButton,
        buttonSize: buttonSize,
        foregroundColor: DSColors.primary[30]!,
        foregroundDisabledColor: DSColors.neutral[50]!,
        borderSideColor: null,
        hoveredColor: _getHoveredColorWithEffectOpacityBlack(
          DSColors.primary[80]!,
          0.04,
        ),
        borderSidehoveredColor: null,
        disabledColor: DSColors.black[8]!,
      );

  @override
  DSElevatedButton outlined(
    String textButton, {
    IconData? prefixIcon,
    IconData? suffixIcon,
    Function()? onPressed,
    bool expanded = false,
    bool isLoading = false,
    bool separetedIcon = false,
  }) =>
      DSElevatedButton(
        loadingWidget: DSLoadingSpinMode.light.xSmall,
        separetedIcon: separetedIcon,
        isLoading: isLoading,
        expanded: expanded,
        iconSize: iconSize,
        suffixIcon: suffixIcon,
        preffixIcon: prefixIcon,
        content: contentStyle.draw(textButton),
        onPressed: onPressed,
        backgroundColor: Colors.transparent,
        height: heightButton,
        buttonSize: buttonSize,
        hoveredColor: DSColors.black[4]!,
        foregroundColor: buttonColor,
        foregroundDisabledColor: DSColors.neutral[50]!,
        borderSideColor: buttonColor,
        borderSidehoveredColor: buttonColor,
        borderSideDisabledColor: DSColors.neutral[60]!,
      );

  @override
  DSElevatedButton ghost(
    String textButton, {
    IconData? prefixIcon,
    IconData? suffixIcon,
    Function()? onPressed,
    bool isLoading = false,
    bool separetedIcon = false,
  }) =>
      DSElevatedButton(
        loadingWidget: DSLoadingSpinMode.light.xSmall,
        separetedIcon: separetedIcon,
        isLoading: isLoading,
        iconSize: iconSize,
        suffixIcon: suffixIcon,
        preffixIcon: prefixIcon,
        content: contentStyle.draw(textButton),
        onPressed: onPressed,
        backgroundColor: Colors.transparent,
        height: heightButton,
        buttonSize: buttonSize,
        foregroundColor: buttonColor,
        hoveredColor: DSColors.black[4]!,
        disabledColor: Colors.transparent,
        foregroundDisabledColor: DSColors.neutral[50]!,
      );

  @override
  DSElevatedButton iconFilled({
    required IconData icon,
    Function()? onPressed,
    bool isLoading = false,
  }) =>
      DSElevatedButton(
        loadingWidget: DSLoadingSpinMode.dark.xSmall,
        isLoading: isLoading,
        content: Icon(icon, size: iconSize),
        isIconButton: true,
        iconSize: iconSize,
        onPressed: onPressed,
        backgroundColor: buttonColor,
        height: heightButton,
        buttonSize: buttonSize,
        foregroundColor: DSColors.neutral[100]!,
        hoveredColor: _getHoveredColorWithEffectOpacityBlack(buttonColor, 0.2),
        disabledColor: DSColors.black[8]!,
        foregroundDisabledColor: DSColors.neutral[50]!,
      );

  @override
  DSElevatedButton iconTonal({
    required IconData icon,
    Function()? onPressed,
    bool isLoading = false,
  }) =>
      DSElevatedButton(
        loadingWidget: DSLoadingSpinMode.light.xSmall,
        isLoading: isLoading,
        content: Icon(icon, size: iconSize),
        isIconButton: true,
        iconSize: iconSize,
        onPressed: onPressed,
        backgroundColor: DSColors.black[8]!,
        height: heightButton,
        buttonSize: buttonSize,
        foregroundColor: buttonColor,
        foregroundDisabledColor: DSColors.neutral[50]!,
        borderSideColor: DSColors.black[10]!,
        hoveredColor: DSColors.black[10]!,
        borderSidehoveredColor: DSColors.black[20]!,
        disabledColor: DSColors.black[8]!,
      );

  @override
  DSElevatedButton iconOutlined({
    required IconData icon,
    Function()? onPressed,
    bool isLoading = false,
  }) =>
      DSElevatedButton(
        loadingWidget: DSLoadingSpinMode.light.xSmall,
        isLoading: isLoading,
        content: Icon(icon, size: iconSize),
        isIconButton: true,
        iconSize: iconSize,
        onPressed: onPressed,
        backgroundColor: Colors.transparent,
        height: heightButton,
        buttonSize: buttonSize,
        hoveredColor: DSColors.black[4]!,
        foregroundColor: buttonColor,
        foregroundDisabledColor: DSColors.neutral[50]!,
        borderSideColor: buttonColor,
        borderSidehoveredColor: buttonColor,
        borderSideDisabledColor: DSColors.neutral[60]!,
      );

  @override
  DSElevatedButton iconGhost({
    required IconData icon,
    Function()? onPressed,
    bool isLoading = false,
  }) =>
      DSElevatedButton(
        loadingWidget: DSLoadingSpinMode.light.xSmall,
        isLoading: isLoading,
        content: Icon(icon, size: iconSize),
        isIconButton: true,
        iconSize: iconSize,
        onPressed: onPressed,
        backgroundColor: Colors.transparent,
        height: heightButton,
        buttonSize: buttonSize,
        foregroundColor: buttonColor,
        hoveredColor: DSColors.black[4]!,
        disabledColor: Colors.transparent,
        foregroundDisabledColor: DSColors.neutral[50]!,
      );
}

Color _getHoveredColorWithEffectOpacityBlack(Color baseColor, double opacity) {
  Color overlayColor = Colors.black.withOpacity(opacity);
  Color combinedColor = Color.alphaBlend(overlayColor, baseColor);

  return combinedColor;
}
