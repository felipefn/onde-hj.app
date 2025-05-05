
import 'package:event_bus/event_bus.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:ondehj_app/app/app_router.dart';
import 'package:ondehj_app/app/modules/auth/presenter/pages/login_page.dart';
import 'package:ondehj_app/app/modules/auth/presenter/stores/auth_store.dart';
import 'package:ondehj_app/app/modules/auth/presenter/stores/forgot_password_page_store.dart';
import 'package:ondehj_app/app/utils/ingresse_authenticator%20copy.dart';

import '../../utils/dio_client.dart';
import '../../utils/environment.dart';
import 'presenter/stores/login_page_store.dart';

class AuthModule extends Module {
  @override
  void binds(i) {
    i.add(LoginPageStore.new);
    i.add(ForgotPasswordPageStore.new);
    i.add(AuthStore.new);
    i.add(AppRouter.new);
    i.add(EventBus.new);
  }

  @override
  void routes(r) {
      late final client = DioClient(
    // typesToLog: [LogType.responseRequest, LogType.request, LogType.error],
    initialEnvironment: const Environment(name: '', apiPrefix: '', apiKey: '', type: EnvironmentType.prod),
  );

  late final authenticator = IngresseAuthenticator(client, null, null);
    r.child(
      Modular.initialRoute,
      child: (_) =>  EmailLoginPage(onPressForgotPassword: () => {},
      onPressLogin: (_, __, ___) => {},
      authenticator: authenticator),
    );
    // r.child(
    //   webViewRoute,
    //   child: (_) => const OndeHjWebViewPage(),
    // );
    // r.child(
    //   citrixRoute,
    //   child: (_) => const CitrixDownloadPage(),
    // );
  }
}
