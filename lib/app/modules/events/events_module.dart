
import 'package:flutter_modular/flutter_modular.dart';

import 'presenter/pages/events_page.dart';

class EventsModule extends Module {
  @override
  void binds(i) {
    // i.add(OndeHjWebViewPageStore.new);
    // i.add(CitrixDownloadPageStore.new);
    // i.add(CheckAppPageStore.new);
  }

  @override
  void routes(r) {
    r.child(
      Modular.initialRoute,
      child: (_) => const EventsPage(),
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
