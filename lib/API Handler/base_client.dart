import 'dart:convert';

import 'package:http/http.dart' as http;

import 'exception_classes.dart';
import 'exception_handlers.dart';


class BaseClient {
  static const int timeOutDuration = 35;

  /// Get
  Future<dynamic> get(String url, Map<String, String> paramDic, String bearerToken) async {
    var uri = Uri.parse(url);
    try {
      var response = await http.get(uri, headers: {"Accept": "application/json","Authorization": "Bearer $bearerToken"}).timeout(const Duration(seconds: timeOutDuration));
      return _processResponse(response);
    } catch (e) {
      throw ExceptionHandlers().getExceptionString(e);
    }
  }

  /// Post
  Future<dynamic> post(String url, Map<String, String> paramDic, String bearerToken) async {
    var uri = Uri.parse(url);
    try {
      var response = await http.post(uri, body: paramDic,headers: {"Authorization": "Bearer $bearerToken"}).timeout(const Duration(seconds: timeOutDuration));
      return _processResponse(response);
    } catch (e) {
      throw ExceptionHandlers().getExceptionString(e);
    }
  }

  /// Put
  Future<dynamic> put(String url, Map<String, String> paramDic, String bearerToken) async {
    var uri = Uri.parse(url);
    try {
      var response = await http.put(uri,headers: {"Authorization": "Bearer $bearerToken"}).timeout(const Duration(seconds: timeOutDuration));
      return _processResponse(response);
    } catch (e) {
      throw ExceptionHandlers().getExceptionString(e);
    }
  }

  /// Delete
  Future<dynamic> delete(String url, Map<String, String> paramDic, String bearerToken) async {
    var uri = Uri.parse(url);
    try {
      var response = await http.delete(uri,headers: {"Authorization": "Bearer $bearerToken"}).timeout(const Duration(seconds: timeOutDuration));
      return _processResponse(response);
    } catch (e) {
      throw ExceptionHandlers().getExceptionString(e);
    }
  }

}


/// ----- api Error Status Codes ----- ///

dynamic _processResponse(http.Response response) {
  switch (response.statusCode) {
    case 200:
      var responseJson = response.body;
      return responseJson;
    case 400: /// Bad Request
      throw BadRequestException(jsonDecode(response.body)['message']);
    case 401: /// Unauthorized
      throw UnAuthorizedException(jsonDecode(response.body)['message']);
    case 403: /// Forbidden
      throw UnAuthorizedException(jsonDecode(response.body)['message']);
    case 404: /// Resource not found
      throw NotFoundException(jsonDecode(response.body)['message']);
    case 405: /// Method not allowed
      throw MethodNotAllowedException(jsonDecode(response.body)['message']);
    case 500: /// Internal Server Error
      throw InternalServerException(jsonDecode(response.body)['message']);
    default:
      throw FetchDataException('Something went wrong! ${response.statusCode}');
  }
}