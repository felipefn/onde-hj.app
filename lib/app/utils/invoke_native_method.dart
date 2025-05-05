import 'package:flutter/services.dart';

extension MethodChannelExtension on MethodChannel {
  void invokeNativeMethod(
    String method, {
    dynamic data,
    void Function()? onNativeFailed,
  }) async {
    try {
      await invokeMethod(method, data);
    } on MissingPluginException catch (_) {
      onNativeFailed?.call();
    } on PlatformException catch (_) {
      onNativeFailed?.call();
    }
  }

  Future<dynamic> getNativeMethodResponse(
    String method, {
    dynamic data,
    void Function()? onNativeFailed,
  }) async {
    try {
      return await invokeMethod(method, data);
    } on MissingPluginException catch (_) {
      onNativeFailed?.call();
    } on PlatformException catch (_) {
      onNativeFailed?.call();
    }
  }
}