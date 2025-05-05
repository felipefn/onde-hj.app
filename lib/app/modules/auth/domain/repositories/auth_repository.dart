import 'package:dartz/dartz.dart';
import 'package:ondehj_app/app/modules/auth/domain/usecases/renew_user_auth_token_usecase.dart';
import 'package:ondehj_app/app/modules/auth/domain/usecases/send_email_verification_code_usecase.dart';

import '../../../../utils/failure.dart';
import '../entities/login_user_entity.dart';
// import '../entities/password_strength_entity.dart';
import '../entities/user_data_entity.dart';

abstract class IAuthRepository {
  Future<Either<Failure, LoginUserEntity>> doEmailLogin(
    // EmailLoginRequest request,
  );

  // Future<Either<Failure, List<CompanyLoginUserEntity>>> doCompanyLogin(
  //   CompanyLoginRequest request,
  // );

  // Future<Either<Failure, LoginUserEntity>> doFacebookLogin(
  //   FacebookLoginRequest request,
  // );

  // Future<Either<Failure, LoginUserEntity>> doFacebankLogin(
  //   FacebankLoginRequest request,
  // );

  // Future<Either<Failure, LoginUserEntity>> doAppleLogin(
  //   AppleLoginRequest request,
  // );

  Future<Either<Failure, UserDataEntity>> getUserData(
    // GetUserDataRequest request,
  );

  Future<Either<Failure, bool>> requestRenewPassword(String email);

  // Future<Either<Failure, String>> renewAuthToken(
  //   RenewAuthTokenRequest request,
  // );

  // Future<Either<Failure, PasswordStrengthEntity>> getPasswordStrength(
  //   String password,
  // );

  // Future<Either<Failure, bool>> cancelGetPasswordStrength();

  // Future<Either<Failure, List<CountryEntity>>> getCountries(String locale);

  Future<Either<Failure, UserDataEntity>> createAccount(
    // CreateAccountRequest request,
  );

  // Future<Either<Failure, bool>> updateUserdata(UpdateUserdataRequest request);

  Future<Either<Failure, bool>> deleteAccount(
    // DeleteUserRequest request,
  );

  sendEmailVerificationCode(SendEmailVerificationCodeRequestEntity params) {}

  renewAuthToken(RenewAuthTokenRequestEntity params) {}

  updateUserdata() {}

  // Future<Either<Failure, bool>> getEmailVerificationCode(
  //   GetEmailVerificationCodeRequest request,
  // );

  // Future<Either<Failure, bool>> sendEmailVerificationCode(
  //   // SendEmailVerificationCodeRequest request,
  // );
}
