import 'package:auth/auth.dart';
import 'package:auth/src/infra/adapters/email_auth.dart';
import 'package:auth/src/infra/adapters/google_auth.dart';
import 'package:auth/src/infra/api/auth_api_contract.dart';

/// This is used to simplify the creation of a service that we require,
/// similar to a factory method.
class AuthManager {
  /// Inject the IAuthApi service to the constructor.
  AuthManager(IAuthApi api) {
    _api = api;
  }

  late IAuthApi _api;

  /// A getter method for getting the GoogleAuth service
  /// and we inject the _api instance.
  IAuthService get google => GoogleAuth(_api);

  /// The EmailAuth Service that takes an email and a password
  /// to authenticate the user.
  IAuthService email({
    required String email,
    required String password,
  }) {
    final emailAuth = EmailAuth(_api)

      /// Its called cascade invocations.
      ..credential(
        email: email,
        password: password,
      );

    return emailAuth;
  }
}
