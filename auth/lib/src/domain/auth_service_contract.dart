import 'package:async/async.dart';

import 'package:auth/src/constants/token.dart';

/// Our base class for the authentication service.
abstract class IAuthService {
  /// The signIn() method that will sign users in with either email or google.
  Future<Result<Token>> signIn();

  /// The signOut() method, that signs users out of the app.
  Future<Result<bool>> signOut(Token token);
}
