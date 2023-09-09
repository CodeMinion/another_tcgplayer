
import 'dart:convert';

import 'package:another_tcgplayer/auth/auth_dto.dart';
import 'package:another_tcgplayer/error_models.dart';
import 'package:http/http.dart' as http;


class AuthService {

  final String baseUrl;
  final bool secure;

  AuthService({required this.baseUrl, required this.secure});

  ///
  /// Retrieves the access token for the calling account.
  ///
  Future<AccessToken> authorize({required String publicKey, required String privateKey}) async {
    Map<String, String> headers = {
      //"Authorization": "Bearer $apiKey",
      "Content-Type": "application/x-www-form-urlencoded",
      "Access-Control-Allow-Origin": "*", // Required for CORS support to work
    };

    Uri endpoint;
    if(secure) {
      endpoint = Uri.https(
          baseUrl, "/token");
    }
    else {
      endpoint = Uri.http(
          baseUrl, "/token");
    }

    var data = { 'grant_type' : 'client_credentials', 'client_id' : publicKey, 'client_secret': privateKey };
    var response = await http.post(endpoint, headers: headers, body:data);

    if (response.statusCode == 200 || response.statusCode == 201) {

      var token = AccessToken.fromJson(jsonDecode(const Utf8Decoder().convert(response.bodyBytes)));
      token.calculateExpiration();
      return token;
    }
    else {
      var error = ServerError.fromJson(jsonDecode(response.body));
      throw AuthException(statusCode: response.statusCode, message: "${error.error} - ${error.errorDescription}");
    }

  }
}

///
/// Exception related to the Auth Service
///
class AuthException implements Exception {
  final String? message;
  final int statusCode;

  AuthException({required this.statusCode, this.message});

  @override
  String toString() {
    return "AuthException: $statusCode - $message";
  }
}