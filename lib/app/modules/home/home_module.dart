import 'package:flutter_modular/flutter_modular.dart';
import 'package:ondehj_app/app/modules/home/presenter/pages/home_page.dart';

class HomeModule extends Module {
  @override
  void binds(i) {
  }

  @override
  void routes(r) {
    r.child(
      Modular.initialRoute,
      child: (_) =>  const HomePage(),
    );
  }
}
