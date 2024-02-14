import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../design_system.dart';

final class DSTextStyle extends TextStyle {
  const DSTextStyle({
    super.inherit = true,
    super.color,
    super.backgroundColor,
    super.fontSize,
    super.fontWeight,
    super.fontStyle,
    super.letterSpacing,
    super.wordSpacing,
    super.textBaseline,
    super.height,
    super.leadingDistribution,
    super.locale,
    super.foreground,
    super.background,
    super.shadows,
    super.fontFeatures,
    super.fontVariations,
    super.decoration,
    super.decorationColor,
    super.decorationStyle,
    super.decorationThickness,
    super.debugLabel,
    super.fontFamily,
    super.fontFamilyFallback,
    super.overflow,
  });

  Widget draw(
    String text, {
    bool uppercase = false,
    bool loading = false,
    Color? color,
    StrutStyle? strutStyle,
    TextAlign? textAlign,
    TextDirection? textDirection,
    Locale? locale,
    bool? softWrap,
    TextOverflow? overflow,
    double? textScaleFactor,
    int? maxLines,
    String? semanticsLabel,
    TextWidthBasis? textWidthBasis,
    TextHeightBehavior? textHeightBehavior,
    Color? selectionColor,
    TextDecoration? decoration,
  }) {
    if (decoration == TextDecoration.underline) {
      return Container(
        padding: const EdgeInsets.only(bottom: 1),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: color ?? DSColors.neutral,
            ),
          ),
        ),
        child: _Text(
          text: text,
          maxLines: maxLines,
          color: color,
          locale: locale,
          overflow: overflow,
          selectionColor: selectionColor,
          loading: loading,
          semanticsLabel: semanticsLabel,
          softWrap: softWrap,
          strutStyle: strutStyle,
          textAlign: textAlign,
          textDirection: textDirection,
          textHeightBehavior: textHeightBehavior,
          textScaleFactor: textScaleFactor,
          textWidthBasis: textWidthBasis,
          uppercase: uppercase,
          textStyle: this,
          fontFamily: super.fontFamily,
          fontFamilyFallback: super.fontFamilyFallback,
        ),
      );
    }
    return _Text(
      text: text,
      maxLines: maxLines,
      color: color,
      locale: locale,
      overflow: overflow,
      selectionColor: selectionColor,
      semanticsLabel: semanticsLabel,
      softWrap: softWrap,
      strutStyle: strutStyle,
      loading: loading,
      fontFamily: super.fontFamily,
      fontFamilyFallback: super.fontFamilyFallback,
      textAlign: textAlign,
      textDirection: textDirection,
      textHeightBehavior: textHeightBehavior,
      textScaleFactor: textScaleFactor,
      textWidthBasis: textWidthBasis,
      uppercase: uppercase,
      decoration: decoration,
      textStyle:  this,
    );
  }
}

class _Text extends StatefulWidget {
  const _Text({
    Key? key,
    required this.text,
    this.color,
    this.uppercase = false,
    this.loading = false,
    this.strutStyle,
    this.textAlign,
    this.textDirection,
    this.locale,
    this.softWrap,
    this.overflow,
    this.textScaleFactor,
    this.maxLines,
    this.semanticsLabel,
    this.textWidthBasis,
    this.textHeightBehavior,
    this.selectionColor,
    this.decoration,
    this.fontFamily,
    this.fontFamilyFallback,
    required this.textStyle,
  }) : super(key: key);

  final String text;
  final bool uppercase;
  final Color? color;
  final StrutStyle? strutStyle;
  final TextAlign? textAlign;
  final TextDirection? textDirection;
  final Locale? locale;
  final bool? softWrap;
  final bool? loading;
  final TextOverflow? overflow;
  final double? textScaleFactor;
  final int? maxLines;
  final String? semanticsLabel;
  final TextWidthBasis? textWidthBasis;
  final TextHeightBehavior? textHeightBehavior;
  final Color? selectionColor;
  final TextDecoration? decoration;
  final String? fontFamily;
  final List<String>? fontFamilyFallback;
  final TextStyle textStyle;

  @override
  State<_Text> createState() => _TextState();
}

class _TextState extends State<_Text> with SingleTickerProviderStateMixin {
  final String package = 'vrs_micro_commons_design_system';
  late String text;
  late final AnimationController _animationController;

  bool get isLoading => widget.loading == true;

  @override
  void initState() {
    super.initState();
    text = widget.text;
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
    if (isLoading) _initLoadingListener();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _initLoadingListener() {
    _animationController.forward();
    _animationController.addStatusListener((status) async {
      switch (status) {
        case AnimationStatus.dismissed:
          _animationController.forward();
          break;
        case AnimationStatus.forward:
          text += '.';
          if (text.contains('....')) _resetLoadingText();
          break;
        case AnimationStatus.reverse:
          break;
        case AnimationStatus.completed:
          _animationController.reverse();
          break;
      }

      if (!isLoading) _resetLoadingText();
    });
  }

  void _resetLoadingText() => text = widget.text;

  bool get isAnimating => _animationController.isAnimating;

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      if (!isAnimating) _initLoadingListener();
      return AnimatedBuilder(
        animation: _animationController,
        builder: (_, oldWidget) {
          return Text(
            widget.uppercase ? text.toUpperCase() : text,
            style: widget.textStyle.copyWith(
              color: widget.color,
              decoration: widget.decoration,
              fontFamily: widget.fontFamily,
              fontFamilyFallback: widget.fontFamilyFallback,
              package: package,
            ),
            strutStyle: widget.strutStyle,
            textAlign: widget.textAlign,
            textDirection: widget.textDirection,
            locale: widget.locale,
            softWrap: widget.softWrap,
            overflow: widget.overflow,
            maxLines: widget.maxLines,
            semanticsLabel: widget.semanticsLabel,
            textWidthBasis: widget.textWidthBasis,
            textHeightBehavior: widget.textHeightBehavior,
            selectionColor: widget.selectionColor,
          );
        },
      );
    }
    return Text(
      widget.uppercase ? widget.text.toUpperCase() : widget.text,
      style: widget.textStyle.copyWith(
        color: widget.color,
        decoration: widget.decoration,
        fontFamily: widget.fontFamily,
        fontFamilyFallback: widget.fontFamilyFallback,
        package: package,
      ),
      strutStyle: widget.strutStyle,
      textAlign: widget.textAlign,
      textDirection: widget.textDirection,
      locale: widget.locale,
      softWrap: widget.softWrap,
      overflow: widget.overflow,
      maxLines: widget.maxLines,
      semanticsLabel: widget.semanticsLabel,
      textWidthBasis: widget.textWidthBasis,
      textHeightBehavior: widget.textHeightBehavior,
      selectionColor: widget.selectionColor,
    );
  }
}
