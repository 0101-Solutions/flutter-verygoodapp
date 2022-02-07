import 'package:async/async.dart';

import 'package:auth/src/constants/credential.dart';
import 'package:auth/src/constants/token.dart';
import 'package:auth/src/domain/auth_service_contract.dart';
import 'package:auth/src/infra/api/auth_api_contract.dart';

/// This is class that handles authentication where the authentication type
/// is `email`.
/// ```dart
/// AuthType.email
/// ```
/// Methods include:
/// ```dart
/// // Sign In method
/// Future<Result<Token>> signIn();
/// // Sign Out removes token from local storage.
/// Future<void> signOut();
///
/// ```
class EmailAuth implements IAuthService {
  /// Injected the constructor class the AuthApi abstraction.
  EmailAuth(this._api);

  final IAuthApi _api;
  late Credential _credential;

  /// Created a function to ensure our credential created is passed.
  void credential({
    required String email,
    required String password,
  }) {
    _credential = Credential(
      type: AuthType.email,
      email: email,
      password: password,
    );
  }

  @override
  Future<Result<Token>> signIn() async {
    final result = await _api.signIn(_credential);

    if (result.isError) {
      return Result.value(Token(result.asError.toString()));
    }

    return Result.value(Token(result.asValue!.value));
  }

  @override
  Future<Result<bool>> signOut(Token token) async {
    return _api.signOut(token);
  }
}
