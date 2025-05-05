

import 'package:equatable/equatable.dart';

class DeleteAccountRequestEntity extends Equatable {
  final int userId;
  final String userToken;

  const DeleteAccountRequestEntity({
    required this.userId,
    required this.userToken,
  });

  // DeleteUserRequest toSDK() {
  //   return DeleteUserRequest(
  //     userId: userId.toString(),
  //     usertoken: userToken,
  //   );
  // }

  @override
  List<Object?> get props => [
        userId,
        userToken,
      ];
}
