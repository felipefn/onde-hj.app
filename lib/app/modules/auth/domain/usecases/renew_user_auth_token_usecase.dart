import 'package:dartz/dartz.dart';


import '../../../../utils/failure.dart';
import '../../../../utils/usecase.dart';
import '../repositories/auth_repository.dart';

class RenewUserAuthTokenUsecase
    extends Usecase<String, RenewAuthTokenRequestEntity> {
  final IAuthRepository repository;
  RenewUserAuthTokenUsecase(this.repository);

  @override
  Future<Either<Failure, String>> call(
    RenewAuthTokenRequestEntity params,
  ) async {
    return await repository.renewAuthToken(params);
  }
}

class RenewAuthTokenRequestEntity {
}
