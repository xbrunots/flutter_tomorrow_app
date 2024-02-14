import 'package:flutter/material.dart';

class DSImageAsset extends StatelessWidget {
  const DSImageAsset(
    this.assetName, {
    super.key,
    this.width,
    this.height,
    this.assetNameForErrors,
  });

  final String assetName;
  final String? assetNameForErrors;
  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    try {
      return Container(
        width: width ?? 100,
        height: height ?? 100,
        child: Image.asset(assetName),
      );
    } catch (e) {
      if (assetNameForErrors == null) {
        return Container(
          width: width ?? 100,
          height: height ?? 100,
          child: Image.asset('assets/images/logo.png'),
        );
      }
      return Container(
        width: width ?? 100,
        height: height ?? 100,
        child: Image.asset(assetNameForErrors!),
      );
    }
  }
}
