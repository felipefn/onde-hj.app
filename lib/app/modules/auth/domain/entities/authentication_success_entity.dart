
import 'package:equatable/equatable.dart';

import 'user_data_entity.dart';

class AuthenticationSuccessEntity extends Equatable {
  final UserDataEntity data;
  final String authToken;
  final bool deviceIsVerified;

  const AuthenticationSuccessEntity({
    required this.data,
    required this.authToken,
    required this.deviceIsVerified,
  });

  @override
  List<Object?> get props => [
        data,
        authToken,
        deviceIsVerified,
      ];
}
