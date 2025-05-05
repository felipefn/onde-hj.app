import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../design/colors.dart';
import '../focus_controller.dart';
import '../design/text_styles.dart';

class OndeHjTextField extends StatefulWidget {
  final bool autocorrect;
  final TextEditingController? controller;
  final bool enabled;
  final String? errorMessage;
  final String hint;
  final Color borderColor;
  final Color fontColor;
  final Widget? leftIcon;
  final Widget? rightIcon;
  final List<TextInputFormatter>? inputFormatters;
  final TextInputType keyboardType;
  final String label;
  final int? maxLength;
  final bool obscureText;
  final TextCapitalization textCapitalization;
  final FocusController? focusController;
  final bool autofocus;

  final bool readOnly;
  final bool showCounterText;
  final TextAlign textAlign;
  final double? fontSize;
  final TextInputAction? inputAction;
  final List<String>? autofillHints;
  final ValueChanged<String>? onChanged;
  final VoidCallback? onEditingComplete;
  final ValueChanged<String>? onSubmitted;
  final VoidCallback? onTap;
  final bool Function(String)? validator;
  final bool validOnInit;
  final Key? fieldKey;
  final String? description;

  const OndeHjTextField({
    this.autocorrect = false,
    this.controller,
    this.enabled = true,
    this.errorMessage,
    this.hint = '',
    this.leftIcon,
    this.rightIcon,
    this.inputFormatters,
    this.keyboardType = TextInputType.text,
    this.label = '',
    this.maxLength,
    this.obscureText = false,
    this.textCapitalization = TextCapitalization.none,
    this.focusController,
    this.autofocus = false,
    this.autofillHints,
    this.onChanged,
    this.onEditingComplete,
    this.onSubmitted,
    this.inputAction,
    this.onTap,
    this.readOnly = false,
    this.textAlign = TextAlign.start,
    this.fontSize,
    this.showCounterText = false,
    this.validator,
    this.validOnInit = false,
    this.fieldKey,
    this.description = "",
    this.borderColor = OndeHjColors.white,
    this.fontColor = OndeHjColors.black,
    super.key,
  });

  @override
  OndeHjTextFieldState createState() => OndeHjTextFieldState();
}

class OndeHjTextFieldState extends State<OndeHjTextField> {
  final _backgroundColor = OndeHjColors.white;
  late final _focusController = widget.focusController ?? FocusController();

  static const _borderWidth = 1.0;

  late final _focusedBorderColor = Theme.of(context).colorScheme.secondary;
  static const _errorBorderColor = OndeHjColors.rubyOriginal;

  bool _focused = false;
  late bool isFieldValid =
      widget.validOnInit ? widget.errorMessage == null : true;
  late String currentText = widget.controller?.text ?? '';

  @override
  void initState() {
    super.initState();

    isFieldValid = widget.validOnInit ? widget.errorMessage == null : true;
    if (widget.validOnInit && widget.validator != null) {
      isFieldValid =
          widget.validator?.call(currentText) ?? widget.errorMessage == null;
    }

    final formatters = widget.inputFormatters ?? [];
    if (formatters.isNotEmpty && currentText.isNotEmpty) {
      for (var element in formatters) {
        widget.controller?.value = element.formatEditUpdate(
          TextEditingValue.empty,
          TextEditingValue(text: currentText),
        );
      }
    }

    _focusController.addListener((hasFocus) {
      setState(() => _focused = hasFocus);
    });
  }

  @override
  Widget build(BuildContext context) {
    final normalBorderColor = widget.borderColor;

    Color textColor =
        widget.enabled ? widget.fontColor : OndeHjColors.black;

    final hasLabel = widget.label.isNotEmpty;
    final hasError = widget.errorMessage != null && !isFieldValid;
    final hasEmptyError = hasError && (widget.errorMessage?.isEmpty ?? false);

    final defaultBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide(
        color: hasEmptyError ? _errorBorderColor : normalBorderColor,
        width: _borderWidth,
      ),
    );

