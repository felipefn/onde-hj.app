

import 'package:equatable/equatable.dart';

import '../../../../utils/cast_or_null.dart';

class UserDataEntity extends Equatable {
  final int userId;
  final String name;
  final String email;
  final String picture;

  final String userToken;
  final String facebookId;
  final String nationality;
  final String document;
  final String documentType;
  final int documentTypeId;
  final String phone;
  // final String ddi;
  final String birthdate;
  final String gender;
  final bool verified;
  final int type;
  final String street;
  final String number;
  final String complement;
  final String district;
  final String zip;
  final String city;
  final String state;
  final String addressCountry;
  final bool faceRecognitionEnabled;

  final int? plannerId;
  final String? plannerName;
  final String? plannerEmail;
  final String? plannerPhone;
  final String? plannerLogo;
  final String? plannerLink;
  final String? plannerFormalName;
  final String? plannerCityNumber;
  final String? plannerCpf;
  final String? plannerCnpj;
  final String? plannerPictures;
  final String? plannerObservation;

  static const String _userId = 'userId';
  static const String _name = 'name';
  static const String _email = 'email';
  static const String _picture = 'picture';
  static const String _userToken = 'token';
  static const String _facebookId = 'facebookId';
  static const String _nationality = 'nationality';
  static const String _document = 'document';
  static const String _documentType = 'documentType';
  static const String _documentTypeId = 'documentTypeId';
  static const String _phone = 'phone';
  // static const String _ddi = 'ddi';
  static const String _birthdate = 'birthdate';
  static const String _gender = 'gender';
  static const String _verified = 'verified';
  static const String _type = 'type';
  static const String _street = 'street';
  static const String _number = 'number';
  static const String _complement = 'complement';
  static const String _district = 'district';
  static const String _zip = 'zip';
  static const String _city = 'city';
  static const String _state = 'state';
  static const String _addressCountry = 'addressCountry';
  static const String _faceRecognitionEnabled = 'faceRecognitionEnabled';

  static const String _plannerId = 'plannerId';
  static const String _plannerName = 'plannerName';
  static const String _plannerEmail = 'plannerEmail';
  static const String _plannerPhone = 'plannerPhone';
  static const String _plannerLogo = 'plannerLogo';
  static const String _plannerLink = 'plannerLink';
  static const String _plannerFormalName = 'plannerFormalName';
  static const String _plannerCityNumber = 'plannerCityNumber';
  static const String _plannerCpf = 'plannerCpf';
  static const String _plannerCnpj = 'plannerCnpj';
  static const String _plannerPictures = 'plannerPictures';
  static const String _plannerObservation = 'plannerObservation';

  const UserDataEntity({
    required this.userId,
    required this.name,
    required this.email,
    required this.picture,
    required this.userToken,
    this.facebookId = '',
    this.nationality = '',
    this.document = '',
    this.documentType = '',
    this.documentTypeId = 0,
    this.phone = '',
    // this.ddi = '',
    this.birthdate = '',
    this.gender = '',
    this.verified = false,
    this.type = -1,
    this.street = '',
    this.number = '',
    this.complement = '',
    this.district = '',
    this.zip = '',
    this.city = '',
    this.state = '',
    this.addressCountry = '',
    this.faceRecognitionEnabled = false,
    this.plannerId,
    this.plannerName,
    this.plannerEmail,
    this.plannerPhone,
    this.plannerLogo,
    this.plannerLink,
    this.plannerFormalName,
    this.plannerCityNumber,
    this.plannerCpf,
    this.plannerCnpj,
    this.plannerPictures,
    this.plannerObservation,
  });

  // UserDataEntity.fromSDK(
  //   UserData data,
  //   this.userToken,
  // )   : userId = data.id ?? -1,
  //       name = data.name ?? '',
  //       picture = data.pictures?.lastOrNull?.link ?? '',
  //       email = data.email ?? '',
  //       facebookId = data.fbUserId?.toString() ?? '-1',
  //       nationality = data.nationality ?? '',
  //       document = data.identity?.id ?? '',
  //       documentType = data.identity?.type?.name ?? '',
  //       documentTypeId = data.identity?.type?.id ?? 0,
  //       phone = data.phone?.number ?? '',
        // ddi = data.phone?.ddi?.toString() ?? defaultCountry.callingCode,
  //       birthdate = data.birthdate ?? '',
  //       gender = data.gender ?? '',
  //       verified = data.verified ?? false,
  //       type = data.type ?? -1,
  //       street = data.address?.street ?? '',
  //       number = data.address?.number ?? '',
  //       complement = data.address?.complement ?? '',
  //       district = data.address?.district ?? '',
  //       zip = data.address?.zipcode ?? '',
  //       city = data.address?.city ?? '',
  //       state = data.address?.state ?? '',
  //       addressCountry = data.address?.country ?? '',
  //       faceRecognitionEnabled = data.faceRecognition?.enabled ?? false,
  //       plannerId = data.planner?.id,
  //       plannerName = data.planner?.name,
  //       plannerEmail = data.planner?.email,
  //       plannerPhone = data.planner?.phone,
  //       plannerLogo = data.planner?.logo,
  //       plannerLink = data.planner?.link,
  //       plannerFormalName = data.planner?.formalName,
  //       plannerCityNumber = data.planner?.cityNumber,
  //       plannerCpf = data.planner?.cpf,
  //       plannerCnpj = data.planner?.cnpj,
  //       plannerPictures = data.planner?.pictures?.lastOrNull?.link,
  //       plannerObservation = data.planner?.observation;

