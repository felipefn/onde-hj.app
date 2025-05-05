// import 'package:ingresse_clean_arch_sdk/usecase.dart';

// import '../entities/get_email_verification_code_request_entity.dart';
// import '../repositories/auth_repository.dart';

// class GetEmailVerificationCodeUsecase
//     extends Usecase<bool, GetEmailVerificationCodeRequestEntity> {
//   final IAuthRepository repository;
//   GetEmailVerificationCodeUsecase(this.repository);

//   @override
//   Future<Either<Failure, bool>> call(
//     GetEmailVerificationCodeRequestEntity params,
//   ) async {
//     return await repository.getEmailVerificationCode(params.toSDK());
//   }
// }
