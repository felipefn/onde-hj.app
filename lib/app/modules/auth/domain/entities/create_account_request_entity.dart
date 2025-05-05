


import 'package:equatable/equatable.dart';

import '../enums/gender.dart';


class CreateAccountRequestEntity extends Equatable {
  final String fullname;
  final String email;
  final String password;
  final String ddi;
  final String phone;
  final Gender? gender;
  // final CountryEntity? country;
  final String? document;
  final DateTime? birthdate;
  final bool news;

  const CreateAccountRequestEntity({
    required this.fullname,
    required this.ddi,
    required this.phone,
    // this.country,
    this.document,
    this.birthdate,
    this.gender,
    required this.email,
    required this.password,
    required this.news,
  });

  // CreateAccountRequest toSDK() {
  //   final birthdateFormat = DateFormat('yyyy-MM-dd');
  //   final sdkBirthdate =
  //       birthdate == null ? null : birthdateFormat.format(birthdate!);
  //   final splittedName = fullname.split(' ');
  //   final lastName =
  //       splittedName.length > 1 ? splittedName.sublist(1).join(' ') : '';

  //   Nationality? nationality;
  //   if (country != null) {
  //     nationality = country?.alpha3Code == defaultCountry.alpha3Code
  //         ? Nationality.brazilian
  //         : Nationality.foreign;
  //   }

  //   final isBrazillian = nationality == Nationality.brazilian;
  //   final sdkDocument = isBrazillian ? document.onlyDigits() : document;
  //   final sendDocument =
  //       (document ?? '').replaceAll(RegExp(r'\s+'), '').isNotEmpty;

  //   return CreateAccountRequest(
  //     name: splittedName.firstOrNull ?? '',
  //     lastName: lastName,
  //     email: email,
  //     password: password,
  //     news: news,
  //     ddi: ddi.onlyDigits(),
  //     phone: phone.onlyDigits(),
  //     gender: gender?.id,
  //     nationality: country?.alpha3Code,
  //     birthdate: sdkBirthdate,
  //     identity: nationality == null || !sendDocument
  //         ? null
  //         : AuthIdentity(
  //             id: sdkDocument ?? '',
  //             type: nationality.documentId,
  //           ),
  //   );
  // }

  @override
  List<Object?> get props => [
        fullname,
        email,
        password,
        news,
        phone,
        gender,
        // country,
        document,
        birthdate,
      ];
}
