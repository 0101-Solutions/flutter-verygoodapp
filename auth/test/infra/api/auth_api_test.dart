import 'dart:convert';

import 'package:async/async.dart';

import 'package:auth/src/constants/credential.dart';
import 'package:auth/src/infra/api/auth_api.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'auth_api_test.mocks.dart';

@GenerateMocks([http.Client])
void main() {
  group('Sign Up', () {
    const credential = Credential(
      type: AuthType.email,
      email: 'email@email',
      name: 'Username',
      password: 'password',
    );

    final client = MockClient();
    final sut = AuthApi('http:baseUrl', client);

    test('should return error when status code is not 200', () async {
      //arrange
      when(
        client.post(
          any,
          body: anyNamed('body'),
          headers: anyNamed('headers'),
        ),
      ).thenAnswer(
        (_) async => http.Response(jsonEncode({'error': 'not found'}), 404),
      );
      //act
      final result = await sut.signUp(credential);
      //assert
      expect(result, isA<ErrorResult>());
    });

    test('should return error when status code is 200 but malformed json',
        () async {
      //arrange
      when(
        client.post(
          any,
          body: anyNamed('body'),
          headers: anyNamed('headers'),
        ),
      ).thenAnswer((_) async => http.Response('{}', 200));
      //act
      final result = await sut.signUp(credential);
      //assert
      expect(result, isA<ErrorResult>());
    });

    test('should return token string when successful', () async {
      // arrange
      const tokenStr = 'Abbggs..';

      when(
        client.post(
          any,
          body: anyNamed('body'),
          headers: anyNamed('headers'),
        ),
      ).thenAnswer(
        (_) async => http.Response(jsonEncode({'auth_token': tokenStr}), 200),
      );
      // act
      final result = await sut.signUp(credential);
      // assert
      expect(result.asValue!.value, tokenStr);
    });
  });

  group('Sign In', () {
    const credential = Credential(
      type: AuthType.email,
      email: 'email@email',
      password: 'pass',
    );

    final client = MockClient();
    final sut = AuthApi('http:baseUrl', client);

    test('should return error when status code is not 200', () async {
      //arrange
      when(
        client.post(
          any,
          body: anyNamed('body'),
          headers: anyNamed('headers'),
        ),
      ).thenAnswer(
        (_) async => http.Response(jsonEncode({'error': 'not found'}), 404),
      );
      //act
      final result = await sut.signIn(credential);
      //assert
      expect(result, isA<ErrorResult>());
    });

    test('should return error when status code is 200 but malformed json',
        () async {
      //arrange
      when(
        client.post(
          any,
          body: anyNamed('body'),
          headers: anyNamed('headers'),
        ),
      ).thenAnswer((_) async => http.Response('{}', 200));
      //act
      final result = await sut.signIn(credential);
      //assert
      expect(result, isA<ErrorResult>());
    });

    test('should return token string when successful', () async {
      // arrange
      const tokenStr = 'Abbggs..';

      when(
        client.post(
          any,
          body: anyNamed('body'),
          headers: anyNamed('headers'),
        ),
      ).thenAnswer(
        (_) async => http.Response(jsonEncode({'auth_token': tokenStr}), 200),
      );
      // act
      final result = await sut.signIn(credential);
      // assert
      expect(result.asValue!.value, tokenStr);
    });
  });
}
