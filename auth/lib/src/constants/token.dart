/// JWT Class returned by the API to authenticate users.
class Token {
  /// Injected to the constructor our values in the token class.
  const Token(this.value);

  /// The RefreshToken value returned by the API.
  final String value;
}
