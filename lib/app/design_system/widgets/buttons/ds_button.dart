import 'package:flutter/material.dart';

import '../../colors/colors.dart';
import '../../typography/typography.dart';
import '../progress/progress.dart';
import 'ds_button_widget.dart';

part 'ds_button_type.dart';
part 'ds_button_type_impl.dart';

class DSButton {
  static ButtonTint get large => ButtonTint._(
        iconSize: 24,
        contentStyle: DSText.labelLarge,
        heightButton: 52,
        buttonSize: ButtonSizeEnum.large,
      );

  static ButtonTint get medium => ButtonTint._(
        iconSize: 24,
        contentStyle: DSText.labelLarge,
        heightButton: 44,
        buttonSize: ButtonSizeEnum.medium,
      );

  static ButtonTint get small => ButtonTint._(
        iconSize: 16,
        contentStyle: DSText.labelMedium,
        heightButton: 36,
        buttonSize: ButtonSizeEnum.small,
      );
}

class ButtonTint extends DSButton {
  ButtonTint._({
    required this.iconSize,
    required this.contentStyle,
    required this.heightButton,
    required this.buttonSize,
  });

  final double iconSize;
  final DSTextStyle contentStyle;
  final double heightButton;
  final ButtonSizeEnum buttonSize;

  DSButtonType get primary => DSButtonTypeImpl._(
        iconSize: iconSize,
        contentStyle: contentStyle,
        buttonColor: DSColors.primary[20]!,
        heightButton: heightButton,
        buttonSize: buttonSize,
      );

  DSButtonType get error => DSButtonTypeImpl._(
        iconSize: iconSize,
        contentStyle: contentStyle,
        buttonColor: DSColors.error[40]!,
        heightButton: heightButton,
        buttonSize: buttonSize,
      );

  DSButtonType get wizard => DSButtonTypeImpl._(
        iconSize: iconSize,
        contentStyle: contentStyle,
        buttonColor: DSColors.wizard[40]!,
        heightButton: heightButton,
        buttonSize: buttonSize,
      );
}

enum ButtonSizeEnum { large, medium, small }
