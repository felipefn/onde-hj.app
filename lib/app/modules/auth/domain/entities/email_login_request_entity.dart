

import 'package:equatable/equatable.dart';

class EmailLoginRequestEntity extends Equatable {
  final String email;
  final String password;
  // final DeviceInfo device;

  const EmailLoginRequestEntity({
    required this.email,
    required this.password,
    // required this.device,
  });

  // EmailLoginRequest toSDK() => EmailLoginRequest(
  //       email: email,
  //       password: password,
  //       device: AuthDevice(
  //         id: device.deviceId,
  //         name: '${device.brand} ${device.model}',
  //         type: 'mobile',
  //       ),
  //     );

  // CompanyLoginRequest toCompanyLoginSDK() => CompanyLoginRequest(
  //       email: email,
  //       password: password,
  //       device: AuthDevice(
  //         id: device.deviceId,
  //         name: '${device.brand} ${device.model}',
  //         type: 'mobile',
  //       ),
  //     );

  @override
  List<Object> get props => [
        email,
        password,
        // device,
      ];
}
