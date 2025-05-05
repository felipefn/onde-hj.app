import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../design/colors.dart';
import '../../design/text_styles.dart';
import '../ondehj_circular_loader.dart';

class OndeHjButton extends ElevatedButton {
  final String title;
  final Widget? customWidget;
  final bool allCaps;
  final double elevation;
  final double verticalPadding;
  final double horizontalPadding;
  final bool isLoading;
  final bool withVerticalPadding;
  final TextStyle? textStyle;
  final int? titleMaxLines;

  final Color rippleColor;
  final Color normalColor;
  final Color disabledColor;
  final Color pressedColor;

  final Color textPressedColor;
  final Color textDisabledColor;
  final Color textNormalColor;

  final double borderWidth;
  final Color borderPressedColor;
  final Color borderDisabledColor;
  final Color borderNormalColor;

  OndeHjButton(
    VoidCallback? onPressed, {
    this.title = '',
    this.customWidget,
    this.allCaps = true,
    this.elevation = 0,
    this.verticalPadding = kIsWeb ? 24 : 12,
    this.horizontalPadding = 24,
    this.isLoading = false,
    this.withVerticalPadding = true,
    this.rippleColor = OndeHjColors.mercury10,
    this.textStyle,
    this.titleMaxLines = 1,
    required this.normalColor,
    required this.disabledColor,
    required this.pressedColor,
    required this.textPressedColor,
    required this.textDisabledColor,
    required this.textNormalColor,
    this.borderWidth = 0,
    this.borderPressedColor = OndeHjColors.transparent,
    this.borderDisabledColor = OndeHjColors.transparent,
    this.borderNormalColor = OndeHjColors.transparent,
    super.key,
  }) : super(
          onPressed: onPressed,
          child: !isLoading
              ? customWidget ??
                  Text(
                    allCaps ? title.toUpperCase() : title,
                    style: textStyle ?? OndeHjTextStyle.boldBody2,
                    maxLines: titleMaxLines,
                  )
              : const OndeHjCircularLoader(
                  color: OndeHjColors.white,
                  size: 20,
                ),
          style: ButtonStyle(
            shape: WidgetStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(100.0),
              ),
            ),
            overlayColor: WidgetStateProperty.all(
              rippleColor.withOpacity(0.4),
            ),
            side: _getBorder(
              borderPressedColor,
              borderDisabledColor,
              borderNormalColor,
              borderWidth,
            ),
            elevation: WidgetStateProperty.all(elevation),
            padding: WidgetStateProperty.all(
              EdgeInsets.symmetric(
                horizontal: horizontalPadding,
                vertical: withVerticalPadding ? verticalPadding : 0,
              ),
            ),
            foregroundColor: _getForegroundColor(
              textPressedColor,
              textDisabledColor,
              textNormalColor,
            ),
            backgroundColor: _getBackgroundColor(
              pressedColor,
              disabledColor,
              normalColor,
            ),
          ),
        );

  static _getBorder(
    Color pressedColor,
    Color disabledColor,
    Color normalColor,
    double borderWidth,
  ) {
    return WidgetStateProperty.resolveWith<BorderSide>(
      (Set<WidgetState> states) {
        if (states.contains(WidgetState.pressed)) {
          return BorderSide(color: pressedColor, width: borderWidth);
        }
        if (states.contains(WidgetState.disabled)) {
          return BorderSide(color: disabledColor, width: borderWidth);
        }
        return BorderSide(color: normalColor, width: borderWidth);
      },
    );
  }

  static _getForegroundColor(
    Color pressedColor,
    Color disabledColor,
    Color normalColor,
  ) {
    return WidgetStateProperty.resolveWith<Color>(
      (Set<WidgetState> states) {
        if (states.contains(WidgetState.pressed)) {
          return pressedColor;
        }
        if (states.contains(WidgetState.disabled)) {
          return disabledColor;
        }
        return normalColor;
      },
    );
  }

  static _getBackgroundColor(
    Color pressedColor,
    Color disabledColor,
    Color normalColor,
  ) {
    return WidgetStateProperty.resolveWith<Color>(
      (Set<WidgetState> states) {
        if (states.contains(WidgetState.pressed)) return pressedColor;
        if (states.contains(WidgetState.disabled)) {
          return disabledColor;
        }
        return normalColor;
      },
    );
  }
}
