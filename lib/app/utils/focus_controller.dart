import 'package:flutter/material.dart';

class FocusController {
  FocusNode focusNode = FocusNode();

  addListener(Function(bool hasfocus) callback) {
    focusNode.addListener(() => callback(focusNode.hasFocus));
  }

  dispose() {
    focusNode.dispose();
  }
}