  // UserDataEntity.fromCreateAccountSDK(CreateAccountResponseData data)
  //     : userId = data.userId ?? -1,
  //       userToken = data.token ?? '',
  //       name = data.name ?? '',
  //       picture = '',
  //       email = data.email ?? '',
  //       facebookId = '-1',
  //       nationality = data.nationality ?? '',
  //       document = data.identity?.id ?? '',
  //       documentType = data.identity?.type?.name ?? '',
  //       documentTypeId = data.identity?.type?.id ?? 0,
  //       phone = data.phone ?? '',
        // ddi = data.ddi ?? defaultCountry.callingCode,
  //       birthdate = data.birthdate ?? '',
  //       gender = data.gender ?? '',
  //       verified = data.verified ?? false,
  //       type = -1,
  //       street = '',
  //       number = '',
  //       complement = '',
  //       district = '',
  //       zip = '',
  //       city = '',
  //       state = '',
  //       addressCountry = '',
  //       faceRecognitionEnabled = false,
  //       plannerId = null,
  //       plannerName = null,
  //       plannerEmail = null,
  //       plannerPhone = null,
  //       plannerLogo = null,
  //       plannerLink = null,
  //       plannerFormalName = null,
  //       plannerCityNumber = null,
  //       plannerCpf = null,
  //       plannerCnpj = null,
  //       plannerPictures = null,
  //       plannerObservation = null;

  UserDataEntity.fromJson(
    Map<String, dynamic> json,
  )   : userId = castOrNull(json[_userId]) ?? -1,
        userToken = castOrNull(json[_userToken]) ?? '',
        name = castOrNull(json[_name]) ?? '',
        picture = castOrNull(json[_picture]) ?? '',
        email = castOrNull(json[_email]) ?? '',
        facebookId = castOrNull(json[_facebookId])?.toString() ?? '-1',
        nationality = castOrNull(json[_nationality]) ?? '',
        document = castOrNull(json[_document]) ?? '',
        documentType = castOrNull(json[_documentType]) ?? '',
        documentTypeId = castOrNull(json[_documentTypeId]) ?? 0,
        phone = castOrNull(json[_phone]) ?? '',
        // ddi = castOrNull(json[_ddi]) ?? defaultCountry.callingCode,
        birthdate = castOrNull(json[_birthdate]) ?? '',
        gender = castOrNull(json[_gender]) ?? '',
        verified = castOrNull(json[_verified]) ?? false,
        type = castOrNull(json[_type]) ?? -1,
        street = castOrNull(json[_street]) ?? '',
        number = castOrNull(json[_number]) ?? '',
        complement = castOrNull(json[_complement]) ?? '',
        district = castOrNull(json[_district]) ?? '',
        zip = castOrNull(json[_zip]) ?? '',
        city = castOrNull(json[_city]) ?? '',
        state = castOrNull(json[_state]) ?? '',
        addressCountry = castOrNull(json[_addressCountry]) ?? '',
        faceRecognitionEnabled =
            castOrNull(json[_faceRecognitionEnabled]) ?? false,
        plannerId = castOrNull(json[_plannerId]),
        plannerName = castOrNull(json[_plannerName]),
        plannerEmail = castOrNull(json[_plannerEmail]),
        plannerPhone = castOrNull(json[_plannerPhone]),
        plannerLogo = castOrNull(json[_plannerLogo]),
        plannerLink = castOrNull(json[_plannerLink]),
        plannerFormalName = castOrNull(json[_plannerFormalName]),
        plannerCityNumber = castOrNull(json[_plannerCityNumber]),
        plannerCpf = castOrNull(json[_plannerCpf]),
        plannerCnpj = castOrNull(json[_plannerCnpj]),
        plannerPictures = castOrNull(json[_plannerPictures]),
        plannerObservation = castOrNull(json[_plannerObservation]);

  Map<String, dynamic> toJson() => {
        _userId: userId,
        _name: name,
        _email: email,
        _picture: picture,
        _userToken: userToken,
        _facebookId: facebookId,
        _nationality: nationality,
        _document: document,
        _documentType: documentType,
        _documentTypeId: documentTypeId,
        _phone: phone,
        // _ddi: ddi,
        _birthdate: birthdate,
        _gender: gender,
        _verified: verified,
        _type: type,
        _street: street,
        _number: number,
        _complement: complement,
        _district: district,
        _zip: zip,
        _city: city,
        _state: state,
        _addressCountry: addressCountry,
        _faceRecognitionEnabled: faceRecognitionEnabled,
        _plannerId: plannerId,
        _plannerName: plannerName,
        _plannerEmail: plannerEmail,
        _plannerPhone: plannerPhone,
        _plannerLogo: plannerLogo,
        _plannerLink: plannerLink,
        _plannerFormalName: plannerFormalName,
        _plannerCityNumber: plannerCityNumber,
        _plannerCpf: plannerCpf,
        _plannerCnpj: plannerCnpj,
        _plannerPictures: plannerPictures,
        _plannerObservation: plannerObservation,
      };

  @override
  List<Object?> get props => [
        userId,
        name,
        email,
        picture,
        userToken,
        facebookId,
        nationality,
        document,
        documentType,
        documentTypeId,
        phone,
        // ddi,
        birthdate,
        gender,
        verified,
        type,
        street,
        number,
        complement,
        district,
        zip,
        city,
        state,
        addressCountry,
        faceRecognitionEnabled,
        plannerId,
        plannerName,
        plannerEmail,
        plannerPhone,
        plannerLogo,
        plannerLink,
        plannerFormalName,
        plannerCityNumber,
        plannerCpf,
        plannerCnpj,
        plannerPictures,
        plannerObservation,
      ];
}
