/// JWT Class returned by the API to authenticate users.
///
/// ```dart
/// const Credential({
///   required this.type,
///   required this.email,
///   this.name,
///   this.password,
/// });
///
/// ```
///
class Credential {
  /// Injected to the constructor our values in the token class.
  const Credential({
    required this.type,
    required this.email,
    this.name,
    this.password,
  });

  /// @required - The type of authentication the user is accessing our app with.
  final AuthType type;

  /// @required - A user's email address.
  final String email;

  /// A user name.
  final String? name;

  /// A user's password.
  final String? password;
}

/// Users can be authenticated into our app using either:
///
/// ```dart
/// enum AuthType {
///   // Email to use the normal email sign in.
///   email,
///
///  // Google to sign in/up with Google.
///  google,
/// }
///
/// ```
///
enum AuthType {
  /// Email to use the normal email sign in.
  email,

  /// Google to sign in/up with Google.
  google,
}
