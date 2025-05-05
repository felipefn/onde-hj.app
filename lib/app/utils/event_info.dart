import 'package:equatable/equatable.dart';

class EventInfo extends Equatable {
  final String name;
  final dynamic data;

  const EventInfo({required this.name, this.data});

  @override
  List<Object?> get props => [
        name,
        data,
      ];
}
