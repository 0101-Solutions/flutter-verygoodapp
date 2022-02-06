// ignore_for_file: avoid_dynamic_calls
import 'dart:convert';

import 'package:async/async.dart';
import 'package:auth/src/constants/credential.dart';
import 'package:auth/src/infra/api/auth_api_contract.dart';
import 'package:auth/src/infra/api/helpers/mapper.dart';

import 'package:http/http.dart' as http;

/// This class is responsible for interacting with the API and call the
/// methods defined in the `IAuthAPI` contract/abstract class.
class AuthApi implements IAuthApi {
  /// Injected the http.Client instance into our AuthAPI constructor.
  AuthApi(this.baseUrl, this._client);

  final http.Client _client;

  /// The baseUrl where our endpoints should call.
  String baseUrl;

  @override
  Future<Result<String>> signIn(Credential credential) async {
    final endpoint = Uri.parse('$baseUrl/auth/signin');
    return _postCredential(endpoint, credential);
  }

  @override
  Future<Result<String>> signUp(Credential credential) async {
    final endpoint = Uri.parse('$baseUrl/auth/signup');
    return _postCredential(endpoint, credential);
  }

  /// A ` Future<Result<String>> ` that sends the Credential
  /// to the API endpoint
  /// and awaits a response.
  /// If response is not statusCode 200 then its an error.
  Future<Result<String>> _postCredential(
    Uri endpoint,
    Credential credential,
  ) async {
    final response = await _client.post(
      endpoint,
      headers: {'Content-type': 'application/json'},
      body: Mapper.toJson(credential),
    );

    if (response.statusCode != 200) {
      return Result.error('Server error. Try Again.');
    }

    final dynamic json = jsonDecode(response.body);

    return json['auth_token'] != null
        ? Result.value(json['auth_token'] as String)
        : Result.error(['message']);
  }
}
