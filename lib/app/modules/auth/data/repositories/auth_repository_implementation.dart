// import 'package:ingresse_clean_arch_sdk/usecase.dart';
// import 'package:ingresse_network_sdk/auth_service.dart';
// import 'package:ingresse_network_sdk/country_service.dart';
// import 'package:ingresse_network_sdk/models.dart';
// import 'package:ingresse_network_sdk/security_service.dart';
// import 'package:ingresse_network_sdk/user_service.dart';
// import 'package:ingresse_tools_sdk/ingresse_tools_sdk.dart';

// import '../../domain/entities/company_login_user_entity.dart';
// import '../../domain/entities/country_entity.dart';
// import '../../domain/entities/failures.dart';
// import '../../domain/entities/login_user_entity.dart';
// import '../../domain/entities/password_strength_entity.dart';
// import '../../domain/entities/user_data_entity.dart';
// import '../../domain/repositories/auth_repository.dart';

// class AuthRepositoryImplementation implements IAuthRepository {
//   final AuthService _authService;
//   final UserService _userService;
//   final CountryService _countriesService;
//   final SecurityService _securityService;
//   final InternetHelper _internetHelper;

//   AuthRepositoryImplementation(
//     this._authService,
//     this._userService,
//     this._countriesService,
//     this._securityService,
//     this._internetHelper,
//   );

//   @override
//   Future<Either<Failure, LoginUserEntity>> doEmailLogin(
//     EmailLoginRequest request,
//   ) async {
//     final hasConnection = await _internetHelper.hasNetwork();
//     if (!hasConnection) return Left(NoConnectionFailure());

//     try {
//       final response = await _authService.login(request);

//       if (response == null) return const Left(NullResponseFailure());
//       if (response.responseData?.status == false) {
//         return Left(EmailLoginError());
//       }

//       if (response.responseError != null) {
//         return Left(IngresseFailure.byCode(response.responseError?.code));
//       }

//       return Right(LoginUserEntity.fromSDK(response.responseData!));
//     } on IngresseRequestException catch (e) {
//       return Left(ServerFailure(e.message, e.statusCode));
//     }
//   }

//   @override
//   Future<Either<Failure, List<CompanyLoginUserEntity>>> doCompanyLogin(
//     CompanyLoginRequest request,
//   ) async {
//     final hasConnection = await _internetHelper.hasNetwork();
//     if (!hasConnection) return Left(NoConnectionFailure());

//     try {
//       final response = await _authService.companyLogin(request);

//       final data = response?.responseData?.data;

//       if (response == null) return const Left(NullResponseFailure());
//       if (response.responseData?.status == false) {
//         return Left(EmailLoginError());
//       }

//       if (data == null) {
//         return Left(IngresseFailure.byCode(response.responseError?.code));
//       }

//       final list = data.map((e) => CompanyLoginUserEntity.fromSDK(e)).toList();

//       return Right(list);
//     } on IngresseRequestException catch (e) {
//       return Left(ServerFailure(e.message, e.statusCode));
//     }
//   }

//   @override
//   Future<Either<Failure, LoginUserEntity>> doFacebookLogin(
//     FacebookLoginRequest request,
//   ) async {
//     final hasConnection = await _internetHelper.hasNetwork();
//     if (!hasConnection) return Left(NoConnectionFailure());

//     try {
//       final response = await _authService.facebookLogin(request);

//       if (response == null) return const Left(NullResponseFailure());
//       if (response.responseData?.status == false) {
//         return Left(FacebookLoginError());
//       }

//       if (response.responseError != null) {
//         return Left(IngresseFailure.byCode(response.responseError?.code));
//       }

//       return Right(LoginUserEntity.fromSDK(response.responseData!));
//     } on IngresseRequestException catch (e) {
//       return Left(ServerFailure(e.message, e.statusCode));
//     }
//   }

//   @override
//   Future<Either<Failure, LoginUserEntity>> doFacebankLogin(
//     FacebankLoginRequest request,
//   ) async {
//     final hasConnection = await _internetHelper.hasNetwork();
//     if (!hasConnection) return Left(NoConnectionFailure());

//     try {
//       final response = await _authService.facebankLogin(request);

//       if (response == null) return const Left(NullResponseFailure());
//       if (response.responseData?.status == false) {
//         return Left(FacebankLoginError());
//       }

//       if (response.responseError != null) {
//         return Left(IngresseFailure.byCode(response.responseError?.code));
//       }

