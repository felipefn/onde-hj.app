import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:heroicons/heroicons.dart';


class ProfileMenuItem extends Equatable {
  final String title;
  final String? subtitle;
  final HeroIcons icon;
  final void Function() action;
  final bool showArrow;
  final Color? customColor;

  const ProfileMenuItem({
    required this.title,
    required this.icon,
    required this.action,
    this.subtitle,
    this.showArrow = true,
    this.customColor,
  });

  @override
  List<Object?> get props => [
        title,
        subtitle,
        icon,
        action,
        showArrow,
        customColor,
      ];
}
