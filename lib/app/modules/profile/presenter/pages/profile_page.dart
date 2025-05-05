import 'package:flutter/material.dart';
import 'package:heroicons/heroicons.dart';
import 'package:ondehj_app/app/modules/profile/presenter/stores/profile_page_store.dart';

import '../../../../utils/design/colors.dart';
import '../../../../utils/design/text_styles.dart';
import '../../../../utils/keyboard.dart';
import '../../../../utils/main_page_state.dart';
import '../../domain/entities/profile_menu_item.dart';
import '../widgets/profile_menu_button.dart';
import '../widgets/user_image.dart';


class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends MainPageState<ProfilePage, ProfilePageStore> {
  final scrollController = ScrollController();
  final showBiometry = false;

  String appVersion = '';
  int userId = 0;
  String name = '';
  String email = '';
  String picture = '';
  int pictureRefresh = 0;

  @override
  initState() {
    // store.setInitialUser();
    getAppInfo();
    // store.getData();

    // store.observer(
    //   onState: (state) {
    //     setState(() {
    //       // name = state.user.name;
    //       // email = state.user.email;
    //       // userId = state.user.userId;
    //       // picture = state.user.picture;
    //     });
    //   },
    //   onError: ((error) {
    //     if ((error.message ?? '').isEmpty) return;
    //     // store.showErrorMessage(error.message ?? '');
    //   }),
    // );

    super.initState();
  }

  getAppInfo() async {
    // final newVersion = await store.getAppVersion();

    // setState(() => appVersion = newVersion);
  }

  // String getNameInitials(String name) {
  //   // // final initialsChars = name.getInitials();
  //   // final firstChar = initialsChars.isNotEmpty ? initialsChars[0] : '';
  //   // final lastChar =
  //   //     initialsChars.length > 1 ? initialsChars[initialsChars.length - 1] : '';
  //   // return '$firstChar$lastChar'.toUpperCase();
  // }

  doLogout() {
    // store.logout(() {
    //   store.setInitialUser();
    //   store.getData();
    //   scrollController.jumpTo(0.0);
    // });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    var isDarkTheme = Theme.of(context).brightness == Brightness.dark;

    // final initials = getNameInitials(name);
    final menuColor = isDarkTheme ? OndeHjColors.neutral200 : Colors.white;
    final sectionTitle =
        isDarkTheme ? theme.colorScheme.onPrimary : OndeHjColors.neutral600;
    pictureRefresh += 1;

    final List<ProfileMenuItem> buttons = [
      ProfileMenuItem(
        title: "Editar Usuário",
        subtitle: "Editar informações do usuário",
        action: store.openEditUserData,
        icon: HeroIcons.user,
      ),
      ProfileMenuItem(
        title: "Eventos",
        subtitle: "Ver eventos",
        action: store.openEvents,
        icon: HeroIcons.shoppingBag,
      ),
    ];

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      body: GestureDetector(
        onTap: hideKeyboard,
        behavior: HitTestBehavior.opaque,
        onPanDown: (_) => hideKeyboard(),
        child: SafeArea(
          maintainBottomViewPadding: true,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: SingleChildScrollView(
              controller: scrollController,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 24),
                  Row(
                    children: [
                      Container(
                        clipBehavior: Clip.antiAlias,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              OndeHjColors.sunPrimary,
                              OndeHjColors.sunOriginal,
                            ],
                          ),
                        ),
                        height: 48,
                        width: 48,
                        child: UserImage(
                          picture,
                          userInitials: "FN",
                          fontSize: 20,
                          key: ValueKey(
                            'user_picture_${userId}_$pictureRefresh',
                          ),
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "name",
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: OndeHjTextStyle.boldTitle2.copyWith(
                                color: isDarkTheme
                                    ? theme.colorScheme.onPrimary
                                    : OndeHjColors.neutral800,
                              ),
                            ),
                            const SizedBox(height: 2),
                            Text(
                              "email",
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: OndeHjTextStyle.regularBody1.copyWith(
                                color: OndeHjColors.neutral600,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                  Text(
                    "Conta",
                    style: OndeHjTextStyle.mediumBody2.copyWith(
                      color: sectionTitle,
                    ),
                  ),
                  const SizedBox(height: 24),
                  Container(
                    padding: const EdgeInsets.all(16.0),
                    decoration: BoxDecoration(
                      color: menuColor,
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(
                        color: OndeHjColors.neutral100,
                      ),
                    ),
                    child: ListView.separated(
                      shrinkWrap: true,
                      itemCount: buttons.length,
                      padding: EdgeInsets.zero,
                      physics: const NeverScrollableScrollPhysics(),
                      separatorBuilder: (_, __) => const Divider(
                        height: 20,
                        color: OndeHjColors.neutral200,
                      ),
                      itemBuilder: (_, index) {
                        final item = buttons[index];
                        return ProfileMenuButton(item);
                      },
                    ),
                  ),
                  const SizedBox(height: 24),
                  Text(
                    "Serviços",
                    style: OndeHjTextStyle.mediumBody2.copyWith(
                      color: sectionTitle,
                    ),
                  ),
                  const SizedBox(height: 24),
                  Container(
                    padding: const EdgeInsets.all(16.0),
                    decoration: BoxDecoration(
                      color: menuColor,
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(
                        color: OndeHjColors.neutral100,
                      ),
                    ),
                    child: Column(
                      children: [
                        ProfileMenuButton(
                          ProfileMenuItem(
                            title: "Ajuda",
                            subtitle: "Ajuda",
                            showArrow: false,
                            action: () => {store.openHelp("google.com")},
                            icon: HeroIcons.questionMarkCircle,
                          ),
                        ),
                        const Divider(
                          height: 20,
                          color: OndeHjColors.neutral200,
                        ),
                        ProfileMenuButton(
                          ProfileMenuItem(
                            title: "Sair",
                            action: store.logout,
                            icon: HeroIcons.arrowRightOnRectangle,
                            showArrow: false,
                            customColor: OndeHjColors.rubyOriginal,
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(height: 28),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
