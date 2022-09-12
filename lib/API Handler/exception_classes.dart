/// API Response Exceptions

class AppException implements Exception {
  final String? message;
  final String? prefix;
  final String? url;

  AppException([this.message, this.prefix, this.url]);
}

/// Multiple Choices
/// The requested resource corresponds to any one of a set
/// of representations, each with its own specific location.
class MultipleChoicesException extends AppException {
  MultipleChoicesException([String? message, String? url])
      : super(message ?? 'Multiple Choices', url);
}

/// Moved permanently
/// The resource has moved permanently. Please refer to the documentation.
class MovedPermanentlyException extends AppException {
  MovedPermanentlyException([String? message, String? url])
      : super(message ?? 'The resources has moved permanently.', url);
}

/// Found exception
/// The resource has moved permanently. Please refer to the documentation.
class FoundException extends AppException {
  FoundException([String? message, String? url])
      : super(message ?? 'The resources has moved temporarily', url);
}

/// See other exception
/// The resource has moved permanently. Please refer to the documentation.
class SeeOtherException extends AppException {
  SeeOtherException([String? message, String? url])
      : super(
            message ?? 'The resource can be found under a different URI', url);
}

/// Not modified exception
/// The resource is available and not modified.
class NotModifiedException extends AppException {
  NotModifiedException([String? message, String? url])
      : super(message ?? 'The resource is available and not modified', url);
}

/// Use proxy exception
/// The requested resource must be accessed through the proxy
/// given by the Location field.
class UseProxyException extends AppException {
  UseProxyException([String? message, String? url])
      : super(
            message,
            'The requested resource must be accessed through the'
            ' proxy given by the Location field',
            url);
}

/// Temporary redirect
/// The resource resides temporarily under a different URI.
class TemporaryRedirectException extends AppException {
  TemporaryRedirectException([String? message, String? url])
      : super(message ?? 'Temporary Redirect', url);
}

/// Bad Request
/// Invalid syntax for this request was provided.
class BadRequestException extends AppException {
  BadRequestException([String? message, String? url])
      : super(message ?? 'Bad request', url);
}

/// Fetch data exception
class FetchDataException extends AppException {
  FetchDataException([String? message, String? url])
      : super(message ?? 'Unable to process the request', url);
}

/// API not responding
class ApiNotRespondingException extends AppException {
  ApiNotRespondingException([String? message, String? url])
      : super(message ?? 'API not responding', url);
}

/// Unauthorized
/// You are unauthorized to access the requested resource. Please log in.
class UnAuthorizedException extends AppException {
  UnAuthorizedException([String? message, String? url])
      : super(message ?? 'Unauthorized request', url);
}

/// Resource not found
/// We could not find the resource you requested.
/// Please refer to the documentation for the list of resources.
class NotFoundException extends AppException {
  NotFoundException([String? message, String? url])
      : super(message ?? 'Page not found', url);
}

/// Method not allowed
/// This method type is not currently supported.
class MethodNotAllowedException extends AppException {
  MethodNotAllowedException([String? message, String? url])
      : super(message ?? 'Method not allowed', url);
}

/// Not acceptable
/// Acceptance header is invalid for this endpoint resource.
class NotAcceptableException extends AppException {
  NotAcceptableException([String? message, String? url])
      : super(message ?? 'Not Acceptable', url);
}

/// Proxy authentication required
/// Authentication with proxy is required.
class ProxyAuthenticationRequiredException extends AppException {
  ProxyAuthenticationRequiredException([String? message, String? url])
      : super(message ?? 'Proxy Authentication Required', url);
}

/// Request timed out
/// Client did not produce a request within the time that the server
/// was prepared to wait.
class RequestTimeOutException extends AppException {
  RequestTimeOutException([String? message, String? url])
      : super(message ?? 'Request TimeOut', url);
}

/// Conflict
/// The request could not be completed due to a
/// conflict with the current state of the resource.
class ConflictException extends AppException {
  ConflictException([String? message, String? url])
      : super(message ?? 'The request could not be completed due to conflict',
            url);
}

