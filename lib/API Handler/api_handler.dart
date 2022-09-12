/// API Exception Handler is an advance error handler for http request.

import 'package:api_exception_handler/API%20Handler/process_response.dart';
import 'package:http/http.dart' as http;

import 'exception_handlers.dart';

///
/// Sometimes the user may enter an incorrect input,
/// a network request may fail,
/// or we could have made a programmer mistake somewhere,
/// and our app will crash.
///
/// Exception handling is a way of
/// dealing with these potential errors in our
/// code so our app can gracefully recover from them.

class ApiHandler {
  /// Time out duration in seconds
  /// This will short-circuit after the given duration
  /// has elapsed by throwing a TimeoutException.
  static const int timeOutDuration = 35;

  /// GET Method
  /// A GET request is used to extract useful data
  /// from your backend to use it in your application
  ///
  /// A successful GET request would be a 200 response code and
  /// returns a response containing the information you requested.
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

  /// POST Method
  ///
  /// We use POST to create a new resource.
  /// A POST request requires a body in which you define
  /// the data of the entity to be created.
  ///
  /// A successful POST request would be a 200 response code.
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

  /// PUT Method
  ///
  /// PUT is used to send data to a server to create/update a resource.
  ///
  /// The difference between POST and PUT is that PUT requests are idempotent.
  /// That is, calling the same PUT request multiple times
  /// will always produce the same result.
  /// In contrast, calling a POST request repeatedly have
  /// side effects of creating the same resource multiple times.
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

  /// DELETE Method
  ///
  /// The DELETE method deletes the specified resource.
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
