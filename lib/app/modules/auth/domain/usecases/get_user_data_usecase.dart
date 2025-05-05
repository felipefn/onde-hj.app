import 'package:dartz/dartz.dart';


import '../../../../utils/failure.dart';
import '../../../../utils/usecase.dart';
import '../entities/get_user_data_request_entity.dart';
import '../entities/user_data_entity.dart';
import '../repositories/auth_repository.dart';

class GetUserDataUsecase
    extends Usecase<UserDataEntity, GetUserDataRequestEntity> {
  final IAuthRepository repository;
  GetUserDataUsecase(this.repository);

  @override
  Future<Either<Failure, UserDataEntity>> call(
    GetUserDataRequestEntity params,
  ) async {
    return await repository.getUserData();
  }
}
