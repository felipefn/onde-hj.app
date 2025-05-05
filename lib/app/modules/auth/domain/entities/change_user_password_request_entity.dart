import 'package:equatable/equatable.dart';


class ChangeUserPasswordRequestEntity extends Equatable {
  final int userId;
  final String userToken;
  final String password;
  final String newPassword;

  const ChangeUserPasswordRequestEntity({
    required this.userId,
    required this.userToken,
    required this.password,
    required this.newPassword,
  });

  // UpdateUserdataRequest toSDK() {
  //   return UpdateUserdataRequest(
  //     userId: userId,
  //     userToken: userToken,
  //     password: password,
  //     newPassword: newPassword,
  //   );
  // }

  @override
  List<Object?> get props => [
        userId,
        userToken,
        password,
        newPassword,
      ];
}