/// Gone exception
/// The requested resource is no longer available and has been
/// permanently removed.
class GoneException extends AppException {
  GoneException([String? message, String? url])
      : super(message ?? 'No longer available', url);
}

/// Length required
/// Length of the content is required, please include it with the request.
class LengthRequiredException extends AppException {
  LengthRequiredException([String? message, String? url])
      : super(message ?? 'Length of the content is required', url);
}

/// Pre condition failed
/// The request did not match the pre-conditions of the requested resource.
class PreConditionFailedException extends AppException {
  PreConditionFailedException([String? message, String? url])
      : super(message ?? 'Unauthorized request', url);
}

/// Request entity too large
/// The request entity is larger than the server is willing
/// or able to process.
class RequestEntityTooLargeException extends AppException {
  RequestEntityTooLargeException([String? message, String? url])
      : super(
            message ?? 'The request entity is large than the server is willing',
            url);
}

/// Request uri too long
/// The request URI is longer than the server is willing to interpret.
class RequestUriTooLongException extends AppException {
  RequestUriTooLongException([String? message, String? url])
      : super(message ?? 'The request URI is large than the server is willing',
            url);
}

/// Unsupported media type
/// The requested resource does not support the media type provided.
class UnsupportedMediaTypeException extends AppException {
  UnsupportedMediaTypeException([String? message, String? url])
      : super(
            message,
            'The requested resource does not support the media type provided',
            url);
}

/// Request range not satisfiable
/// The requested range for the resource is not available.
class RequestedRangeNotSatisfiableException extends AppException {
  RequestedRangeNotSatisfiableException([String? message, String? url])
      : super(
            message ?? 'The requested range for the resource is not available',
            url);
}

/// Exception failed
/// Unable to meet the expectation given in the Expect request header.
class FailedException extends AppException {
  FailedException([String? message, String? url])
      : super(message ?? 'Unable to meet th exceptions', url);
}

/// Missing arguments
/// The requested resource is missing required arguments.
class MissingArgumentsException extends AppException {
  MissingArgumentsException([String? message, String? url])
      : super(message ?? 'Missing required arguments', url);
}

/// Invalid  arguments
/// The requested resource does not support one
/// or more of the given parameters.
class InvalidArgumentsException extends AppException {
  InvalidArgumentsException([String? message, String? url])
      : super(message ?? 'Invalid arguments', url);
}

/// UnProcessable entity
/// The request was well-formed but was unable to be followed
/// due to semantic errors.
class UnProcessableEntityException extends AppException {
  UnProcessableEntityException([String? message, String? url])
      : super(message ?? 'UnProcessable', url);
}

/// Internal Server Error
/// Unexpected internal server error.
class InternalServerException extends AppException {
  InternalServerException([String? message, String? url])
      : super(
          message ?? 'Internal server error!!',
          url,
        );
}

/// Not implemented
/// The requested resource is recognized but not implemented.
class NotImplementedException extends AppException {
  NotImplementedException([String? message, String? url])
      : super(message ?? 'Not implemented', url);
}

/// Bad gateway
/// Invalid response received when acting as a proxy or gateway.
class BadGatewayException extends AppException {
  BadGatewayException([String? message, String? url])
      : super(message,
            'Invalid response received when acting as a proxy or gateway', url);
}

/// Service unavailable
/// The server is currently unavailable.
class ServiceUnavailableException extends AppException {
  ServiceUnavailableException([String? message, String? url])
      : super(message ?? 'Service unavailable', url);
}

/// Gateway time out
/// Did not receive a timely response from upstream server
/// while acting as a gateway or proxy.
class GatewayTimeOutException extends AppException {
  GatewayTimeOutException([String? message, String? url])
      : super(message ?? 'Gateway time out', url);
}

/// HTTP version not supported
/// The HTTP protocol version used in the request message is not supported.
class HttpVersionNotSupportedException extends AppException {
  HttpVersionNotSupportedException([String? message, String? url])
      : super(message ?? 'HTTP version not supported', url);
}

/// Initialization failure
/// A failure occurred during initialization of services.
/// API will be unavailable.
class InitializationFailureException extends AppException {
  InitializationFailureException([String? message, String? url])
      : super(message ?? 'API unavailable', url);
}
