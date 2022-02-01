import 'package:async/async.dart';

import 'package:auth/src/constants/credential.dart';
import 'package:auth/src/constants/token.dart';
import 'package:auth/src/domain/auth_service_contract.dart';
import 'package:auth/src/domain/signup_service_contract.dart';
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
///
/// // Sign Up method that takes: email, name & password.
/// Future<Result<Token>> signUp(String email, String name, String password);
///
/// // Sign Out removes token from local storage.
/// Future<void> signOut();
///
/// ```
class EmailAuth implements IAuthService, ISignUpService {
  /// Injected to the constructor EmailAuth class, by passing the AuthApi.
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
  Future<void> signOut() async {
    return await null;
  }

  @override
  Future<Result<Token>> signUp(
    String email,
    String name,
    String password,
  ) async {
    final credential = Credential(
      type: AuthType.email,
      email: email,
      name: name,
      password: password,
    );

    final result = await _api.signUp(credential);

    if (result.isError) {
      return Result.value(Token(result.asError.toString()));
    }

    return Result.value(Token(result.asValue!.value));
  }
}
