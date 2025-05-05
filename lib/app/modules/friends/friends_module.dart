import 'package:flutter_modular/flutter_modular.dart';

import 'presenter/pages/friends_page.dart';

class FriendsModule extends Module {
  @override
  void binds(i) {
  }

  @override
  void routes(r) {
    r.child(
      Modular.initialRoute,
      child: (_) =>  FriendsPage(),
    );
  }
}
