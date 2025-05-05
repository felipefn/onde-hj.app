


import 'package:equatable/equatable.dart';

import '../enums/gender.dart';


class CompleteUserDataRequestEntity extends Equatable {
  final int userId;
  final String userToken;
  final String? ddi;
  final String? phone;
  // final CountryEntity? country;
  final String? document;
  final DateTime? birthdate;
  final Gender? gender;

  const CompleteUserDataRequestEntity({
    required this.userId,
    required this.userToken,
    this.ddi,
    this.phone,
    // this.country,
    this.document,
    this.birthdate,
    this.gender,
  });

  // UpdateUserdataRequest toSDK() {
  //   final birthdateFormat = DateFormat('yyyy-MM-dd');
  //   final sdkBirthdate =
  //       birthdate == null ? null : birthdateFormat.format(birthdate!);

  //   Nationality? nationality;
  //   if (country != null) {
  //     nationality = country?.alpha3Code == defaultCountry.alpha3Code
  //         ? Nationality.brazilian
  //         : Nationality.foreign;
  //   }

  //   final isBrazillian = nationality == Nationality.brazilian;
  //   final sdkDocument = isBrazillian ? document.onlyDigits() : document;

  //   return UpdateUserdataRequest(
  //     userId: userId,
  //     userToken: userToken,
  //     ddi: (ddi ?? '').isEmpty ? null : ddi.onlyDigits(),
  //     phone: (phone ?? '').isEmpty ? null : phone.onlyDigits(),
  //     gender: gender?.id,
  //     nationality: country?.alpha3Code,
  //     birthdate: sdkBirthdate,
  //     identity: (document ?? '').isEmpty
  //         ? null
  //         : AuthIdentity(
  //             id: sdkDocument ?? '',
  //             type: nationality?.documentId ?? 1,
  //           ),
  //   );
  // }

  @override
  List<Object?> get props => [
        userId,
        userToken,
        ddi,
        phone,
        // country,
        document,
        birthdate,
        gender,
      ];
}
