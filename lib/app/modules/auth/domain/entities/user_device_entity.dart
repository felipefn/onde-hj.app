// import 'dart:convert';

// import 'package:ingresse_clean_arch_sdk/utils.dart';
// import 'package:ingresse_tools_sdk/ingresse_tools_sdk.dart';

// class UserDeviceEntity extends Equatable {
//   final String identifier;
//   final String appName;
//   final String model;
//   final String brand;
//   final DateTime creationDate;

//   static const String _identifier = 'id';
//   static const String _appName = 'name';
//   static const String _model = 'model';
//   static const String _brand = 'brand';
//   static const String _creationDate = 'creationdate';
//   static const String _type = 'device_type';
//   static const String _mobile = 'mobile';

//   const UserDeviceEntity({
//     required this.identifier,
//     required this.appName,
//     required this.model,
//     required this.brand,
//     required this.creationDate,
//   });

//   Map<String, String> toJson(DateFormat dateformat) {
//     Map<String, String> json = {};
//     json[_identifier] = identifier;
//     json[_appName] = appName;
//     json[_model] = model;
//     json[_brand] = brand;
//     json[_creationDate] = dateformat.format(creationDate);

//     return json;
//   }

//   @override
//   String toString() {
//     final dateformat = DateFormat(DateFormats.dateTimeWithSeconds());
//     return jsonEncode(toJson(dateformat));
//   }

//   String toSDK() {
//     final dict = {
//       _identifier: identifier,
//       _appName: '$brand $model',
//       _type: _mobile,
//     };

//     return jsonEncode(dict);
//   }

//   @override
//   List<Object?> get props => [
//         identifier,
//         appName,
//         model,
//         brand,
//         creationDate,
//       ];
// }
