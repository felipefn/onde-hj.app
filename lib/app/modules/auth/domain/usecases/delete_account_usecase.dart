import 'package:dartz/dartz.dart';

import '../../../../utils/failure.dart';
import '../../../../utils/usecase.dart';
import '../entities/delete_account_request_entity.dart';
import '../repositories/auth_repository.dart';

class DeleteAccountUsecase extends Usecase<bool, DeleteAccountRequestEntity> {
  final IAuthRepository repository;
  DeleteAccountUsecase(this.repository);

  @override
  Future<Either<Failure, bool>> call(
    DeleteAccountRequestEntity params,
  ) async {
    return await repository.deleteAccount();
  }
}
