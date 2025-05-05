
import 'package:flutter/services.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:ondehj_app/app/utils/invoke_native_method.dart';

import '../../../../app_router.dart';
import '../../../../utils/native_channel_constants.dart';


class SplashPageStore {
  // final AppInfoManager _infoManager;
  // final PreferencesManager _prefs;
  // final ClientManager _clientManager;
  // final UserManager _userManager;
  final AppRouter _routes;
  // final EventBus _eventBus;

  final MethodChannel _nativeChannel = const MethodChannel(
    FlutterPlatformChannels.splashChannel,
  );

  SplashPageStore(
    this._routes,
  );

  // Future setSavedLocale() async {
  //   final savedLocale = await _prefs.getLocale();
  //   final language = IngresseLanguages.getByLocale(savedLocale ?? '');
  //   _eventBus.changeLanguage(language);

  //   _nativeChannel.invokeNativeMethod(
  //     FlutterPlatformMethods.changeAppLanguage,
  //     data: language.language,
  //   );
  // }

  // setSavedEnv() async {
  //   final savedEnv = await _getSavedEnv();
  //   await _eventBus.changeEnviroment(savedEnv);
  // }

  // Future<Environment> _getSavedEnv() async {
  //   final savedEnv = await _prefs.getDebugEnv();
  //   final savedPublicKey = await _prefs.getPublicKey();
  //   Environment envToUse = savedEnv ?? _clientManager.environment;

  //   if (!_clientManager.isDebug) {
  //     debugPrint = (String? message, {int? wrapWidth}) {};
  //     const production = Environments.production;
  //     if (savedEnv != production) {
  //       await _prefs.clearPublicKey();
  //       await _prefs.saveDebugEnvironment(production);
  //     }

  //     envToUse = Environments.production;
  //   }

  //   return Environment(
  //     name: envToUse.name,
  //     apiPrefix: envToUse.apiPrefix,
  //     prefix: envToUse.prefix,
  //     apiKey: savedPublicKey ?? envToUse.apiKey,
  //     type: envToUse.type,
  //   );
  // }

  goToApp() async {
    // final user = await _userManager.getLocalUser();
    // if (user == null) {
    //   goToLogin();
    //   return;
    // }

    goToHome();
  }

  goToHome() async {
    _nativeChannel.invokeNativeMethod(
      FlutterPlatformMethods.goToHome,
      onNativeFailed: () async {
        await _routes.openApp();
      },
    );
  }

  goToLogin() async {
    _nativeChannel.invokeNativeMethod(
      FlutterPlatformMethods.goToLogin,
      onNativeFailed: () async {
        await Modular.to.pushReplacementNamed('/auth');
      },
    );
  }

  // Future<String> getAppVersion() async {
  //   await _infoManager.getInfo();
  //   final appInfo = _infoManager.appInfo;

  //   if (appInfo.version.isNotEmpty) return appInfo.version;

  //   final newAppInfo = await _infoManager.refreshAppInfo();
  //   return newAppInfo.version;
  // }

  // Future setAuthToken() async {
  //   final authToken = await _prefs.getAuthToken() ?? '';
  //   await _userManager.updateAuthToken(authToken);
  //   _eventBus.setNewAuthToken(authToken);
  // }
}
