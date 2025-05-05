import 'package:flutter_modular/flutter_modular.dart';

import '../../app_router.dart';
import '../events/events_module.dart';
import '../friends/friends_module.dart';
import '../home/home_module.dart';
import '../profile/profile_module.dart';
import 'presenter/pages/bottom_navigation_page.dart';
import 'presenter/stores/bottom_navigation_page_store.dart';

class MenuModule extends Module {
  @override
  void binds(i) {
    i.add(BottomNavigationPageStore.new);
    i.add(AppRouter.new);
  }

  @override
  void routes(r) {
    r.child(
      Modular.initialRoute,
      child: (_) =>  BottomNavigationPage(r.args.data),
      transition: TransitionType.fadeIn,
      children: [
        ModuleRoute(
          'events/',
          module: EventsModule(),
          transition: TransitionType.noTransition,
        ),
        ModuleRoute(
          'home/',
          module: HomeModule(),
          transition: TransitionType.noTransition,
        ),
        ModuleRoute(
          'friends/',
          module: FriendsModule(),
          transition: TransitionType.noTransition,
        ),
        ModuleRoute(
          'profile/',
          module: ProfileModule(),
          transition: TransitionType.noTransition,
        ),
      ],
    );
  }
}
