import 'package:async/async.dart';
import 'package:auth/src/constants/credential.dart';

/// Base class containing the methods needed to interact with our external API:
/// - signIn method call to login existing users to the app.
/// - signUp method call to signUp/onboard users on to the app.
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
  /// signIn method call to the external API - takes the user `Credential`.
  Future<Result<String>> signIn(Credential credential);

  /// signUp method call to the external API - takes the user `Credential`.
  Future<Result<String>> signUp(Credential credential);
}
