

import 'package:dartz/dartz.dart';

import '../../../../utils/failure.dart';
import '../../../../utils/usecase.dart';
import '../entities/complete_user_data_request_entity.dart';
import '../repositories/auth_repository.dart';

class CompleteUserDataUsecase
    extends Usecase<bool, CompleteUserDataRequestEntity> {
  final IAuthRepository repository;
  CompleteUserDataUsecase(this.repository);

  @override
  Future<Either<Failure, bool>> call(
    CompleteUserDataRequestEntity params,
  ) async {
    return await repository.updateUserdata();
  }
}
