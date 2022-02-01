import 'package:async/async.dart';

import 'package:auth/src/constants/token.dart';

/// Base class for our SignUpService Implementation.
// ignore: one_member_abstracts
abstract class ISignUpService {
  /// SignUp method to add users to our app.
  Future<Result<Token>> signUp(
    String email,
    String name,
    String password,
  );
}
