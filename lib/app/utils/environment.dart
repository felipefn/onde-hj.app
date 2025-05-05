import 'package:equatable/equatable.dart';

enum EnvironmentType {
  prod,
  hml,
  custom;

  static EnvironmentType getTypeByName(String name) =>
      EnvironmentType.values.firstWhere(
        (element) => element.name == name,
        orElse: () => EnvironmentType.custom,
      );
}

class Environment extends Equatable {
  final String name;
  final String apiPrefix;
  final String? prefix;
  final String apiKey;
  final EnvironmentType type;

  static const _name = 'name';
  static const _apiKey = 'apiKey';
  static const _apiPrefix = 'apiPrefix';
  static const _prefix = 'prefix';
  static const _type = 'type';

  const Environment({
    required this.name,
    required this.apiPrefix,
    this.prefix,
    required this.apiKey,
    required this.type,
  });

  Environment.fromJson(Map<String, dynamic> json)
      : name = json[_name],
        apiKey = json[_apiKey],
        apiPrefix = json[_apiPrefix],
        prefix = json[_prefix],
        type = EnvironmentType.getTypeByName(json[_type]);

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = {};
    json[_name] = name;
    json[_apiKey] = apiKey;
    json[_apiPrefix] = apiPrefix;
    json[_prefix] = prefix;
    json[_type] = type.name;

    return json;
  }

  @override
  List<Object?> get props => [
        name,
        apiPrefix,
        prefix,
        apiKey,
        type,
      ];
}
