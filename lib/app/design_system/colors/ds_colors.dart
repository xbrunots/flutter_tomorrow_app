import '../design_system.dart';

class DSColors {
  static var darkMode = false;
  static var primary = darkMode ? DSColorDark.primary : DSColorLight.primary;
  static var success = darkMode ? DSColorDark.success : DSColorLight.success;
  static var warning = darkMode ? DSColorDark.warning : DSColorLight.warning;
  static var error = darkMode ? DSColorDark.error : DSColorLight.error;
  static var wizard = darkMode ? DSColorDark.wizard : DSColorLight.wizard;
  static var black = darkMode ? DSColorDark.black : DSColorLight.black;
  static var white = darkMode ? DSColorDark.white : DSColorLight.white;
  static var neutral = darkMode ? DSColorDark.neutral : DSColorLight.neutral;

  static setDarkMode(bool isDark) {
    darkMode = isDark;
    primary = darkMode ? DSColorDark.primary : DSColorLight.primary;
    success = darkMode ? DSColorDark.success : DSColorLight.success;
    warning = darkMode ? DSColorDark.warning : DSColorLight.warning;
    error = darkMode ? DSColorDark.error : DSColorLight.error;
    wizard = darkMode ? DSColorDark.wizard : DSColorLight.wizard;
    black = darkMode ? DSColorDark.black : DSColorLight.black;
    white = darkMode ? DSColorDark.white : DSColorLight.white;
    neutral = darkMode ? DSColorDark.neutral : DSColorLight.neutral;
  }
}