//       return Right(LoginUserEntity.fromSDK(response.responseData!));
//     } on IngresseRequestException catch (e) {
//       return Left(ServerFailure(e.message, e.statusCode));
//     }
//   }

//   @override
//   Future<Either<Failure, LoginUserEntity>> doAppleLogin(
//     AppleLoginRequest request,
//   ) async {
//     final hasConnection = await _internetHelper.hasNetwork();
//     if (!hasConnection) return Left(NoConnectionFailure());

//     try {
//       final response = await _authService.appleLogin(request);

//       if (response == null) return const Left(NullResponseFailure());
//       if (response.responseData?.status == false) {
//         return Left(AppleLoginError());
//       }

//       if (response.responseError != null) {
//         return Left(IngresseFailure.byCode(response.responseError?.code));
//       }

//       return Right(LoginUserEntity.fromSDK(response.responseData!));
//     } on IngresseRequestException catch (e) {
//       return Left(ServerFailure(e.message, e.statusCode));
//     }
//   }

//   @override
//   Future<Either<Failure, UserDataEntity>> getUserData(
//     GetUserDataRequest request,
//   ) async {
//     final hasConnection = await _internetHelper.hasNetwork();
//     if (!hasConnection) return Left(NoConnectionFailure());

//     try {
//       final response = await _userService.getUserData(request);
//       if (response == null) return const Left(NullResponseFailure());
//       if (response.responseData == null) {
//         return Left(IngresseFailure.byCode(response.responseError?.code));
//       }

//       final userData = UserDataEntity.fromSDK(
//         response.responseData!,
//         request.userToken,
//       );

//       return Right(userData);
//     } on IngresseRequestException catch (e) {
//       return Left(ServerFailure(e.message, e.statusCode));
//     }
//   }

//   @override
//   Future<Either<Failure, bool>> requestRenewPassword(String email) async {
//     final hasConnection = await _internetHelper.hasNetwork();
//     if (!hasConnection) return Left(NoConnectionFailure());

//     try {
//       final response = await _authService.requestRecoverPassword(email);
//       if (response == null) return const Left(NullResponseFailure());
//       if (response.responseData == null) {
//         return Left(IngresseFailure.byCode(response.responseError?.code));
//       }

//       return Right(response.responseData?.status ?? false);
//     } on IngresseRequestException catch (e) {
//       return Left(ServerFailure(e.message, e.statusCode));
//     }
//   }

//   @override
//   Future<Either<Failure, String>> renewAuthToken(
//       RenewAuthTokenRequest request) async {
//     final hasConnection = await _internetHelper.hasNetwork();
//     if (!hasConnection) return Left(NoConnectionFailure());

//     try {
//       final response = await _authService.renewAuthToken(request);
//       final data = response?.responseData;
//       if (data == null) return const Left(NullResponseFailure());

//       return Right(data.authToken ?? '');
//     } on IngresseRequestException catch (e) {
//       return Left(ServerFailure(e.message, e.statusCode));
//     }
//   }

//   @override
//   Future<Either<Failure, PasswordStrengthEntity>> getPasswordStrength(
//     String password,
//   ) async {
//     final hasConnection = await _internetHelper.hasNetwork();
//     if (!hasConnection) return Left(NoConnectionFailure());

//     try {
//       final response = await _authService.validatePasswordStrength(password);
//       final data = response?.responseData;
//       if (data == null) return const Left(NullResponseFailure());

//       return Right(PasswordStrengthEntity.fromSDK(data));
//     } on IngresseRequestException catch (e) {
//       return Left(ServerFailure(e.message, e.statusCode));
//     }
//   }

//   @override
//   Future<Either<Failure, bool>> cancelGetPasswordStrength() async {
//     _authService.cancelValidatePasswordStrengthRequest();
//     return const Right(true);
//   }

//   @override
//   Future<Either<Failure, List<CountryEntity>>> getCountries(
//     String locale,
//   ) async {
//     final hasConnection = await _internetHelper.hasNetwork();
//     if (!hasConnection) return Left(NoConnectionFailure());

//     try {
//       final response = await _countriesService.getCountries(locale: locale);
//       if (response == null) return const Left(NullResponseFailure());
//       if (response.responseData == null) {
//         return Left(IngresseFailure.byCode(response.responseError?.code));
//       }

//       final parsed = response.responseData
//               ?.map((e) => CountryEntity.fromSDK(e))
//               .toList() ??
//           [];

