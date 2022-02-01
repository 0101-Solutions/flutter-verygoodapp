import 'package:async/async.dart';
import 'package:auth/src/constants/token.dart';

import 'package:auth/src/domain/auth_service_contract.dart';

/// Usecases where users will be signing in to our app.
class SignInUseCase {
  /// Injected to the constructor our class, and passed our _authservice.
  const SignInUseCase(this._authService);

  final IAuthService _authService;

  /// Here we pass our _authService to execute user signIn()
  Future<Result<Token>> execute() async {
    return _authService.signIn();
  }
}
