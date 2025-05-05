import 'package:flutter/material.dart';
import 'package:ondehj_app/app/utils/main_page_state.dart';

import '../../../../utils/design/colors.dart';
import '../../../../utils/design/text_styles.dart';
import '../stores/splash_page_store.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends MainPageState<SplashPage, SplashPageStore>
    with TickerProviderStateMixin {
  bool needUpdate = false;
  String appVersion = '';

  late final AnimationController _controller = AnimationController(vsync: this);
  late Animation<double> animation =
      Tween<double>(begin: 0.9, end: 0).animate(_controller);

  @override
  void initState() {
    getAppInfo();
    super.initState();
    // store.setSavedEnv();
  }

  getAppInfo() async {
    await Future.wait([
      // store.setSavedLocale(),
      // store.setAuthToken(),
    ]);
    await Future.delayed(Duration(seconds: 2));
    // final newVersion = await store.getAppVersion();
    // setState(() => appVersion = newVersion);
    store.goToApp();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            stops: [0.1, 0.9],
            colors: [OndeHjColors.supernovaOriginal, OndeHjColors.supernovaDark],
          ),
        ),
        child: Stack(
          children: [
            Center(
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.5,
                child: Image.asset('assets/images/logo-white.png'),
              ),
            ),
            SafeArea(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 16),
                  child: Text(
                    'Versão $appVersion',
                    textAlign: TextAlign.center,
                    style: OndeHjTextStyle.regularCaption.copyWith(
                      color: OndeHjColors.white,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
