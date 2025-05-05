// import 'package:ingresse_clean_arch_sdk/usecase.dart';

// import '../entities/facebook_login_request_entity.dart';
// import '../entities/login_user_entity.dart';
// import '../repositories/auth_repository.dart';

// class DoFacebookLoginUsecase
//     extends Usecase<LoginUserEntity, FacebookLoginRequestEntity> {
//   final IAuthRepository repository;

//   DoFacebookLoginUsecase(this.repository);

//   @override
//   Future<Either<Failure, LoginUserEntity>> call(
//     FacebookLoginRequestEntity params,
//   ) async {
//     return await repository.doFacebookLogin(params.toSDK());
//   }
// }
