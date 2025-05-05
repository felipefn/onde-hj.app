import 'package:flutter/material.dart';

import '../../design/colors.dart';
import '../../design/text_styles.dart';

class OndeHjTextButton extends TextButton {
  OndeHjTextButton(
    String title,
    VoidCallback? onPressed, {
    TextStyle? style,
    super.key,
  }) : super(
          style: ButtonStyle(padding: WidgetStateProperty.all(EdgeInsets.zero)),
          child: Text(
            title,
            style: OndeHjTextStyle.boldBody1
                .copyWith(color: OndeHjColors.white)
                .merge(style),
          ),
          onPressed: onPressed,
        );
}
