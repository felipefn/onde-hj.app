import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_triple/flutter_triple.dart';
import 'package:ondehj_app/app/utils/routes.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../../../auth/domain/entities/user_data_entity.dart';



class ProfilePageStore extends Store<UserDataEntity> {
  ProfilePageStore(
  ) : super(
          const UserDataEntity(
              userId: -1,
              userToken: '',
              name: '',
              email: '',
              picture: '',
            ),
        );


  void openEditUserData() async {
    Modular.to.pushNamed('editUser');
  }
  openEvents() async{
    print("openEvents");
    await Modular.to.pushNamed('events');
  }

  setInitialUser() async {
    // final user = await _userManager.getLocalUser();
    // if (user == null) return;
    // update(ProfilePageData(
    //   user: user,
    //   deviceIsVerified: state.deviceIsVerified,
    // ));
  }

  updateAuthToken(String newAuthToken) async {
    // await _userManager.updateAuthToken(newAuthToken);
    // eventBus?.setNewAuthToken(newAuthToken);
  }


  getData() async {
    // final infos = await getUserInfos();
    // final userId = infos.userId;
    // final userToken = infos.userToken;

    // if (userId.isEmpty) return;
    // showAppLoader(true);
    // _appInfoManager.checkIfDeviceIsValidated(
    //   userId,
    //   (validated) async {
    //     await _userManager.setDeviceIsVerified(validated);
    //     getUserData(int.tryParse(userId) ?? -1, userToken, validated);
    //   },
    //   onTokenExpired: (deviceInfo) {
    //     final request = RenewAuthTokenRequestEntity(
    //       // userToken: userToken,
    //       // device: deviceInfo,
    //     );
    //     _authenticator.renewAuthToken(
    //       request,
    //       onSuccess: (newAuthToken) {
    //         updateAuthToken(newAuthToken);
    //         getData();
    //       },
    //       onError: (_) {
    //         getUserData(int.tryParse(userId) ?? -1, userToken, null);
    //       },
    //     );
    //   },
    // );
  }

  getUserData(
    int userId,
    String userToken,
    bool? deviceIsVerified,
  ) async {
    // final request = GetUserDataRequestEntity(
    //   userId: userId,
    //   userToken: userToken,
    // );

    // await _authenticator.getUserData(
    //   request,
    //   onError: (failure) {
    //     setError(failure);
    //     showAppLoader(false);
    //   },
    //   onSuccess: (success) async {
    //     final newData = ProfilePageData(
    //       deviceIsVerified: deviceIsVerified,
    //       user: success,
    //     );

    //     update(newData, force: true);
    //     await _userManager.updateUserData(success);
    //     showAppLoader(false);
    //   },
    // );
  }

  openHelp(String url) {
    return launchUrlString(url);
  }

  logout() async {
    // eventBus?.clearUserData();
    await Modular.to.pushNamedAndRemoveUntil('/auth', (_) => false);
    // final boolResult = result as bool? ?? false;
    // if (!boolResult) eventBus?.goToMenu(item: BottomNavigationItem.events);
    // if (boolResult) relogged();
  }
}
