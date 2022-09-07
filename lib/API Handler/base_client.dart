import 'package:api_exception_handler/API%20Handler/process_response.dart';
import 'package:http/http.dart' as http;

import 'exception_handlers.dart';

class BaseClient {
  static const int timeOutDuration = 35;

  /// Get
  Future<dynamic> get(String url, Map<String, String> paramDic, String bearerToken) async {
    var uri = Uri.parse(url);
    try {
      var response = await http.get(uri, headers: {"Accept": "application/json","Authorization": "Bearer $bearerToken"}).timeout(const Duration(seconds: timeOutDuration));
      return processResponse(response);
    } catch (e) {
      throw ExceptionHandlers().getExceptionString(e);
    }
  }

  /// Post
  Future<dynamic> post(String url, Map<String, String> paramDic, String bearerToken) async {
    var uri = Uri.parse(url);
    try {
      var response = await http.post(uri, body: paramDic, headers: {"Authorization": "Bearer $bearerToken"}).timeout(const Duration(seconds: timeOutDuration));
      return processResponse(response);
    } catch (e) {
      throw ExceptionHandlers().getExceptionString(e);
    }
  }

  /// Put
  Future<dynamic> put(String url, Map<String, String> paramDic, String bearerToken) async {
    var uri = Uri.parse(url);
    try {
      var response = await http.put(uri, headers: {"Authorization": "Bearer $bearerToken"}).timeout(const Duration(seconds: timeOutDuration));
      return processResponse(response);
    } catch (e) {
      throw ExceptionHandlers().getExceptionString(e);
    }
  }

  /// Delete
  Future<dynamic> delete(String url, Map<String, String> paramDic, String bearerToken) async {
    var uri = Uri.parse(url);
    try {
      var response = await http.delete(uri, headers: {"Authorization": "Bearer $bearerToken"}).timeout(const Duration(seconds: timeOutDuration));
      return processResponse(response);
    } catch (e) {
      throw ExceptionHandlers().getExceptionString(e);
    }
  }

}