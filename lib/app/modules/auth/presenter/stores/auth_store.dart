

import '../../../../utils/failure.dart';
import '../../domain/entities/change_user_password_request_entity.dart';
import '../../domain/entities/complete_user_data_request_entity.dart';
import '../../domain/entities/create_account_request_entity.dart';
import '../../domain/entities/delete_account_request_entity.dart';
import '../../domain/entities/email_login_request_entity.dart';
import '../../domain/entities/get_user_data_request_entity.dart';
import '../../domain/entities/login_user_entity.dart';
import '../../domain/entities/user_data_entity.dart';
import '../../domain/usecases/renew_user_auth_token_usecase.dart';

class AuthStore {
  // final DoEmailLoginUsecase _loginUsecase;
  // final DoCompanyLoginUsecase _companyLoginUsecase;
  // final DoFacebookLoginUsecase _facebookUsecase;
  // final DoFacebankLoginUsecase _facebankUsecase;
  // final DoAppleLoginUsecase _appleUsecase;
  // final GetUserDataUsecase _getDataUsecase;
  // final RequestRenewPasswordUsecase _forgotPasswordUsecase;
  // final RenewUserAuthTokenUsecase _renewAuthTokenUsecase;
  // final CreateAccountUsecase _createAccountUsecase;
  // final CompleteUserDataUsecase _completeUserUsecase;
  // final ChangeUserPasswordUsecase _changePasswordUsecase;
  // final DeleteAccountUsecase _deleteAccountUsecase;

  // UserDataEntity? data;

  AuthStore(
    // this._loginUsecase,
    // this._companyLoginUsecase,
    // this._facebookUsecase,
    // this._facebankUsecase,
    // this._appleUsecase,
    // this._getDataUsecase,
    // this._forgotPasswordUsecase,
    // this._renewAuthTokenUsecase,
    // this._createAccountUsecase,
    // this._completeUserUsecase,
    // this._changePasswordUsecase,
    // this._deleteAccountUsecase,
  );

  // facebookAuthentication({
  //   required void Function(Failure) onError,
  //   required void Function(FacebookAuthenticationData) onSuccess,
  // }) async {
  //   final LoginResult result = await FacebookAuth.instance.login();
  //   if (result.status != LoginStatus.success) {
  //     onError(FacebookLoginError());
  //     return;
  //   }

  //   final AccessToken accessToken = result.accessToken!;
  //   final userData = await FacebookAuth.instance.getUserData();
  //   onSuccess(
  //     FacebookAuthenticationData(
  //       token: accessToken.token,
  //       userId: accessToken.userId,
  //       email: userData['email'],
  //     ),
  //   );
  // }

  // facebankAuthentication({
  //   required void Function(Failure) onError,
  //   required void Function(FacebankAuthResponse) onSuccess,
  // }) async {
  //   final client = OAuth2Client(
  //     authorizeUrl: 'https://account.facebank.com/oauth2/auth/',
  //     tokenUrl: 'https://account.facebank.com/oauth2/token',
  //     redirectUri: 'ingresse://facebank',
  //     customUriScheme: 'ingresse',
  //   );

  //   try {
  //     final result = await client.requestAuthorization(
  //       clientId: 'Ingresse_z2t9mC',
  //       scopes: ['openid', 'profile', 'offline', 'email'],
  //       customParams: {'allowSignUp': 'false'},
  //     );

  //     final successResult = FacebankAuthResponse(
  //       authorizationCode: result.code ?? 'unknnown',
  //       redirectUri: client.redirectUri,
  //     );

  //     onSuccess(successResult);
  //   } catch (e) {
  //     onError(FacebankLoginError());
  //   }
  // }

  // appleAuthentication({
  //   required void Function(Failure) onError,
  //   required void Function(AppleAuthResponse) onSuccess,
  // }) async {
  //   try {
  //     final credential = await SignInWithApple.getAppleIDCredential(
  //       scopes: [
  //         AppleIDAuthorizationScopes.email,
  //         AppleIDAuthorizationScopes.fullName,
  //       ],
  //     );

