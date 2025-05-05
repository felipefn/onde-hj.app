

import 'package:flutter_modular/flutter_modular.dart';

import '../app_module.dart';
import '../modules/events/events_module.dart';

class SplashRouteGuard extends RouteGuard {
  @override
  Future<bool> canActivate(String path, ModularRoute route) async  {
    //  return Modular.get<AppModule>();
    //  Modular.get<EventsModule>();
    return true;
  }
}
