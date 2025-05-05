import 'package:flutter_triple/flutter_triple.dart';

import '../../domain/entities/failures.dart';
import 'auth_store.dart';

class ForgotPasswordPageStore extends Store<bool> {
  final AuthStore _authStore;

  ForgotPasswordPageStore(
    this._authStore,
  ) : super(
          false,
        );

  renewPassword(String email) async {
    await _authStore.renewPassword(
      email,
      onError: (error) => setError(error, force: true),
      onSuccess: (success) {
        if (!success) {
          setError(const RequestRenewPasswordError(), force: true);
          return;
        }

        update(success);
      },
    );
  }
}
