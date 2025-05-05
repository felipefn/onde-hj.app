import 'package:dartz/dartz.dart';

import '../../../../utils/failure.dart';
import '../../../../utils/usecase.dart';
import '../repositories/auth_repository.dart';

class SendEmailVerificationCodeUsecase
    extends Usecase<bool, SendEmailVerificationCodeRequestEntity> {
  final IAuthRepository repository;
  SendEmailVerificationCodeUsecase(this.repository);

  @override
  Future<Either<Failure, bool>> call(
    SendEmailVerificationCodeRequestEntity params,
  ) async {
    return await repository.sendEmailVerificationCode(params);
  }
}

class SendEmailVerificationCodeRequestEntity {
}


