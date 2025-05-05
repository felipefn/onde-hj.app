import 'package:flutter/material.dart';
import 'package:heroicons/heroicons.dart';
import 'package:ondehj_app/app/utils/main_page_state.dart';
import 'package:ondehj_app/app/utils/string_extensions.dart';

import '../../../../utils/components/buttons/ondehj_primary_button.dart';
import '../../../../utils/components/buttons/ondehj_text_button.dart';
import '../../../../utils/components/ondehj_text_field.dart';
import '../../../../utils/design/colors.dart';
import '../../../../utils/design/text_styles.dart';
import '../../../../utils/ingresse_authenticator copy.dart';
import '../../../../utils/keyboard.dart';
import '../stores/login_page_store.dart';


class EmailLoginPage extends StatefulWidget {
  final IngresseAuthenticator authenticator;
  final void Function() onPressForgotPassword;
  final void Function(
    BuildContext sheetContext,
    String email,
    String password,
  ) onPressLogin;

  const EmailLoginPage({
    required this.authenticator,
    required this.onPressLogin,
    required this.onPressForgotPassword,
    super.key,
  });

  @override
  State<EmailLoginPage> createState() => _EmailLoginPageState();
}

class _EmailLoginPageState extends State<EmailLoginPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool showPassword = false;
  bool loginIsValid = false;
  late final store = LoginPageStore(
    widget.authenticator.authStore,
    widget.authenticator.eventBus,
  );


  checkInfo(String _) {
    final email = _emailController.text;
    final password = _passwordController.text;
    setState(() => loginIsValid = email.isValidEmail && password.isNotEmpty);
  }

  sendLoginInfo([_]) {
    // if (!loginIsValid) return;
    final email = _emailController.text;
    final password = _passwordController.text;
    widget.onPressLogin(context, email, password);
    store.goToMenu(context);
  }

  @override
  Widget build(BuildContext context) {
    final eyeIcon = showPassword ? HeroIcons.eye : HeroIcons.eyeSlash;
    final eyeIconColor =
        showPassword ? OndeHjColors.supernovaOriginal : OndeHjColors.neutral500;

    return GestureDetector(
      onTap: hideKeyboard,
      child: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                stops: [0.1, 0.9],
                colors: [OndeHjColors.supernovaOriginal, OndeHjColors.supernovaDark],
              ),
            ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(34.0).copyWith(top: 24),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  
                  const SizedBox(height: 46),
                  SizedBox(
                    width: double.maxFinite,
                    child: Text(
                      "Icone Aqui",
                      textAlign: TextAlign.start,
                      style: OndeHjTextStyle.boldHeader3.copyWith(
                        color: OndeHjColors.neutral800,
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  
                  const SizedBox(height: 40),
                  AutofillGroup(
                    child: Column(
                      children: [
                        OndeHjTextField(
                          hint: "email",
                          autofillHints: const [AutofillHints.email],
                          keyboardType: TextInputType.emailAddress,
                          controller: _emailController,
                          onChanged: checkInfo,
                          inputAction: TextInputAction.next,
                        ),
                        const SizedBox(height: 16),
                        OndeHjTextField(
                          hint: "password",
                          autofillHints: const [AutofillHints.password],
                          controller: _passwordController,
                          obscureText: !showPassword,
                          onChanged: checkInfo,
                          onSubmitted: sendLoginInfo,
                          rightIcon: GestureDetector(
                            child: HeroIcon(eyeIcon, color: eyeIconColor),
                            onTap: () =>
                                setState(() => showPassword = !showPassword),
                          ),
                        ),
                      ],
                    ),
                  ),
                  OndeHjTextButton(
                    "Forgot Password",
                    () async {
                     store.showForgotPasswordBottomSheet(
                                                      context);
                    },
                    style: OndeHjTextStyle.regularBody2.copyWith(
                      color: Theme.of(context).colorScheme.secondary,
                    ),
                  ),
                  const SizedBox(height: 40),
                  SizedBox(
                    width: double.maxFinite,
                    child: OndeHjPrimaryButton(
                      "Login",
                      loginIsValid ? sendLoginInfo : sendLoginInfo,
                    ),
                  ),
                  const SizedBox(height: 4),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
