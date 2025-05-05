// import 'package:ingresse_clean_arch_sdk/usecase.dart';

// import '../entities/facebank_login_request_entity.dart';
// import '../entities/login_user_entity.dart';
// import '../repositories/auth_repository.dart';

// class DoFacebankLoginUsecase
//     extends Usecase<LoginUserEntity, FacebankLoginRequestEntity> {
//   final IAuthRepository repository;

//   DoFacebankLoginUsecase(this.repository);

//   @override
//   Future<Either<Failure, LoginUserEntity>> call(
//     FacebankLoginRequestEntity params,
//   ) async {
//     return await repository.doFacebankLogin(params.toSDK());
//   }
// }
