// import 'package:ingresse_clean_arch_sdk/usecase.dart';

// import '../entities/apple_login_request_entity.dart';
// import '../entities/login_user_entity.dart';
// import '../repositories/auth_repository.dart';

// class DoAppleLoginUsecase
//     extends Usecase<LoginUserEntity, AppleLoginRequestEntity> {
//   final IAuthRepository repository;

//   DoAppleLoginUsecase(this.repository);

//   @override
//   Future<Either<Failure, LoginUserEntity>> call(
//     AppleLoginRequestEntity params,
//   ) async {
//     return await repository.doAppleLogin(params.toSDK());
//   }
// }