//       return Right(parsed);
//     } on IngresseRequestException catch (e) {
//       return Left(ServerFailure(e.message, e.statusCode));
//     }
//   }

//   @override
//   Future<Either<Failure, UserDataEntity>> createAccount(
//     CreateAccountRequest request,
//   ) async {
//     final hasConnection = await _internetHelper.hasNetwork();
//     if (!hasConnection) return Left(NoConnectionFailure());

//     try {
//       final response = await _authService.createAccount(request);

//       if (response == null) return const Left(NullResponseFailure());
//       if (response.responseError != null) {
//         return Left(IngresseFailure.byCode(response.responseError?.code));
//       }

//       final accountData = UserDataEntity.fromCreateAccountSDK(
//         response.responseData!.data!,
//       );

//       return Right(accountData);
//     } on IngresseRequestException catch (e) {
//       return Left(ServerFailure(e.message, e.statusCode));
//     }
//   }

//   @override
//   Future<Either<Failure, bool>> updateUserdata(
//     UpdateUserdataRequest request,
//   ) async {
//     final hasConnection = await _internetHelper.hasNetwork();
//     if (!hasConnection) return Left(NoConnectionFailure());

//     try {
//       final response = await _userService.updateUserData(request);

//       if (response == null) return const Left(NullResponseFailure());
//       if (response.responseError != null) {
//         return Left(IngresseFailure.byCode(response.responseError?.code));
//       }

//       return const Right(true);
//     } on IngresseRequestException catch (e) {
//       return Left(ServerFailure(e.message, e.statusCode));
//     }
//   }

//   @override
//   Future<Either<Failure, bool>> deleteAccount(
//     DeleteUserRequest request,
//   ) async {
//     final hasConnection = await _internetHelper.hasNetwork();
//     if (!hasConnection) return Left(NoConnectionFailure());

//     try {
//       final response = await _userService.deleteAccount(request);

//       if (response == null) return const Left(NullResponseFailure());
//       if (response.responseError != null) {
//         return Left(IngresseFailure.byCode(response.responseError?.code));
//       }

//       return Right(response.responseData?.status ?? false);
//     } on IngresseRequestException catch (e) {
//       return Left(ServerFailure(e.message, e.statusCode));
//     }
//   }

//   @override
//   Future<Either<Failure, bool>> getEmailVerificationCode(
//     GetEmailVerificationCodeRequest request,
//   ) async {
//     final hasConnection = await _internetHelper.hasNetwork();
//     if (!hasConnection) return Left(NoConnectionFailure());
//     const requireCodeFailure = RequiredTOTPCode();

//     try {
//       final response = await _securityService.getEmailVerificationCode(request);
//       if (response == null) return const Left(NullResponseFailure());
//       if (response.responseData == null) {
//         if (response.responseError?.code == requireCodeFailure.code) {
//           return const Left(requireCodeFailure);
//         }

//         return Left(IngresseFailure.byCode(response.responseError?.code));
//       }

//       return const Right(true);
//     } on IngresseRequestException catch (e) {
//       final errorCode = e.data['responseError']['code'];

//       if (errorCode == requireCodeFailure.code) {
//         return const Left(requireCodeFailure);
//       }

//       return Left(ServerFailure(e.message, e.statusCode));
//     }
//   }

//   @override
//   Future<Either<Failure, bool>> sendEmailVerificationCode(
//     SendEmailVerificationCodeRequest request,
//   ) async {
//     final hasConnection = await _internetHelper.hasNetwork();
//     if (!hasConnection) return Left(NoConnectionFailure());

//     try {
//       final response =
//           await _securityService.sendEmailVerificationCode(request);
//       if (response == null) return const Left(NullResponseFailure());
//       if (response.responseError != null) {
//         final invalidCodeFailure = InvalidTOTPCode();
//         if (response.responseError?.code == invalidCodeFailure.code) {
//           return Left(invalidCodeFailure);
//         }

//         return Left(IngresseFailure.byCode(response.responseError?.code));
//       }

//       return const Right(true);
//     } on IngresseRequestException catch (e) {
//       final errorCode = e.data['responseError']['code'];

//       final invalidCodeFailure = InvalidTOTPCode();
//       if (errorCode == invalidCodeFailure.code) {
//         return Left(invalidCodeFailure);
//       }

//       return Left(ServerFailure(e.message, e.statusCode));
//     }
//   }
// }
