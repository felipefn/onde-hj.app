import '../../design/colors.dart';
import 'ondehj_button.dart';

class OndeHjPrimaryButton extends OndeHjButton {
  OndeHjPrimaryButton(
    String title,
    super.onPressed, {
    super.allCaps = false,
    super.isLoading,
    super.withVerticalPadding,
    super.elevation,
    super.customWidget,
    super.titleMaxLines,
    super.key,
  }) : super(
          title: title,
          borderWidth: 0,
          rippleColor: OndeHjColors.supernovaLight,
          normalColor: OndeHjColors.supernovaOriginal,
          disabledColor: OndeHjColors.mercury10,
          pressedColor: OndeHjColors.supernovaOriginal,
          textPressedColor: OndeHjColors.white,
          textDisabledColor: OndeHjColors.mercury30,
          textNormalColor: OndeHjColors.white,
          borderPressedColor: OndeHjColors.transparent,
          borderDisabledColor: OndeHjColors.transparent,
          borderNormalColor: OndeHjColors.transparent,
        );
}
