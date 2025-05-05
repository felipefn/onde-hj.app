
import 'package:flutter_modular/flutter_modular.dart';

import '../../app_router.dart';
import 'presenter/pages/splash_page.dart';
import 'presenter/stores/splash_page_store.dart';

class SplashModule extends Module {
  @override
  void binds(i) {
    i.add(SplashPageStore.new);
    i.add(AppRouter.new);
  }
  // final List<Bind> binds = [
  //   Bind((i) => SplashPageStore(
  //         i.get(), // AppInfoManager
  //         i.get(), // PreferencesManager
  //         i.get(), // ClientManager
  //         i.get(), // UserManager
  //         i.get(), // AppRouter
  //         i.get(), // EventBus
  //       ))
  // ];

  @override
  void routes(r) {
    r.child(
      Modular.initialRoute,
      child: (_) =>  const SplashPage(),
    );
  }
}
