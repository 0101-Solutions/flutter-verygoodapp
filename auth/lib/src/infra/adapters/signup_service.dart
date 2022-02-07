import 'package:async/async.dart';
import 'package:auth/auth.dart';
import 'package:auth/src/constants/credential.dart';
import 'package:auth/src/infra/api/auth_api_contract.dart';

/// This is class that handles sign users up
/// where the authentication type is
/// ```dart
/// AuthType.email
/// ```
/// Methods:
/// ```dart
/// // Sign Up method that takes: email, name & password.
/// Future<Result<Token>> signUp(String email, String name, String password);
///
/// ```
class SignUpService implements ISignUpService {
  /// Injected the constructor class the AuthApi abstraction.
  SignUpService(this._api);

  final IAuthApi _api;

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
