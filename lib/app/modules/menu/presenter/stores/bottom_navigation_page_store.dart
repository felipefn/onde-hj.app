import 'dart:async';

import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_triple/flutter_triple.dart';

import '../../../../utils/routes.dart';
import '../utils/bottom_navigation_item.dart';
import '../utils/bottom_navigation_page_data.dart';

abstract class BottomNavigationPageStoreCallback {
}

class BottomNavigationPageStore extends Store<BottomNavigationData> {

  BottomNavigationPageStoreCallback? callback;

  BottomNavigationPageStore(
  ) : super(BottomNavigationData(-1, BottomNavigationItem.values));

  void updateItems() {
    List<BottomNavigationItem> totalItems = [...BottomNavigationItem.values];

    update(BottomNavigationData(state.selectedItem, totalItems));
  }

  setCallback(BottomNavigationPageStoreCallback? callback) {
    this.callback = callback;
  }

  goToMenu(BottomNavigationItem item, dynamic childData) =>
      Modular.to.navigate('$menuRoute${item.route}',
          arguments: BottomNavigationPageData(item, childData));

  setRoute(BottomNavigationPageData data) {
    final selectedItem = data.navigationItem;
    goToPage(selectedItem.index, data.childData);
  }

  Future<bool> goToPage(int index, dynamic data) async {
    if (index == state.selectedItem) return false;

    update(BottomNavigationData(index, state.items));
    goToMenu(state.items[index], data);
    return true;
  }
}
class BottomNavigationData {
  final int selectedItem;
  final List<BottomNavigationItem> items;

  BottomNavigationData(this.selectedItem, this.items);
}
