import 'package:flutter/material.dart';

import '../../design_system.dart';

class DSTextField extends StatefulWidget {
  final Function(String)? onChange;
  final Function()? onSubmit;
  final Function()? onClose;
  final String? counterText;
  final String? labelText;
  final bool? autoFocus;
  final TextEditingController? controller;
  final FocusNode? focus;

  const DSTextField(
      {super.key,
      this.onChange,
      this.counterText,
      this.labelText,
      this.autoFocus,
      this.controller,
      this.focus,
      this.onSubmit,
      this.onClose});

  @override
  State<DSTextField> createState() => _DSTextFieldState();
}

class _DSTextFieldState extends State<DSTextField> {
  text() {
    return Container(
      color: DSColors.neutral[100],
      child: TextFormField(
        key: widget.key,
        cursorColor: DSColors.primary[0],
        autofocus: widget.autoFocus == true,
        showCursor: true,
        controller: widget.controller,
        keyboardType: TextInputType.text,
        focusNode: widget.focus,
        textAlign: TextAlign.start,
        style: DSText.headlineMedium.copyWith(color: DSColors.neutral[0]),
        onChanged: (value) {
          widget.onChange?.call(value);
        },
        decoration: InputDecoration(
          counterText: widget.counterText ?? '',
          border: OutlineInputBorder(
            borderSide: BorderSide(color: DSColors.wizard[50]!, width: 2),
          ),
          labelText: widget.labelText,
          labelStyle: DSText.labelMediumBold.copyWith(color: DSColors.wizard[50]),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: DSColors.wizard[50]!, width: 2),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: DSColors.wizard[50]!, width: 2),
          ),
          prefixIcon: DSButton.large.primary.iconGhost(
            icon: Icons.close,
            onPressed: () => widget.onClose?.call(),
          ),
          suffixIcon: DSButton.large.primary.filled(
            'OK',
            prefixIcon: Icons.check,
            onPressed: () => widget.onSubmit?.call(),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return text();
  }
}
