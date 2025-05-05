import 'package:flutter/material.dart';
import 'package:heroicons/heroicons.dart';

import '../../../../utils/design/colors.dart';
import '../../../../utils/design/text_styles.dart';
import '../../domain/entities/profile_menu_item.dart';

class ProfileMenuButton extends StatelessWidget {
  final ProfileMenuItem item;
  final Widget? customTrailing;

  const ProfileMenuButton(
    this.item, {
    this.customTrailing,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: item.action,
          highlightColor: OndeHjColors.neutral200.withOpacity(0.3),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
            ),
            padding: const EdgeInsets.symmetric(
              vertical: 12,
              horizontal: 8,
            ),
            width: double.maxFinite,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    HeroIcon(
                      item.icon,
                      size: 20,
                      color: item.customColor ?? OndeHjColors.neutral500,
                    ),
                    const SizedBox(width: 16),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          item.title,
                          style: OndeHjTextStyle.mediumBody1.copyWith(
                            color:
                                item.customColor ?? OndeHjColors.neutral800,
                          ),
                        ),
                        const SizedBox(height: 2),
                        if (item.subtitle != null)
                          Text(
                            item.subtitle ?? '',
                            style: OndeHjTextStyle.regularBody2.copyWith(
                              color: OndeHjColors.neutral600,
                            ),
                          ),
                      ],
                    ),
                  ],
                ),
                if (item.showArrow || customTrailing != null)
                  customTrailing ??
                      const Icon(
                        Icons.chevron_right_rounded,
                        color: OndeHjColors.sunPrimary,
                        size: 20,
                      )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
