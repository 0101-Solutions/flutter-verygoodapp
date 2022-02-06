import 'package:async/async.dart';
import 'package:auth/src/constants/token.dart';
import 'package:auth/src/domain/auth_service_contract.dart';

/// SignInUsecase where users will pass the
/// token stored when signing in to our app, and successfully Sign Out.
class SignOutUseCase {
  /// Injected _authservice to the constructor in our class.
  const SignOutUseCase(this._authService);

  final IAuthService _authService;

  /// Here we create a Future execute() that implements our
  /// `_authService` to execute user signOut() which takes a token
  Future<Result<bool>> execute(Token token) async {
    return _authService.signOut(token);
  }
}
