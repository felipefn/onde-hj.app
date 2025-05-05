import 'package:flutter/material.dart';

import '../design/colors.dart';
import '../design/text_styles.dart';
import 'buttons/ondehj_primary_button.dart';
import 'buttons/ondehj_text_button.dart';

class OndeHjDialog extends StatelessWidget {
  final bool dismissible;
  final String message;
  final String? negativeButtonTitle;
  final Function(BuildContext context)? onPositiveButtonPressed;
  final Function(BuildContext context)? onNegativeButtonPressed;
  final String? positiveButtonTitle;
  final bool showCloseIcon;
  final String title;
  final MainAxisAlignment buttonsAlignment;
  final Widget? customContent;
  final double outsideMargin;
  final double? maxHeight;

  const OndeHjDialog({
    this.dismissible = true,
    this.message = '',
    this.negativeButtonTitle,
    this.onPositiveButtonPressed,
    this.onNegativeButtonPressed,
    this.positiveButtonTitle,
    this.showCloseIcon = true,
    required this.title,
    this.buttonsAlignment = MainAxisAlignment.start,
    this.customContent,
    this.outsideMargin = 16,
    this.maxHeight,
    super.key,
  });

  show(
    BuildContext context, [
    Function(dynamic value)? onClose,
  ]) {
    showGeneralDialog(
      barrierLabel: 'Barrier',
      barrierDismissible: dismissible,
      barrierColor: Colors.black.withOpacity(0.5),
      transitionDuration: const Duration(milliseconds: 300),
      context: context,
      pageBuilder: (_, __, ___) {
        return this;
      },
      transitionBuilder: (_, anim, __, child) {
        return SlideTransition(
          position: Tween(
            begin: const Offset(0, 1),
            end: const Offset(0, 0),
          ).animate(anim),
          child: child,
        );
      },
    ).then((value) => onClose?.call(value));
  }

  @override
  Widget build(BuildContext context) {
    bool showPositiveButton =
        positiveButtonTitle != null && onPositiveButtonPressed != null;
    bool showNegativeButton =
        negativeButtonTitle != null && onNegativeButtonPressed != null;

    final hasButtons = showPositiveButton || showNegativeButton;

    final positiveButton = showPositiveButton
        ? Container(
            margin: const EdgeInsets.only(right: 16),
            child: OndeHjPrimaryButton(
              positiveButtonTitle ?? '',
              () => onPositiveButtonPressed?.call(context),
            ))
        : Container();

    final negativeButton = showNegativeButton
        ? OndeHjTextButton(
            negativeButtonTitle ?? '',
            () => onNegativeButtonPressed?.call(context),
          )
        : Container();

    return Material(
      type: MaterialType.transparency,
      child: SafeArea(
        child: Center(
          child: Container(
            constraints:
                BoxConstraints(minHeight: 100, maxHeight: maxHeight ?? 800),
            margin: EdgeInsets.all(outsideMargin),
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: OndeHjColors.white,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: double.maxFinite,
                  child: Text(
                    title,
                    textAlign: TextAlign.center,
                    style: OndeHjTextStyle.boldHeader3.copyWith(
                      color: OndeHjColors.neutral800,
                    ),
                  ),
                ),
                const SizedBox(height: 28),
                Flexible(
                  child: SizedBox(
                    width: double.maxFinite,
                    child: customContent ??
                        SingleChildScrollView(
                          child: SizedBox(
                            width: double.maxFinite,
                            child: Text(
                              message,
                              textAlign: TextAlign.center,
                              style: OndeHjTextStyle.regularTitle2.copyWith(
                                color: OndeHjColors.neutral600,
                              ),
                            ),
                          ),
                        ),
                  ),
                ),
                if (hasButtons) const SizedBox(height: 28),
                if (hasButtons)
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: buttonsAlignment,
                    children: [
                      negativeButton,
                      const SizedBox(width: 16),
                      Expanded(child: positiveButton),
                    ],
                  )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
