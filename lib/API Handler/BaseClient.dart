import 'dart:convert';

import 'package:http/http.dart' as http;

import 'ExceptionClasses.dart';
import 'ExceptionHandlers.dart';


class BaseClient {
  static const int timeOutDuration = 35;

  ///Get
  Future<dynamic> get(String url) async {
    var uri = Uri.parse(url);
    try {
      var response = await http.get(uri).timeout(const Duration(seconds: timeOutDuration));
      return _processResponse(response);
    } catch (e) {
      throw ExceptionHandlers().getExceptionString(e);
    }
  }

}


/// ----- api_bloc Error Status Codes ----- ///

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