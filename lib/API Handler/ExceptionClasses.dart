

class AppException implements Exception {
  final String? message;
  final String? prefix;
  final String? url;

  AppException([this.message, this.prefix, this.url]);
}

class BadRequestException extends AppException {
  BadRequestException([String? message, String? url]) : super(message, 'Bad request', url);
}

class FetchDataException extends AppException {
  FetchDataException([String? message, String? url]) : super(message, 'Unable to process the request', url);
}

class ApiNotRespondingException extends AppException {
  ApiNotRespondingException([String? message, String? url]) : super(message, 'api_bloc not responding', url);
}

class UnAuthorizedException extends AppException {
  UnAuthorizedException([String? message, String? url]) : super(message, 'Unauthorized request', url);
}

class NotFoundException extends AppException {
  NotFoundException([String? message, String? url]) : super(message, 'Page not found', url);
}

class MethodNotAllowedException extends AppException {
  MethodNotAllowedException([String? message, String? url]) : super(message, 'Method not allowed', url);
}

class InternalServerException extends AppException {
  InternalServerException([String? message, String? url]) : super(message, 'Internal server error!!', url);
}