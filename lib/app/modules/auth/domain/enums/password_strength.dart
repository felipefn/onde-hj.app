import 'package:flutter/material.dart';

enum PasswordStrength {
  undefined(0, Colors.transparent, false),
  weak(0.33, Colors.red, false),
  medium(0.66, Colors.amber, true),
  strong(1, Colors.green, true);

  const PasswordStrength(this.value, this.color, this.isAcceptable);
  final double value;
  final Color color;
  final bool isAcceptable;
}
