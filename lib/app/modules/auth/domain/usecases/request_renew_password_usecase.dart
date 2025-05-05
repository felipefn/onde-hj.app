import 'package:dartz/dartz.dart';

import '../../../../utils/failure.dart';
import '../../../../utils/usecase.dart';
import '../repositories/auth_repository.dart';

class RequestRenewPasswordUsecase extends Usecase<bool, String> {
  final IAuthRepository repository;

  RequestRenewPasswordUsecase(this.repository);

  @override
  Future<Either<Failure, bool>> call(String params) async {
    return await repository.requestRenewPassword(params);
  }
}
