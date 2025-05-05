import 'package:flutter_modular/flutter_modular.dart';
import 'package:url_launcher/url_launcher_string.dart';

import 'modules/menu/presenter/utils/bottom_navigation_item.dart';
import 'modules/menu/presenter/utils/bottom_navigation_page_data.dart';
import 'utils/routes.dart';

class AppRouter {
  openMenu() => {
    Modular.to.navigate(
        '$menuRoute${BottomNavigationItem.events.route}',
        arguments: const BottomNavigationPageData(
          BottomNavigationItem.events,
          true,
        ),
      )};

  openApp() => Modular.to.navigate(
        authRoute,
      );

  goToMenu(BottomNavigationItem item, dynamic childData) =>
    Modular.to.navigate(menuRoute,
          arguments: const BottomNavigationPageData(
          BottomNavigationItem.events,
          true,
        ),);

  Future openUrl(String url) async {
      return await launchUrlString(
        url,
      );
  }


}
