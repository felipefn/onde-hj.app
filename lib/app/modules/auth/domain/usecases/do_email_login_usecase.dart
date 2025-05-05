import 'package:dartz/dartz.dart';

import '../../../../utils/failure.dart';
import '../../../../utils/usecase.dart';
import '../entities/email_login_request_entity.dart';
import '../entities/login_user_entity.dart';
import '../repositories/auth_repository.dart';

class DoEmailLoginUsecase
    extends Usecase<LoginUserEntity, EmailLoginRequestEntity> {
  final IAuthRepository repository;

  DoEmailLoginUsecase(this.repository);

  @override
  Future<Either<Failure, LoginUserEntity>> call(
    EmailLoginRequestEntity params,
  ) async {
    return await repository.doEmailLogin();
  }
}
