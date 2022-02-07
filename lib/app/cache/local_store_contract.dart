import 'package:auth/auth.dart';

/// LocalStore abstraction that has `Future<Token> fetch()`
/// and `delete(TOken token)`.
abstract class ILocalStore {
  Future<Token> fetch();

  /// Delete Token from shared_preferences
  void delete(Token token);
}
