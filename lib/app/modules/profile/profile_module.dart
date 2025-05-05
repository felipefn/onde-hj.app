

import 'package:flutter_modular/flutter_modular.dart';
import 'package:ondehj_app/app/modules/profile/presenter/pages/edit_user_page.dart';

import '../../app_router.dart';
import '../../utils/ingresse_authenticator copy.dart';
import 'presenter/pages/profile_page.dart';
import 'presenter/stores/profile_page_store.dart';

class ProfileModule extends Module {
  @override
  void binds(i) {
    i.add(ProfilePageStore.new);
    i.add(IngresseAuthenticator.new);
    i.add(AppRouter.new);

  }

  @override
  void routes(r) {
    r.child(
      Modular.initialRoute,
      child: (_) => const ProfilePage(),
    );
    r.child(
      "/editUser",
      child: (_) => const EditUserPage(),
      transition: TransitionType.rightToLeft
    );
  }
}
