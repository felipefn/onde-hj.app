import 'package:flutter/material.dart';

import '../../../design/colors.dart';

class OndeHjCircleButtonStyle {
  final double? size;
  final double elevation;
  final Color? rippleColor;
  final Color fillColor;
  final Color borderColor;
  final Color borderDisabledColor;
  final Color disabledColor;
  final Color shadowColor;
  final double borderWidth;

  const OndeHjCircleButtonStyle({
    this.size,
    this.elevation = 0,
    this.rippleColor,
    this.fillColor = OndeHjColors.white,
    this.disabledColor = OndeHjColors.neutral600,
    this.borderWidth = 1,
    this.borderColor = OndeHjColors.transparent,
    this.shadowColor = OndeHjColors.transparent,
    this.borderDisabledColor = OndeHjColors.transparent,
  });
}
