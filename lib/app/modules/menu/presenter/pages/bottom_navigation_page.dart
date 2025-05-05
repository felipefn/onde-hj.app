import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_triple/flutter_triple.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:heroicons/heroicons.dart';
import 'package:ondehj_app/app/utils/main_page_state.dart';

import '../../../../utils/design/colors.dart';
import '../../../../utils/design/text_styles.dart';
import '../stores/bottom_navigation_page_store.dart';
import '../utils/bottom_navigation_page_data.dart';

class BottomNavigationPage extends StatefulWidget {
  final BottomNavigationPageData data;

  const BottomNavigationPage(
    this.data, {
    super.key,
  });

  @override
  State<BottomNavigationPage> createState() => _BottomNavigationPageState();
}

class _BottomNavigationPageState
    extends MainPageState<BottomNavigationPage, BottomNavigationPageStore>
    with TickerProviderStateMixin
    implements BottomNavigationPageStoreCallback {

  late final TabController _tabController = TabController(
    length: store.state.items.length,
    vsync: this,
  );

  @override
  void initState() {
    store.setCallback(this);
    store.updateItems();
    store.setRoute(widget.data);
    super.initState();
  }

  Widget _onLoading(BuildContext context) {
    return const Expanded(child: Center(child: CircularProgressIndicator()));
  }

  Widget _onError(BuildContext context, Object? error) {
    return const SizedBox();
  }

  Widget _onSuccess(BuildContext context, BottomNavigationData? data) {

    _tabController.animateTo(data?.selectedItem ?? 0);

    final selectedColor = Theme.of(context).colorScheme.secondary;
    const unselectedColor = OndeHjColors.neutral500;

    return SafeArea(
      child: DecoratedBox(
        decoration: const BoxDecoration(),
        child: GNav(
          rippleColor: selectedColor.withOpacity(0.1),
          hoverColor: selectedColor.withOpacity(0.1),
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          color: unselectedColor,
          activeColor: selectedColor,
          tabBackgroundColor: selectedColor.withOpacity(0.1),
          tabMargin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          padding: const EdgeInsets.all(12),
          gap: 8,
          onTabChange: (index) async {
            final canChange = await store.goToPage(index, null);
            if (!canChange) {
              _tabController.animateTo(data?.selectedItem ?? 0);
              return;
            }
          },
          textStyle: OndeHjTextStyle.regularBody2.copyWith(
            color: selectedColor,
          ),
          tabs: store.state.items.map((item) {
            return GButton(
              icon: Icons.abc,
              text: item.title,
              leading: HeroIcon(
                item.icon,
                size: 16,
                style: item == data?.items[data.selectedItem]
                    ? HeroIconStyle.solid
                    : null,
                color: item == data?.items[data.selectedItem]
                    ? selectedColor
                    : unselectedColor,
              ),
            );
          }).toList(),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const RouterOutlet(),
      bottomNavigationBar: ScopedBuilder(
        store: store,
        onLoading: _onLoading,
        onState: _onSuccess,
        onError: _onError,
      ),
    );
  }
}
