import 'package:auth/src/constants/credential.dart';
import 'package:auth/src/constants/token.dart';
import 'package:auth/src/infra/api/auth_api.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/annotations.dart';

@GenerateMocks([http.Client])
void main() {
  group('Sign In', () {
    final client = http.Client();
    const baseUrl = 'http://localhost:3000';

    final sut = AuthApi(baseUrl, client);

    const credential = Credential(
      type: AuthType.email,
      email: 'leanne@email.com',
      password: 'password',
    );

    test('Should return a JWT from the server', () async {
      final result = await sut.signIn(credential);

      expect(result.asValue!.value, isNotEmpty);
    });
  });

  group('Sign Up', () {
    final client = http.Client();
    const baseUrl = 'http://localhost:3000';

    final sut = AuthApi(baseUrl, client);

    const credential = Credential(
      type: AuthType.email,
      email: 'email@email.com',
      name: 'Username',
      password: 'password',
    );

    test('Should return a JWT from the server', () async {
      final result = await sut.signUp(credential);

      expect(result.asValue!.value, isNotEmpty);
    });
  });

  group('Sign Out', () {
    test('should sign out user and return true', () async {
      // arrange

      final client = http.Client();
      const baseUrl = 'http://localhost:3000';

      final sut = AuthApi(baseUrl, client);

      const credential = Credential(
        type: AuthType.email,
        email: 'leanne@email.com',
        password: 'password',
      );

      final tokenStr = await sut.signIn(credential);
      final token = Token(tokenStr.asValue!.value);

      // act
      final result = await sut.signOut(token);

      // assert
      expect(result.asValue!.value, isTrue);
    });
  });
}
