

import 'package:equatable/equatable.dart';

class GetUserDataRequestEntity extends Equatable {
  final int userId;
  final String userToken;

  const GetUserDataRequestEntity({
    required this.userId,
    required this.userToken,
  });

  // GetUserDataRequest toSDK() => GetUserDataRequest(
  //       userId: userId,
  //       userToken: userToken,
  //     );

  @override
  List<Object> get props => [userId, userToken];
}
