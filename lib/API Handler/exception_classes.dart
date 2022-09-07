

class AppException implements Exception {
  final String? message;
  final String? prefix;
  final String? url;

  AppException([this.message, this.prefix, this.url]);
}



class MultipleChoicesException extends AppException {
  MultipleChoicesException([String? message, String? url]) : super(message, 'Multiple Choices', url);
}

class MovedPermanentlyException extends AppException {
  MovedPermanentlyException([String? message, String? url]) : super(message, 'The resources has moved permanently.', url);
}

class FoundException extends AppException {
  FoundException([String? message, String? url]) : super(message, 'The resources has moved temporarily', url);
}

class SeeOtherException extends AppException {
  SeeOtherException([String? message, String? url]) : super(message, 'The resource can be found under a different URI', url);
}

class NotModifiedException extends AppException {
  NotModifiedException([String? message, String? url]) : super(message, 'The resource is available and not modified', url);
}

class UseProxyException extends AppException {
  UseProxyException([String? message, String? url]) : super(message, 'The requested resource must be accessed through the proxy given by the Location field', url);
}

class TemporaryRedirectException extends AppException {
  TemporaryRedirectException([String? message, String? url]) : super(message, 'Temporary Redirect', url);
}

class BadRequestException extends AppException {
  BadRequestException([String? message, String? url]) : super(message, 'Bad request', url);
}

class FetchDataException extends AppException {
  FetchDataException([String? message, String? url]) : super(message, 'Unable to process the request', url);
}

class ApiNotRespondingException extends AppException {
  ApiNotRespondingException([String? message, String? url]) : super(message, 'API not responding', url);
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

class NotAcceptableException extends AppException {
  NotAcceptableException([String? message, String? url]) : super(message, 'Not Acceptable', url);
}

class ProxyAuthenticationRequiredException extends AppException {
  ProxyAuthenticationRequiredException([String? message, String? url]) : super(message, 'Proxy Authentication Required', url);
}

class RequestTimeOutException extends AppException {
  RequestTimeOutException([String? message, String? url]) : super(message, 'Request TimeOut', url);
}

class ConflictException extends AppException {
  ConflictException([String? message, String? url]) : super(message, 'The request could not be completed due to conflict', url);
}

class GoneException extends AppException {
  GoneException([String? message, String? url]) : super(message, 'No longer available', url);
}

class LengthRequiredException extends AppException {
  LengthRequiredException([String? message, String? url]) : super(message, 'Length of the content is required', url);
}

class PreConditionFailedException extends AppException {
  PreConditionFailedException([String? message, String? url]) : super(message, 'Unauthorized request', url);
}

class RequestEntityTooLargeException extends AppException {
  RequestEntityTooLargeException([String? message, String? url]) : super(message, 'The request entity is large than the server is willing', url);
}

class RequestUriTooLongException extends AppException {
  RequestUriTooLongException([String? message, String? url]) : super(message, 'The request URI is large than the server is willing', url);
}


class UnsupportedMediaTypeException extends AppException {
  UnsupportedMediaTypeException([String? message, String? url]) : super(message, 'The requested resource does not support the media type provided', url);
}

class RequestedRangeNotSatisfiableException extends AppException {
  RequestedRangeNotSatisfiableException([String? message, String? url]) : super(message, 'The requested range for the resource is not available', url);
}

class FailedException extends AppException {
  FailedException([String? message, String? url]) : super(message, 'Unable to meet th exceptions', url);
}

class MissingArgumentsException extends AppException {
  MissingArgumentsException([String? message, String? url]) : super(message, 'Missing required arguments', url);
}

class InvalidArgumentsException extends AppException {
  InvalidArgumentsException([String? message, String? url]) : super(message, 'Invalid arguments', url);
}

class UnProcessableEntityException extends AppException {
  UnProcessableEntityException([String? message, String? url]) : super(message, 'UnProcessable', url);
}

class InternalServerException extends AppException {
  InternalServerException([String? message, String? url]) : super(message, 'Internal server error!!', url);
}

class NotImplementedException extends AppException {
  NotImplementedException([String? message, String? url]) : super(message, 'Not implemented', url);
}

class BadGatewayException extends AppException {
  BadGatewayException([String? message, String? url]) : super(message, 'Invalid response received when acting as a proxy or gateway', url);
}

class ServiceUnavailableException extends AppException {
  ServiceUnavailableException([String? message, String? url]) : super(message, 'Service unavailable', url);
}

class GatewayTimeOutException extends AppException {
  GatewayTimeOutException([String? message, String? url]) : super(message, 'Gateway time out', url);
}

class HttpVersionNotSupportedException extends AppException {
  HttpVersionNotSupportedException([String? message, String? url]) : super(message, 'HTTP version not supported', url);
}

class InitializationFailureException extends AppException {
  InitializationFailureException([String? message, String? url]) : super(message, 'API unavailable', url);
}