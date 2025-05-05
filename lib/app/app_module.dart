import 'package:flutter_modular/flutter_modular.dart';
import 'package:ondehj_app/app/modules/auth/auth_module.dart';
import 'package:ondehj_app/app/modules/splash/splash_module.dart';
import 'package:ondehj_app/app/app_router.dart';

import 'app_widget_store.dart';
import 'modules/menu/menu_module.dart';
import 'utils/routes.dart';
import 'utils/splash_route_guard.dart';


class AppModule extends Module {
  @override
  void binds(i) {
    i.add(AppWidgetStore.new);
    i.add(AppRouter.new);
  }

  @override
  void routes(r) {
    r.module(
      Modular.initialRoute,
      module: SplashModule(),
      guards: [SplashRouteGuard()],
    );
    r.module(
      authRoute,
      module: AuthModule(),
      guards: [SplashRouteGuard()],
    );
    r.module(
      menuRoute,
      module: MenuModule(),
      guards: [SplashRouteGuard()],
    );
    r.module(
      homeRoute,
      module: MenuModule(),
      guards: [SplashRouteGuard()],
    );
    r.module(
      eventRoute,
      module: MenuModule(),
      guards: [SplashRouteGuard()],
    );
    r.module(
      friendRoute,
      module: MenuModule(),
      guards: [SplashRouteGuard()],
    );
    r.module(
      profileRoute,
      module: MenuModule(),
      guards: [SplashRouteGuard()],
    );
  }
}
