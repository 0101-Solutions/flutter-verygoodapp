import 'package:async/async.dart';
import 'package:auth/src/constants/credential.dart';

import 'package:auth/src/constants/token.dart';
import 'package:auth/src/domain/auth_service_contract.dart';
import 'package:auth/src/infra/api/auth_api_contract.dart';
import 'package:google_sign_in/google_sign_in.dart';

/// GoogleAuth Class to help with authenticating users into our app using
/// Google Sign In.
class GoogleAuth implements IAuthService {
  /// Inject GoogleSignIn instance by default in the constructor.
  /// This is done for testing purposes we can inject a MockGoogleSignIn.
  GoogleAuth(this._authApi, [GoogleSignIn? googleSignIn])
      : _googleSignIn = googleSignIn ??
            GoogleSignIn(
              scopes: ['email', 'profile'],
            );

  final IAuthApi _authApi;
  final GoogleSignIn _googleSignIn;
  late GoogleSignInAccount _currentUser;

  @override
  Future<Result<Token>> signIn() async {
    await _handleGoogleSignIn();

    final credential = Credential(
      type: AuthType.google,
      email: _currentUser.email,
      name: _currentUser.displayName,
    );

    final result = await _authApi.signIn(credential);

    if (result.isError) {
      return Result.value(Token(result.asError.toString()));
    }

    return Result.value(Token(result.asValue!.value));
  }

  @override
  Future<Result<bool>> signOut(Token token) async {
    final result = await _authApi.signOut(token);

    if (result.asValue!.value) await _googleSignIn.disconnect();

    return result;
  }

  Future _handleGoogleSignIn() async {
    try {
      _currentUser = (await _googleSignIn.signIn())!;
    } catch (e) {
      return;
    }
  }
}
