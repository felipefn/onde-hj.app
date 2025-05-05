// import 'package:ingresse_clean_arch_sdk/usecase.dart';

// import '../entities/company_login_user_entity.dart';
// import '../entities/email_login_request_entity.dart';
// import '../repositories/auth_repository.dart';

// class DoCompanyLoginUsecase
//     extends Usecase<List<CompanyLoginUserEntity>, EmailLoginRequestEntity> {
//   final IAuthRepository repository;

//   DoCompanyLoginUsecase(this.repository);

//   @override
//   Future<Either<Failure, List<CompanyLoginUserEntity>>> call(
//     EmailLoginRequestEntity params,
//   ) async {
//     return await repository.doCompanyLogin(params.toCompanyLoginSDK());
//   }
// }
