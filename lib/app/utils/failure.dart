import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  final String? message;
  final int? code;

  const Failure(this.message, this.code);

  @override
  List<Object?> get props => [message, code];
}

class ServerFailure extends Failure {
  final String? errorString;

  const ServerFailure(
    this.errorString,
    int? code,
  ) : super('${"erro"} (A_$code)', code);

  @override
  List<Object?> get props => [
        message,
        code,
      ];
}

class DatabaseFailure extends Failure {
  const DatabaseFailure([int? code = 1])
      : super('${"DataBaseError"} (D_$code)', code);

  @override
  List<Object?> get props => [
        message,
        code,
      ];
}

class NullResponseFailure extends Failure {
  const NullResponseFailure() : super('', null);
}

class NoConnectionFailure extends Failure {
  const NoConnectionFailure() : super("NoConnectionError", null);

  @override
  List<Object?> get props => [message];
}


class RequiredTOTPCode extends Failure {
  const RequiredTOTPCode() : super('', 2057);

  @override
  List<Object?> get props => [message];
}

class OndeHjFailure extends Failure {
  final String? title;

  const OndeHjFailure(
    this.title,
    super.message,
    super.code,
  );

  @override
  List<Object?> get props => [
        title,
        message,
        code,
      ];
}
