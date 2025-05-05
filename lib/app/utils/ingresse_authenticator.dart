

import '../modules/auth/presenter/stores/auth_store.dart';

class OndeHjAuthenticator {
  // final IMainClient _client;
  // final EventBus? eventBus;

  // late final _repository = AuthRepositoryImplementation(
  //   AuthService(_client),
  //   UserService(_client),
  //   CountryService(_client),
  //   SecurityService(_client),
  //   InternetHelper(),
  // );

  late final AuthStore authStore = AuthStore(
    // DoEmailLoginUsecase(_repository),
    // DoCompanyLoginUsecase(_repository),
    // DoFacebookLoginUsecase(_repository),
    // DoFacebankLoginUsecase(_repository),
    // DoAppleLoginUsecase(_repository),
    // GetUserDataUsecase(_repository),
    // RequestRenewPasswordUsecase(_repository),
    // RenewUserAuthTokenUsecase(_repository),
    // CreateAccountUsecase(_repository),
    // CompleteUserDataUsecase(_repository),
    // ChangeUserPasswordUsecase(_repository),
    // DeleteAccountUsecase(_repository),
  );

  // late final getCountriesUsecase = GetCountriesUsecase(_repository);
  // late final getPasswordStrengthUsecase =
  //     GetPasswordStrengthUsecase(_repository);
  // late final cancelGetPasswordStrengthRequestUsecase =
  //     CancelPasswordStrengthRequestUsecase(_repository);

  // late final GetEmailVerificationCodeUsecase getEmailverificationCodeUsecase =
  //     GetEmailVerificationCodeUsecase(_repository);
  // late final SendEmailVerificationCodeUsecase sendEmailverificationCodeUsecase =
  //     SendEmailVerificationCodeUsecase(_repository);

  // OndeHjAuthenticator(this._client, this.eventBus);

  // facebookAuthentication({
  //   required void Function(Failure) onError,
  //   required void Function(FacebookAuthenticationData) onSuccess,
  // }) async {
  //   authStore.facebookAuthentication(onError: onError, onSuccess: onSuccess);
  // }

  // facebankAuthentication({
  //   required void Function(Failure) onError,
  //   required void Function(FacebankAuthResponse) onSuccess,
  // }) async {
  //   authStore.facebankAuthentication(onError: onError, onSuccess: onSuccess);
  // }

  // appleAuthentication({
  //   required void Function(Failure) onError,
  //   required void Function(AppleAuthResponse) onSuccess,
  // }) async {
  //   authStore.appleAuthentication(onError: onError, onSuccess: onSuccess);
  // }

  // doLogin(
  //   EmailLoginRequestEntity request, {
  //   required void Function(Failure) onError,
  //   required void Function(LoginUserEntity) onSuccess,
  // }) async {
  //   authStore.doLogin(request, onError: onError, onSuccess: onSuccess);
  // }

  // doFacebookLogin(
  //   FacebookLoginRequestEntity request, {
  //   required void Function(Failure) onError,
  //   required void Function(LoginUserEntity) onSuccess,
  // }) async {
  //   authStore.doFacebookLogin(request, onError: onError, onSuccess: onSuccess);
  // }

  // doFacebankLogin(
  //   FacebankLoginRequestEntity request, {
  //   required void Function(Failure) onError,
  //   required void Function(LoginUserEntity) onSuccess,
  // }) async {
  //   authStore.doFacebankLogin(request, onError: onError, onSuccess: onSuccess);
  // }

  // doAppleLogin(
  //   AppleLoginRequestEntity request, {
  //   required void Function(Failure) onError,
  //   required void Function(LoginUserEntity) onSuccess,
  // }) async {
  //   authStore.doAppleLogin(request, onError: onError, onSuccess: onSuccess);
  // }

  // getUserData(
  //   GetUserDataRequestEntity request, {
  //   required void Function(Failure) onError,
  //   required void Function(UserDataEntity) onSuccess,
  // }) async {
  //   authStore.getUserData(request, onError: onError, onSuccess: onSuccess);
  // }

  // renewPassword(
  //   String email, {
  //   required void Function(Failure) onError,
  //   required void Function(bool) onSuccess,
  // }) async {
  //   authStore.renewPassword(email, onError: onError, onSuccess: onSuccess);
  // }

  // renewAuthToken(
  //   RenewAuthTokenRequestEntity request, {
  //   required void Function(Failure) onError,
  //   required void Function(String) onSuccess,
  // }) async {
  //   authStore.renewAuthToken(request, onError: onError, onSuccess: onSuccess);
  // }
}
