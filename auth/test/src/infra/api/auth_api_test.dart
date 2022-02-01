import 'dart:convert';

import 'package:async/async.dart';

import 'package:auth/src/constants/credential.dart';
import 'package:auth/src/infra/api/auth_api.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/mockito.dart';

class MockClient extends Mock implements http.Client {}

void main() {
  late final MockClient client;
  late final AuthApi sut;

  setUp(() {
    client = MockClient();
    sut = AuthApi('http:baseUrl', client);
  });

  group('Sign In', () {
    const credential = Credential(
      type: AuthType.email,
      email: 'email@email',
      password: 'pass',
    );

    final url = Uri.parse('any');

    test('should return error when status code is not 200', () async {
      //arrange
      when(
        client.post(
          url,
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

    // test('should return error when status code is 200 but malformed json',
    //     () async {
    //   //arrange
    //   when(client.post(any,
    //           body: anyNamed('body'), headers: anyNamed('headers')))
    //       .thenAnswer((_) async => http.Response('{}', 200));
    //   //act
    //   var result = await sut.signIn(credential);
    //   //assert
    //   expect(result, isA<ErrorResult>());
    // });

    // test('should return token string when successful', () async {
    //   //arrange
    //   var tokenStr = 'Abbggs..';
    //   when(client.post(any,
    //           body: anyNamed('body'), headers: anyNamed('headers')))
    //       .thenAnswer((_) async =>
    //           http.Response(jsonEncode({'auth_token': tokenStr}), 200));
    //   //act
    //   var result = await sut.signIn(credential);
    //   //assert
    //   expect(result.asValue.value, tokenStr);
    // });
  });
}
