import 'package:flutter/material.dart';

import '../../design/colors.dart';
import 'ondehj_button.dart';

class OndeHjOutlineGhostButton extends OndeHjButton {
  OndeHjOutlineGhostButton(
    String title,
    super.onPressed, {
    super.allCaps = false,
    super.isLoading,
    super.elevation,
    super.customWidget,
    super.titleMaxLines,
    super.key,
  }) : super(
          title: title,
          borderWidth: 1,
          verticalPadding: 0,
          rippleColor: OndeHjColors.white,
          normalColor: Colors.transparent,
          disabledColor: Colors.transparent,
          pressedColor: Colors.transparent,
          textPressedColor: OndeHjColors.supernovaOriginal,
          textDisabledColor: OndeHjColors.mercury30,
          textNormalColor: OndeHjColors.white,
          borderPressedColor: OndeHjColors.mercury10,
          borderDisabledColor: OndeHjColors.transparent,
          borderNormalColor: OndeHjColors.supernovaCrystal,
        );
}
