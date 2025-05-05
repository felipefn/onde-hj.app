import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_triple/flutter_triple.dart';
import 'app_widget_store.dart';
import './utils/main_page_state.dart';
import 'utils/components/snackbar/ondehj_snackbar.dart';
import 'utils/design/colors.dart';
import 'utils/design/text_styles.dart';

class AppWidget extends StatefulWidget {
  const AppWidget({super.key});

  @override
  State<AppWidget> createState() => _AppWidgetState();
}

class _AppWidgetState extends MainPageState<AppWidget, AppWidgetStore>
    with TickerProviderStateMixin {
  Timer? _notificationTimer;
  late final AnimationController _animController = AnimationController(
      duration: const Duration(milliseconds: 800), vsync: this);

  late final Animation<Offset> _offsetAnimation = Tween<Offset>(
    begin: const Offset(0, -1),
    end: const Offset(0, 0),
  ).animate(CurvedAnimation(parent: _animController, curve: Curves.easeInOut));

  @override
  void initState() {
    super.initState();

    store.observer(onState: (info) {
      _animController.forward().whenCompleteOrCancel(() {
        _notificationTimer = Timer(info.duration, _animController.reverse);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'OndeHj',
      routerConfig: Modular.routerConfig,
      themeMode: ThemeMode.light,
      theme: ThemeData(
        useMaterial3: false,
        brightness: Brightness.light,
        scaffoldBackgroundColor: OndeHjColors.neutral200,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        pageTransitionsTheme: const PageTransitionsTheme(builders: {
          TargetPlatform.android: CupertinoPageTransitionsBuilder(),
          TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
        }),
        textSelectionTheme: const TextSelectionThemeData(
          cursorColor: Colors.blue,
          selectionColor: Colors.blue,
          selectionHandleColor: Colors.blue,
        ),
        colorScheme: const ColorScheme.highContrastLight(
          primary: Colors.brown,
          onPrimary: Colors.white,
          secondary: Colors.teal,
        ),
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: Colors.grey,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        colorScheme: const ColorScheme.highContrastDark(
          primary: Colors.white,
          onPrimary: Colors.white,
          secondary: Colors.purple,
        ),
        inputDecorationTheme: const InputDecorationTheme(
          hintStyle: TextStyle(color: Colors.grey),
        ),
      ),
      checkerboardOffscreenLayers: false,
      debugShowCheckedModeBanner: false,
      builder: (context, child) => Scaffold(
        resizeToAvoidBottomInset: false,
        body: Stack(
          children: [
            child ?? Container(),
            Align(
              alignment: Alignment.topLeft,
              child: SlideTransition(
                position: _offsetAnimation,
                child: ScopedBuilder(
                  store: store,
                  onState: (_, AlertInfo newState) {
                    final htmlContainerAttribute = {
                      'html': Style(textAlign: TextAlign.center),
                      'body': Style.fromTextStyle(
                        OndeHjTextStyle.regularBody1.copyWith(
                          color: Colors.white,
                        ),
                      ),
                      'a': Style.fromTextStyle(
                        OndeHjTextStyle.regularBody1.copyWith(
                          color: Colors.white,
                        ),
                      ),
                    };

                    return GestureDetector(
                      onVerticalDragEnd: (DragEndDetails details) {
                        final dragVelocity =
                            details.velocity.pixelsPerSecond.dy;

                        if (dragVelocity >= 0) return;
                        _notificationTimer?.cancel();
                        _notificationTimer = null;
                        _animController.reverse();
                      },
                      child: OndeHjSnackbar(
                        newState.type,
                        width: double.maxFinite,
                        information: '',
                        customInformationWidget: Html(
                          data: newState.message,
                          style: htmlContainerAttribute,
                          onLinkTap: (url, _, __) async {},
                        ),
                        padding: EdgeInsets.fromLTRB(
                          16,
                          MediaQuery.of(context).padding.top,
                          16,
                          16,
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
