import 'package:flutter/material.dart';

import '../../../../utils/design/colors.dart';
import '../../../../utils/design/text_styles.dart';

class UserImage extends StatelessWidget {
  final String url;
  final String userInitials;
  final double fontSize;

  const UserImage(
    this.url, {
    required this.userInitials,
    this.fontSize = 60,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return url.isEmpty
        ? Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: OndeHjColors.white, width: 2),
            ),
            child: Center(
              child: Text(
                userInitials,
                style: OndeHjTextStyle.boldHeader1.copyWith(
                  color: OndeHjColors.white,
                  fontSize: fontSize,
                ),
              ),
            ),
          )
        : FadeInImage(
            key: key,
            placeholder: transparent,
            image: url.isEmpty
                ? transparent
                : NetworkImage(url) as ImageProvider,
            fit: BoxFit.cover,
            placeholderFit: BoxFit.cover,
            imageErrorBuilder: (
              BuildContext context,
              Object error,
              StackTrace? stackTrace,
            ) {
              return Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: OndeHjColors.white, width: 2),
                ),
                child: Center(
                  child: Text(
                    userInitials,
                    style: OndeHjTextStyle.boldHeader1.copyWith(
                      color: OndeHjColors.white,
                      fontSize: fontSize,
                    ),
                  ),
                ),
              );
            },
            fadeInDuration: const Duration(milliseconds: 300),
          );
  }
}

   const transparent = AssetImage(
    'lib/src/assets/imgs/transparent.png',
  );
