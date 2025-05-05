import 'package:dartz/dartz.dart';

import '../../../../utils/failure.dart';
import '../../../../utils/usecase.dart';
import '../entities/change_user_password_request_entity.dart';
import '../repositories/auth_repository.dart';

class ChangeUserPasswordUsecase
    extends Usecase<bool, ChangeUserPasswordRequestEntity> {
  final IAuthRepository repository;
  ChangeUserPasswordUsecase(this.repository);

  @override
  Future<Either<Failure, bool>> call(
    ChangeUserPasswordRequestEntity params,
  ) async {
    return await repository.updateUserdata();
  }
}