    final focusedBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide(
        color: hasEmptyError ? _errorBorderColor : normalBorderColor,
        width: _borderWidth,
      ),
    );

    final errorBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: const BorderSide(
        color: _errorBorderColor,
        width: _borderWidth,
      ),
    );

    Color labelColor = Colors.red;
    if (hasError) {
      labelColor = _errorBorderColor;
    }

    if (!hasError && _focused) {
      labelColor = _focusedBorderColor;
    }

    final collapse = (hasLabel && currentText.isNotEmpty) ||
        (hasLabel && widget.hint.isEmpty);

    final label = Text(
      widget.label,
      style: OndeHjTextStyle.boldBody2.copyWith(color: labelColor),
    );

    final labelContainer = Container(
      margin: const EdgeInsets.only(bottom: 4),
      child: label,
    );

    final iconWidget = widget.leftIcon != null
        ? Container(
            padding: EdgeInsets.only(
              right: 10,
              top: collapse ? 6 : 0,
            ),
            child: Container(
              padding: const EdgeInsets.all(10),
              child: widget.leftIcon,
            ),
          )
        : null;

    final rightIconWidget = widget.rightIcon != null
        ? Container(
            padding: const EdgeInsets.only(left: 10),
            child: Container(
              padding: const EdgeInsets.all(10),
              child: widget.rightIcon,
            ),
          )
        : null;

    final textStyle = OndeHjTextStyle.regularBody1.copyWith(
      color: textColor,
      fontSize: widget.fontSize,
    );

    final hintStyle = OndeHjTextStyle.regularBody1.copyWith(
      color: OndeHjColors.mercury30,
    );

    final errorStyle = OndeHjTextStyle.regularBody2.copyWith(
      color: _errorBorderColor,
    );

    if (widget.validator == null && widget.errorMessage != null) {
      isFieldValid = false;
    }

    return Column(
      children: [
        Stack(
          children: [
            TextField(
              textAlign: widget.textAlign,
              autofocus: widget.autofocus,
              autocorrect: widget.autocorrect,
              autofillHints: widget.autofillHints,
              textCapitalization: widget.textCapitalization,
              controller: widget.controller,
              onTap: widget.onTap,
              readOnly: widget.readOnly,
              key: widget.fieldKey,
              cursorColor: _focusedBorderColor,
              decoration: InputDecoration(
                border: defaultBorder,
                contentPadding: EdgeInsets.fromLTRB(
                  8,
                  hasLabel ? 20 : 12,
                  8,
                  12,
                ),
                enabledBorder: defaultBorder,
                errorBorder: errorBorder,
                errorStyle: errorStyle,
                errorText:
                    hasError && !hasEmptyError ? widget.errorMessage : null,
                errorMaxLines: 3,
                fillColor: widget.enabled
                    ? _backgroundColor
                    : OndeHjColors.mercury10,
                filled: true,
                focusedBorder: focusedBorder,
                focusedErrorBorder: errorBorder,
                hintStyle: hintStyle,
                hintText: widget.hint,
                hoverColor: OndeHjColors.offwhite,
                prefixIcon: iconWidget,
                suffixIconConstraints: const BoxConstraints(maxHeight: 44),
                prefixIconConstraints: const BoxConstraints(maxHeight: 44),
                suffixIcon: rightIconWidget,
                isCollapsed: !hasLabel || collapse,
                counterText: widget.showCounterText ? null : '',
              ),
              enabled: widget.enabled,
              focusNode: _focusController.focusNode,
              inputFormatters: widget.inputFormatters,
              keyboardType: widget.keyboardType,
              maxLength: widget.maxLength,
              obscureText: widget.obscureText,
              style: textStyle,
              textInputAction: widget.inputAction,
              onChanged: (newValue) {
                widget.onChanged?.call(newValue);
                setState(() {
                  isFieldValid = widget.validator?.call(newValue) ??
                      widget.errorMessage == null;
                  currentText = newValue;
                });
              },
              onEditingComplete: widget.onEditingComplete,
              onSubmitted: widget.onSubmitted,
            ),
            if ((widget.hint.isEmpty && hasLabel) ||
                (hasLabel && currentText.isNotEmpty))
              Positioned(top: 4, left: 8, child: labelContainer),
          ],
        ),
      ],
    );
  }

  @override
  void dispose() {
    _focusController.dispose();
    super.dispose();
  }
}
