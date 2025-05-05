import 'package:flutter/material.dart';
import 'package:flutter_triple/flutter_triple.dart';
import 'package:ondehj_app/app/utils/main_page_state.dart';
import 'package:ondehj_app/app/utils/string_extensions.dart';

import '../../../../utils/components/buttons/ondehj_primary_button.dart';
import '../../../../utils/components/buttons/ondehj_secondary_button.dart';
import '../../../../utils/components/ondehj_text_field.dart';
import '../../../../utils/design/colors.dart';
import '../../../../utils/design/text_styles.dart';
import '../../../../utils/keyboard.dart';
import '../stores/forgot_password_page_store.dart';


class ForgotPasswordPage extends StatefulWidget {
  // final ForgotPasswordPageStore store;
  final ScrollController? scrollController;

  const ForgotPasswordPage({
    // required this.store,
    this.scrollController,
    super.key,
  });

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends MainPageState<ForgotPasswordPage, ForgotPasswordPageStore> {
  // late final store = widget.store;
  final _emailController = TextEditingController();
  bool formIsValid = false;

  @override
  initState() {
    super.initState();
    store.observer(
      onError: (error) {
        if ((error.message).isEmpty) return;
        // store.showErrorMessage(error.message);
      },
    );
  }

  checkInfo(String _) {
    final email = _emailController.text;
    setState(() => formIsValid = email.isValidEmail);
  }

  @override
  Widget build(BuildContext context) {
    final deviceheight = MediaQuery.of(context).size.height;
    final isSmall = deviceheight < 600;

    return GestureDetector(
      onTap: hideKeyboard,
      child: SafeArea(
        child: Container(
          decoration: const BoxDecoration(color: OndeHjColors.neutral100),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: SingleChildScrollView(
              controller: widget.scrollController,
              child: ScopedBuilder(
                store: store,
                onState: (context, bool state) {
                  if (state) {
                    return Column(
                      children: [
                        SizedBox(
                          width: double.maxFinite,
                          child: Text(
                            "Redefinir senha",
                            textAlign: TextAlign.center,
                            style: OndeHjTextStyle.boldHeader3.copyWith(
                              color: OndeHjColors.neutral800,
                            ),
                          ),
                        ),
                        const SizedBox(height: 24),
                        SizedBox(
                          width: double.maxFinite,
                          child: Text(
                            "",
                            textAlign: TextAlign.center,
                            style: OndeHjTextStyle.regularBody1.copyWith(
                              color: OndeHjColors.neutral600,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: isSmall
                              ? deviceheight * 0.03
                              : deviceheight * 0.1,
                        ),
                        SizedBox(
                          width: double.maxFinite,
                          child: OndeHjPrimaryButton(
                            "Cancelar",
                            Navigator.of(context).pop,
                          ),
                        ),
                        const SizedBox(height: 12),
                      ],
                    );
                  }

                  return Column(
                    children: [
                      SizedBox(
                        width: double.maxFinite,
                        child: Text(
                          "Redefinir senha",
                          textAlign: TextAlign.center,
                          style: OndeHjTextStyle.boldHeader3.copyWith(
                            color: OndeHjColors.neutral800,
                          ),
                        ),
                      ),
                      const SizedBox(height: 24),
                      SizedBox(
                        width: double.maxFinite,
                        child: Text(
                          "Digite abaixo o e-mail utilizado na sua conta para receber um link para redefinir sua senha.",
                          textAlign: TextAlign.center,
                          style: OndeHjTextStyle.regularBody1.copyWith(
                            color: OndeHjColors.neutral600,
                          ),
                        ),
                      ),
                      const SizedBox(height: 24),
                      OndeHjTextField(
                        hint: "E-mail",
                        controller: _emailController,
                        onChanged: checkInfo,
                        autofillHints: const [AutofillHints.email],
                        keyboardType: TextInputType.emailAddress,
                      ),
                      SizedBox(
                        height:
                            isSmall ? deviceheight * 0.03 : deviceheight * 0.1,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: OndeHjSecondaryButton(
                              "Cancelar",
                              Navigator.of(context).pop,
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: OndeHjPrimaryButton(
                              "Enviar",
                              formIsValid
                                  ? () =>
                                      store.renewPassword(_emailController.text)
                                  : null,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),
                    ],
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
