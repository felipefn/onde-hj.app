import 'package:flutter/material.dart';

import '../../design/colors.dart';
import 'ondehj_snackbar_type.dart';

class OndeHjSnackbar extends StatelessWidget {
  final OndeHjSnackbarType type;
  final String? information;
  final Widget? customInformationWidget;
  final Color? customColor;
  final VoidCallback? onClosePressed;
  final double? width;
  final EdgeInsets? padding;

  const OndeHjSnackbar(
    this.type, {
    this.information,
    this.customColor,
    this.customInformationWidget,
    this.onClosePressed,
    this.width,
    this.padding = const EdgeInsets.all(16),
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      color: type.backgroundColor,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Flexible(
            child: SizedBox(
              width: width,
              child: customInformationWidget ??
                  Text(
                    information ?? '',
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: OndeHjColors.white,
                      fontSize: 16,
                    ),
                  ),
            ),
          ),
          if (onClosePressed != null) const SizedBox(width: 12),
          if (onClosePressed != null)
            IconButton(
              padding: EdgeInsets.zero,
              constraints: const BoxConstraints(maxWidth: 40),
              onPressed: onClosePressed,
              icon: const Icon(Icons.close, color: Colors.white),
              iconSize: 24,
            ),
        ],
      ),
    );
  }
}
