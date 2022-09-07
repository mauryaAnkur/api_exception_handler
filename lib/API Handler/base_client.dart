/// API Exception Handler is an advance error handler for http request.

import 'package:api_exception_handler/API%20Handler/process_response.dart';
import 'package:http/http.dart' as http;

import 'exception_handlers.dart';

class BaseClient {
  static const int timeOutDuration = 35;

  /// Get
  Future<dynamic> get(
      {required String url,
      Map<String, String>? queryParameters,
      String? bearerToken}) async {
    var uri = Uri.parse(url);
    final finalUri = uri.replace(queryParameters: queryParameters);
    try {
      var response = await http.get(finalUri, headers: {
        "Accept": "application/json",
        "Authorization": "Bearer $bearerToken"
      }).timeout(const Duration(seconds: timeOutDuration));
      return processResponse(response);
    } catch (e) {
      throw ExceptionHandlers().getExceptionString(e);
    }
  }

  /// Post
  Future<dynamic> post(
      {required String url,
      Map<String, String>? queryParameters,
      String? bearerToken}) async {
    var uri = Uri.parse(url);
    try {
      var response = await http.post(uri, body: queryParameters, headers: {
        "Authorization": "Bearer $bearerToken"
      }).timeout(const Duration(seconds: timeOutDuration));
      return processResponse(response);
    } catch (e) {
      throw ExceptionHandlers().getExceptionString(e);
    }
  }

  /// Put
  Future<dynamic> put(
      {required String url,
      Map<String, String>? queryParameters,
      String? bearerToken}) async {
    var uri = Uri.parse(url);
    final finalUri = uri.replace(queryParameters: queryParameters);
    try {
      var response = await http.put(finalUri, headers: {
        "Authorization": "Bearer $bearerToken"
      }).timeout(const Duration(seconds: timeOutDuration));
      return processResponse(response);
    } catch (e) {
      throw ExceptionHandlers().getExceptionString(e);
    }
  }

  /// Delete
  Future<dynamic> delete(
      {required String url,
      Map<String, String>? queryParameters,
      String? bearerToken}) async {
    var uri = Uri.parse(url);
    final finalUri = uri.replace(queryParameters: queryParameters);
    try {
      var response = await http.delete(finalUri, headers: {
        "Authorization": "Bearer $bearerToken"
      }).timeout(const Duration(seconds: timeOutDuration));
      return processResponse(response);
    } catch (e) {
      throw ExceptionHandlers().getExceptionString(e);
    }
  }
}
