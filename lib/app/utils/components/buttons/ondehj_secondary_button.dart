import '../../design/colors.dart';
import 'ondehj_button.dart';

class OndeHjSecondaryButton extends OndeHjButton {
  OndeHjSecondaryButton(
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
          borderWidth: 0,
          rippleColor: OndeHjColors.supernovaLight,
          normalColor: OndeHjColors.white,
          disabledColor: OndeHjColors.mercury10,
          pressedColor: OndeHjColors.supernovaOriginal,
          textPressedColor: OndeHjColors.white,
          textDisabledColor: OndeHjColors.mercury30,
          textNormalColor: OndeHjColors.supernovaOriginal,
          borderPressedColor: OndeHjColors.transparent,
          borderDisabledColor: OndeHjColors.transparent,
          borderNormalColor: OndeHjColors.transparent,
        );
}
