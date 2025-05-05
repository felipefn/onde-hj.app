

import 'package:equatable/equatable.dart';

class LoginUserEntity extends Equatable {
  final String userId;
  final String token;
  final String authToken;
  final bool deviceVerified;

  const LoginUserEntity({
    required this.userId,
    required this.token,
    required this.authToken,
    required this.deviceVerified,
  });

  // LoginUserEntity.fromSDK(LoginResponse response)
  //     : userId = response.data?.userId?.toString() ?? '',
  //       token = response.data?.token ?? '',
  //       authToken = response.data?.authToken ?? '',
  //       deviceVerified = response.data?.device?.verified ?? false;

  @override
  List<Object?> get props => [
        userId,
        token,
        authToken,
        deviceVerified,
      ];
}