  //     final response = AppleAuthResponse(
  //       authorizationCode: credential.authorizationCode,
  //       identityToken: credential.identityToken ?? '',
  //       userIdentifier: credential.userIdentifier ?? '',
  //     );

  //     onSuccess(response);
  //   } catch (e) {
  //     onError(AppleLoginError());
  //   }
  // }

  doLogin(
    EmailLoginRequestEntity request, {
    required void Function(Failure) onError,
    required void Function(LoginUserEntity) onSuccess,
  }) async {
    // final response = await _loginUsecase(request);
    // response.fold(onError, onSuccess);
  }

  // doCompanyLogin(
  //   EmailLoginRequestEntity request, {
  //   required void Function(Failure) onError,
  //   required void Function(List<CompanyLoginUserEntity>) onSuccess,
  // }) async {
  //   final response = await _companyLoginUsecase(request);
  //   response.fold(onError, onSuccess);
  // }

  // doFacebookLogin(
  //   FacebookLoginRequestEntity request, {
  //   required void Function(Failure) onError,
  //   required void Function(LoginUserEntity) onSuccess,
  // }) async {
  //   final response = await _facebookUsecase(request);
  //   response.fold(onError, onSuccess);
  // }

  // doFacebankLogin(
  //   FacebankLoginRequestEntity request, {
  //   required void Function(Failure) onError,
  //   required void Function(LoginUserEntity) onSuccess,
  // }) async {
  //   final response = await _facebankUsecase(request);
  //   response.fold(onError, onSuccess);
  // }

  // doAppleLogin(
  //   AppleLoginRequestEntity request, {
  //   required void Function(Failure) onError,
  //   required void Function(LoginUserEntity) onSuccess,
  // }) async {
  //   final response = await _appleUsecase(request);
  //   response.fold(onError, onSuccess);
  // }

  getUserData(
    GetUserDataRequestEntity request, {
    required void Function(Failure) onError,
    required void Function(UserDataEntity) onSuccess,
  }) async {
    // final response = await _getDataUsecase(request);
    // response.fold(onError, (newData) async {
    //   data = newData;
    //   onSuccess(newData);
    // });
  }

  renewPassword(
    String email, {
    required void Function(Failure) onError,
    required void Function(bool) onSuccess,
  }) async {
    // final response = await _forgotPasswordUsecase(email);
    // response.fold(onError, onSuccess);
  }

  renewAuthToken(
    RenewAuthTokenRequestEntity request, {
    required void Function(Failure) onError,
    required void Function(String) onSuccess,
  }) async {
    // final response = await _renewAuthTokenUsecase(request);
    // response.fold(onError, onSuccess);
  }

  createAccount(
    CreateAccountRequestEntity request, {
    required void Function(Failure) onError,
    required void Function(UserDataEntity) onSuccess,
  }) async {
    // final response = await _createAccountUsecase(request);
    // response.fold(onError, (newData) async {
    //   onSuccess(newData);
    // });
  }

  completeUserData(
    CompleteUserDataRequestEntity request, {
    required void Function(Failure) onError,
    required void Function(bool) onSuccess,
  }) async {
    // final response = await _completeUserUsecase(request);
    // response.fold(onError, (newData) async {
    //   onSuccess(newData);
    // });
  }

  changeUserPassword(
    ChangeUserPasswordRequestEntity request, {
    required void Function(Failure) onError,
    required void Function(bool) onSuccess,
  }) async {
    // final response = await _changePasswordUsecase(request);
    // response.fold(onError, (newData) async {
    //   onSuccess(newData);
    // });
  }

  Future deleteAccount(
    DeleteAccountRequestEntity request, {
    required void Function(Failure) onError,
    required void Function(bool) onSuccess,
  }) async {
    // final response = await _deleteAccountUsecase(request);
    // response.fold(onError, (newData) async {
    //   onSuccess(newData);
    // });
  }
}
