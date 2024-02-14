import 'package:flutter/material.dart';

import 'ds_button.dart';

class DSElevatedButton extends StatelessWidget {
  const DSElevatedButton({
    required this.content,
    required this.height,
    this.iconSize,
    super.key,
    this.preffixIcon,
    this.suffixIcon,
    this.onPressed,
    this.foregroundColor,
    this.backgroundColor,
    this.extendButton,
    this.isIconButton = false,
    required this.buttonSize,
    required this.hoveredColor,
    this.disabledColor,
    this.foregroundDisabledColor,
    this.borderSideColor,
    this.borderSidehoveredColor,
    this.borderSideDisabledColor,
    this.expanded = false,
    required this.isLoading,
    this.separetedIcon = false,
    required this.loadingWidget,
  });

  final double? iconSize;
  final Function()? onPressed;
  final IconData? preffixIcon;
  final IconData? suffixIcon;
  final Widget content;
  final Color? foregroundColor;
  final double height;
  final Color? backgroundColor;
  final double? extendButton;
  final bool isIconButton;
  final Color hoveredColor;
  final Color? disabledColor;
  final Color? foregroundDisabledColor;
  final Color? borderSideColor;
  final Color? borderSidehoveredColor;
  final Color? borderSideDisabledColor;
  final bool expanded;
  final bool isLoading;
  final bool separetedIcon;

  final ButtonSizeEnum buttonSize;
  final Widget loadingWidget;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: ElevatedButton(
        style: ButtonStyle(
          side: MaterialStateProperty.resolveWith((states) => _getBorderSide(states)),
          padding: MaterialStateProperty.all(_getPadding(buttonSize)),
          backgroundColor: MaterialStateProperty.resolveWith((states) => _getBackgroundButton(states)),
          elevation: MaterialStateProperty.all(0),
          splashFactory: NoSplash.splashFactory,
          foregroundColor: MaterialStateProperty.resolveWith((states) => _getForegroundColor(states)),
          shadowColor: MaterialStateProperty.all(Colors.transparent),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          ),
          minimumSize: MaterialStateProperty.all(Size(36, height)),
        ),
        onPressed: onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: expanded ? MainAxisSize.max : MainAxisSize.min,
          children: [
            if (preffixIcon != null) ...[
              Icon(preffixIcon!, size: iconSize),
              separetedIcon ? const Expanded(child: SizedBox()) : const SizedBox(width: 8),
            ],
            isLoading ? loadingWidget : content,
            if (suffixIcon != null) ...[
              separetedIcon ? const Expanded(child: SizedBox()) : const SizedBox(width: 8),
              Icon(suffixIcon!, size: iconSize),
            ],
          ],
        ),
      ),
    );
  }

  EdgeInsetsGeometry _getPadding(ButtonSizeEnum buttonSize) {
    const EdgeInsetsGeometry defaultPadding = EdgeInsets.symmetric(horizontal: 24);
    late EdgeInsetsGeometry? buttonPadding;

    if (preffixIcon == null && suffixIcon == null && !isIconButton) {
      if (buttonSize == ButtonSizeEnum.large) {
        buttonPadding = const EdgeInsets.symmetric(horizontal: 24);
      } else if (buttonSize == ButtonSizeEnum.medium) {
        buttonPadding = const EdgeInsets.symmetric(horizontal: 20);
      } else if (buttonSize == ButtonSizeEnum.small) {
        buttonPadding = const EdgeInsets.symmetric(horizontal: 16);
      }
    } else if (preffixIcon != null) {
      if (buttonSize == ButtonSizeEnum.large) {
        buttonPadding = const EdgeInsets.only(left: 16, right: 24);
      } else if (buttonSize == ButtonSizeEnum.medium) {
        buttonPadding = const EdgeInsets.only(left: 12, right: 20);
      } else if (buttonSize == ButtonSizeEnum.small) {
        buttonPadding = const EdgeInsets.only(left: 8, right: 16);
      }
    } else if (suffixIcon != null) {
      if (buttonSize == ButtonSizeEnum.large) {
        buttonPadding = const EdgeInsets.only(left: 24, right: 16);
      } else if (buttonSize == ButtonSizeEnum.medium) {
        buttonPadding = const EdgeInsets.only(left: 20, right: 12);
      } else if (buttonSize == ButtonSizeEnum.small) {
        buttonPadding = const EdgeInsets.only(left: 16, right: 8);
      }
    } else if (isIconButton) {
      if (buttonSize == ButtonSizeEnum.large) {
        buttonPadding = const EdgeInsets.symmetric(horizontal: 14);
      } else if (buttonSize == ButtonSizeEnum.medium) {
        buttonPadding = const EdgeInsets.symmetric(horizontal: 12);
      } else if (buttonSize == ButtonSizeEnum.small) {
        buttonPadding = const EdgeInsets.symmetric(horizontal: 10);
      }
    }

    return buttonPadding ?? defaultPadding;
  }

  BorderSide _getBorderSide(states) {
    if (states.contains(MaterialState.hovered)) {
      return BorderSide(color: borderSidehoveredColor ?? Colors.transparent, width: 1);
    }

    if (states.contains(MaterialState.disabled)) {
      return BorderSide(color: borderSideDisabledColor ?? Colors.transparent, width: 1);
    }

    return BorderSide(color: borderSideColor ?? Colors.transparent, width: 1);
  }

  Color _getBackgroundButton(states) {
    if (states.contains(MaterialState.hovered)) return hoveredColor;
    if (states.contains(MaterialState.disabled)) return disabledColor ?? Colors.transparent;

    return backgroundColor ?? Colors.transparent;
  }

  Color _getForegroundColor(states) {
    if (states.contains(MaterialState.hovered)) return foregroundColor ?? Colors.transparent;
    if (states.contains(MaterialState.disabled)) return foregroundDisabledColor ?? Colors.transparent;

    return foregroundColor ?? Colors.transparent;
  }
}
