import 'package:flutter/material.dart';

enum WeatherTypesEnum {
  extremeHigh(value: 40, label: 'Extremamente quente', color: Color(0xFF7F1026), textColor: Colors.white),
  mediumHigh(value: 35, label: 'Muito quente', color: Color(0xFFEC3954), textColor: Colors.white),
  High(value: 30, label: 'Quente', color: Color(0xFFF07C8A), textColor: Colors.black),
  average(value: 25, label: 'Meio fresco', color: Color(0xFFC9A6F9), textColor: Colors.black),
  averageLow(value: 20, label: 'Fresco', color: Color(0xFFB7E8C8), textColor: Colors.black),
  low(value: 15, label: 'Frio', color: Color(0xFF5BCCF5), textColor: Colors.black),
  mediumLow(value: 10, label: 'Muito frio', color: Color(0xFF2DB0E0), textColor: Colors.black),
  extremeLow(value: 5, label: 'Extremamente frio', color: Color(0xFF0495CC), textColor: Colors.black);

  final String label;
  final int value;
  final Color color;
  final Color textColor;

  const WeatherTypesEnum({
    required this.label,
    required this.value,
    required this.color,
    required this.textColor,
  });

  static WeatherTypesEnum fromValue(int value) {
    if (value < mediumLow.value) {
      return extremeLow;
    }
    if (value > extremeLow.value && value < averageLow.value) {
      return mediumLow;
    }

    if (value > mediumLow.value && value < average.value) {
      return averageLow;
    }

    if (value > averageLow.value && value < High.value) {
      return average;
    }
    if (value > average.value && value < mediumHigh.value) {
      return High;
    }
    if (value > High.value && value < extremeHigh.value) {
      return mediumHigh;
    }
    if (value > mediumHigh.value) {
      return extremeHigh;
    }

    return average;
  }
}
