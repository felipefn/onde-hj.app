import 'package:flutter/services.dart';
import 'package:ondehj_app/app/utils/invoke_native_method.dart';

import 'native_channel_constants.dart';

extension MethodChannelExtensions on MethodChannel {
  closePage({required bool nativeCanPop, dynamic data}) {
    invokeNativeMethod(
      FlutterPlatformMethods.canNativeBack,
      data: {'canPop': nativeCanPop, 'popData': data},
    );
  }
}
