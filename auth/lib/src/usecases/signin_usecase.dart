import 'package:async/async.dart';
import 'package:auth/src/constants/token.dart';

import 'package:auth/src/domain/auth_service_contract.dart';

/// SignInUsecase where users will be signing in to our app.
class SignInUseCase {
  /// Injected _authservice to the constructor in our class.
  const SignInUseCase(this._authService);

  final IAuthService _authService;

  /// Here we create Future execute(), which executes the signIn()
  /// on `_authService` and returns a `Future<Result<Token>>`.
  Future<Result<Token>> execute() async {
    return _authService.signIn();
  }
}
