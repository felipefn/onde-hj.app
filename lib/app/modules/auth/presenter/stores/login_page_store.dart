

import 'dart:math';

import 'package:event_bus/event_bus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:ondehj_app/app/utils/default_events.dart';

import '../../../../utils/design/colors.dart';
import '../../../../utils/main_store.dart';
import '../../../../utils/routes.dart';
import '../../../menu/presenter/utils/bottom_navigation_item.dart';
import '../../../menu/presenter/utils/bottom_navigation_page_data.dart';
import '../../domain/entities/user_data_entity.dart';
import '../pages/forgot_password_page.dart';
import 'auth_store.dart';

class LoginPageStore extends MainStore<UserDataEntity> {
  final AuthStore authStore;
  
  LoginPageStore(
    this.authStore,
    EventBus? eventBus,
    ): super(
      eventBus,
        const UserDataEntity(
            userId: -1,
            name: '',
            email: '',
            picture: '',
            userToken: '',
          ),
        );

    showForgotPasswordBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      clipBehavior: Clip.antiAlias,
      backgroundColor: OndeHjColors.neutral100,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(20),
        ),
      ),
      builder: (context) {
        return AnimatedPadding(
          padding: MediaQuery.of(context).viewInsets,
          duration: const Duration(milliseconds: 100),
          curve: Curves.decelerate,
          child: const ForgotPasswordPage(),
        );
      },
    );
  }
  
  goToMenu(BuildContext context) async{
    Modular.to.pushReplacementNamed(
        menuRoute,
        arguments: const BottomNavigationPageData(
          BottomNavigationItem.home,
          true,
        ),
      );
  }


  closePage(BuildContext context, [dynamic value]) {
    Navigator.of(context).pop(value);
  }

  showSignUp(BuildContext context, authenticator, Null Function(dynamic userData) param2, void Function(dynamic p1) onLoginFailure) {}

}
