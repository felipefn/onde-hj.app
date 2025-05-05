// coverage:ignore-file





import '../../../../utils/failure.dart';

class EmailLoginError extends Failure {
  const EmailLoginError()
      : super("EmailLoginError", 0);

  @override
  List<Object?> get props => [message];
}

class RequestRenewPasswordError extends Failure {
  const RequestRenewPasswordError()
      : super("RequestRenewPasswordError", 0);

  @override
  List<Object?> get props => [message];
}

class DeleteAccountAuthenticationError extends Failure {
  const DeleteAccountAuthenticationError()
      : super(
            "DeleteAccountAuthenticationError",
            0);

  @override
  List<Object?> get props => [message];
}
