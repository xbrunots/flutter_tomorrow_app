import 'package:flutter/material.dart';
import 'package:suamusica_weather/app/design_system/colors/colors.dart';

final appTheme  = ThemeData(
  useMaterial3: true,
  listTileTheme: const ListTileThemeData(
    minLeadingWidth: 0,
  ),
  bottomSheetTheme: BottomSheetThemeData(
    backgroundColor: DSColors.neutral[100],
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(10),
        topRight: Radius.circular(10),
      ),
    ),
  ),
  colorScheme: ColorScheme.fromSeed(
    seedColor: const Color(0xFF1AADE3),
    primary: const Color(0xFF1AADE3),
    onPrimary: const Color(0xFFFFFFFF),
    primaryContainer: const Color(0xFFE8F7FC),
    onPrimaryContainer: const Color(0xFF116D8E),
    background: Color(0xFFFFFFFF),
    onBackground: const Color(0xFF172E37),
    surface: const Color(0xFFFFFFFF),
    onSurface: const Color(0xFF172E37),
    error: const Color(0xFFCE2A2A),
    onError: const Color(0xFFFFFFFF),
    onErrorContainer: const Color(0xFF801717),
    errorContainer: const Color(0xFFFFCECE),
    brightness: Brightness.light,
  ),
  appBarTheme: const AppBarTheme(
    foregroundColor: Colors.white,
    backgroundColor: Color(0xFFFFFFFF),
  ),
  scaffoldBackgroundColor: const Color(0xFFFFFFFF),
  textButtonTheme: TextButtonThemeData(
    style: ButtonStyle(
      shape: MaterialStateProperty.all(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(6),
        ),
      ),
    ),
  ),
  progressIndicatorTheme: const ProgressIndicatorThemeData(
    color: Color(0xFF1AADE3),
  ),
);