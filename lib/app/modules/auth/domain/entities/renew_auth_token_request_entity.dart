// import 'package:ingresse_network_sdk/auth_service.dart';
// import 'package:ingresse_tools_sdk/ingresse_tools_sdk.dart';

// class RenewAuthTokenRequestEntity extends Equatable {
//   final String userToken;
//   final DeviceInfo device;

//   const RenewAuthTokenRequestEntity({
//     required this.userToken,
//     required this.device,
//   });

//   RenewAuthTokenRequest toSDK() => RenewAuthTokenRequest(
//         userToken: userToken,
//         device: AuthDevice(
//           id: device.deviceId,
//           name: '${device.brand} ${device.model}',
//           type: 'mobile',
//         ),
//       );

//   @override
//   List<Object> get props => [device, userToken];
// }
