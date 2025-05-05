// import 'package:ingresse_network_sdk/models.dart';
// import 'package:ingresse_tools_sdk/ingresse_tools_sdk.dart';

// import '../enums/password_strength.dart';

// class PasswordStrengthEntity extends Equatable {
//   final bool secure;
//   final int max;
//   final int min;
//   final int minAcceptable;
//   final int password;

//   const PasswordStrengthEntity({
//     required this.secure,
//     required this.max,
//     required this.min,
//     required this.minAcceptable,
//     required this.password,
//   });

//   PasswordStrengthEntity.fromSDK(PasswordStrengthResponse response)
//       : secure = response.secure ?? false,
//         max = response.score?.max ?? 0,
//         min = response.score?.min ?? 0,
//         minAcceptable = response.score?.minAcceptable ?? 0,
//         password = response.score?.password ?? 0;

//   PasswordStrength getPasswordStatus() {
//     if (max == 0 && min == 0 && password == 0) {
//       return PasswordStrength.undefined;
//     }

//     final passwordScore = password * 10;
//     final levelsRange = ((max - min) * 10) / 3.0;

//     if (!secure) return PasswordStrength.weak;
//     if (passwordScore < levelsRange) return PasswordStrength.weak;
//     if (passwordScore >= levelsRange && passwordScore <= (levelsRange * 2)) {
//       return PasswordStrength.medium;
//     }

//     return PasswordStrength.strong;
//   }

//   @override
//   List<Object?> get props => [
//         secure,
//         max,
//         min,
//         minAcceptable,
//         password,
//       ];
// }
