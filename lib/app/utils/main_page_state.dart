import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class MainPageState<TWidget extends StatefulWidget, TBind extends Object>
    extends State<TWidget> {
  late final String pageTag = _getPageTag();
  final TBind store = Modular.get();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void setState(fn) {
    if (mounted) {
      super.setState(fn);
    }
  }

  String _getPageTag() {
    return '${runtimeType.toString()}_'
        .replaceAll('State_', '')
        .replaceAll('_', '');
  }

  @override
  Widget build(BuildContext context) {
    throw UnimplementedError();
  }
}
