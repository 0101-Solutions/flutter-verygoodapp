import 'package:auth/src/constants/credential.dart';

/// A class with static methods that returns JSON format
/// from properties passed, here being credential metadata.
class Mapper {
  /// This staic method converts the Credential model to JSON,
  /// before it is sent to the server.
  static Map<String, dynamic> toJson(Credential credential) =>
      <String, dynamic>{
        'type': credential.type,
        'email': credential.email,
        'name': credential.name,
        'password': credential.password,
      };
}
