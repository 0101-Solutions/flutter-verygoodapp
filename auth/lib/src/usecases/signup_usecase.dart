import 'package:async/async.dart';

import 'package:auth/src/constants/token.dart';
import 'package:auth/src/domain/signup_service_contract.dart';

/// Usecases where users will be signed up/added to our app.
class SignUpUseCase {
  /// Injected to the constructor our class, and passed our _authservice.
  const SignUpUseCase(this._signUpService);

  final ISignUpService _signUpService;

  /// Here we pass our _authService to execute user signUp().
  /// The method takes:
  /// @Token email,
  /// @Token name,
  /// @Token password
  Future<Result<Token>> execute(
    String email,
    String name,
    String password,
  ) async {
    return _signUpService.signUp(
      email.toUpperCase(),
      name,
      password,
    );
  }
}
