import 'package:flutter/material.dart';

import 'colors.dart';

class ThemeColors {
  late bool darkMode;
  static final instance = ThemeColors._();

  ThemeColors._();

  factory ThemeColors({bool? darkMode}) {
    instance.darkMode = darkMode == true;
    return instance;
  }

  MaterialColor primary() => instance.darkMode == true ? DSColorDark.primary : DSColorLight.primary;

  MaterialColor success() => instance.darkMode == true ? DSColorDark.success : DSColorLight.success;

  MaterialColor warning() => instance.darkMode == true ? DSColorDark.warning : DSColorLight.warning;

  MaterialColor neutral() => instance.darkMode == true ? DSColorDark.neutral : DSColorLight.neutral;

  MaterialColor error() => instance.darkMode == true ? DSColorDark.error : DSColorLight.error;

  MaterialColor wizard() => instance.darkMode == true ? DSColorDark.wizard : DSColorLight.wizard;

  MaterialColor black() => instance.darkMode == true ? DSColorDark.black : DSColorLight.black;

  MaterialColor white() => instance.darkMode == true ? DSColorDark.white : DSColorLight.white;
}
