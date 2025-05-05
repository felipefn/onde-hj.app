import 'package:flutter/material.dart';

import '../../../design/colors.dart';
import 'ondehj_circle_button_style.dart';

class OndeHjCircleButton extends StatelessWidget {
  final Widget child;
  final VoidCallback? onPressed;
  final OndeHjCircleButtonStyle style;

  const OndeHjCircleButton({
    required this.child,
    required this.onPressed,
    this.style = const OndeHjCircleButtonStyle(),
    super.key,
  });

  OndeHjCircleButton.withIcon(
    IconData icon,
    this.onPressed, {
    this.style = const OndeHjCircleButtonStyle(),
    double? iconSize,
    Color iconColor = OndeHjColors.sunPrimary,
    Color iconDisabledColor = OndeHjColors.neutral500,
    super.key,
  }) : child = Icon(icon,
            size: iconSize ?? (style.size ?? 40) / 3,
            color: onPressed == null ? iconDisabledColor : iconColor);

  OndeHjCircleButton.withImage(
    AssetImage image,
    this.onPressed, {
    this.style = const OndeHjCircleButtonStyle(),
    double padding = 10,
    Color iconColor = OndeHjColors.sunPrimary,
    Color iconDisabledColor = OndeHjColors.neutral500,
    super.key,
  }) : child = Padding(
            padding: EdgeInsets.all(padding),
            child: ImageIcon(
              image,
              color: onPressed == null ? iconDisabledColor : iconColor,
            ));

  @override
  Widget build(BuildContext context) {
    bool hasAction = onPressed != null;
    Color color = hasAction ? style.fillColor : style.disabledColor;
    Color? highLightColor = hasAction ? null : OndeHjColors.transparent;
    Color splashColor = hasAction
        ? (style.rippleColor ?? OndeHjColors.neutral200.withOpacity(0.3))
        : OndeHjColors.transparent;
    Color borderColor =
        hasAction ? style.borderColor : style.borderDisabledColor;
    BorderSide borderSide =
        BorderSide(width: style.borderWidth, color: borderColor);

    return Theme(
      data: ThemeData(shadowColor: style.shadowColor),
      child: SizedBox(
        width: style.size,
        height: style.size,
        child: RawMaterialButton(
          onPressed: onPressed,
          elevation: style.elevation,
          constraints: const BoxConstraints(),
          shape: CircleBorder(side: borderSide),
          fillColor: color,
          splashColor: splashColor,
          highlightColor: highLightColor,
          child: child,
        ),
      ),
    );
  }
}
