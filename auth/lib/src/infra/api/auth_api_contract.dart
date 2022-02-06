import 'package:async/async.dart';
import 'package:auth/src/constants/credential.dart';
import 'package:auth/src/constants/token.dart';

/// Base class containing the methods needed to interact with our external API:
/// - signIn() to login existing users to the app.
/// - signUp() to signUp/onboard users on to the app.
///
/// ```dart
///
/// Future<Result<String>> signIn(Credential credential);
///
/// Future<Result<String>> signUp(Credential credential);
///
/// ```
///
abstract class IAuthApi {
  /// signIn method call to the external API - takes the user `Credential` and
  /// returns a JWT `Token` Object.
  Future<Result<String>> signIn(Credential credential);

  /// signUp method call to the external API - takes the user `Credential` and
  /// returns a JWT `Token` Object.
  Future<Result<String>> signUp(Credential credential);

  /// signOut method call to the external API - takes the stored `Token` and
  /// checks whether its valid or not to log the user out.
  Future<Result<bool>> signOut(Token token);
}
