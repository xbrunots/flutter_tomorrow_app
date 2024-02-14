import 'package:flutter/material.dart';

class ScreenUtils {
  late BuildContext context;

  static final instance = ScreenUtils._();

  ScreenUtils._();

  factory ScreenUtils(BuildContext context) {
    instance.context = context;
    return instance;
  }

  double get width => MediaQuery.of(context).size.width;

  double get height => MediaQuery.of(context).size.height;
}
