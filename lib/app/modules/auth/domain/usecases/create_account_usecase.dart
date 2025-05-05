import 'package:dartz/dartz.dart';

import '../../../../utils/failure.dart';
import '../../../../utils/usecase.dart';
import '../entities/create_account_request_entity.dart';
import '../entities/user_data_entity.dart';
import '../repositories/auth_repository.dart';

class CreateAccountUsecase
    extends Usecase<UserDataEntity, CreateAccountRequestEntity> {
  final IAuthRepository repository;
  CreateAccountUsecase(this.repository);

  @override
  Future<Either<Failure, UserDataEntity>> call(
    CreateAccountRequestEntity params,
  ) async {
    return await repository.createAccount();
  }
}
