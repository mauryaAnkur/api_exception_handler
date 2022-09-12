/// Process API Response

import 'dart:convert';

import 'package:http/http.dart' as http;

import 'exception_classes.dart';

/// API error with status codes

dynamic processResponse(http.Response response) {
  switch (response.statusCode) {
    case 200:
      var responseJson = response.body;
      return responseJson;

    /// Multiple Choices
    /// The requested resource corresponds to any one of a set
    /// of representations, each with its own specific location.
    case 300:
      throw MultipleChoicesException(jsonDecode(response.body)['message']);

    /// Moved permanently
    /// The resource has moved permanently. Please refer to the documentation.
    case 301:
      throw MovedPermanentlyException(jsonDecode(response.body)['message']);

    /// Found exception
    /// The resource has moved permanently. Please refer to the documentation.
    case 302:
      throw FoundException(jsonDecode(response.body)['message']);

    /// See other
    /// The resource has moved permanently. Please refer to the documentation.
    case 303:
      throw SeeOtherException(jsonDecode(response.body)['message']);

    /// Not modified
    /// The resource is available and not modified.
    case 304:
      throw NotModifiedException(jsonDecode(response.body)['message']);

    /// Use proxy
    /// The requested resource must be accessed through the proxy
    /// given by the Location field.
    case 305:
      throw UseProxyException(jsonDecode(response.body)['message']);

    /// Temporary redirect
    /// The resource resides temporarily under a different URI.
    case 307:
      throw TemporaryRedirectException(jsonDecode(response.body)['message']);

    /// Bad Request
    /// Invalid syntax for this request was provided.
    case 400:
      throw BadRequestException(jsonDecode(response.body)['message']);

    /// Unauthorized
    /// You are unauthorized to access the requested resource. Please log in.
    case 401:
      throw UnAuthorizedException(jsonDecode(response.body)['message']);

    /// Forbidden
    /// Your account is not authorized to access the requested resource.
    case 403:
      throw UnAuthorizedException(jsonDecode(response.body)['message']);

    /// Resource not found
    /// We could not find the resource you requested.
    /// Please refer to the documentation for the list of resources.
    case 404:
      throw NotFoundException(jsonDecode(response.body)['message']);

    /// Method not allowed
    /// This method type is not currently supported.
    case 405:
      throw MethodNotAllowedException(jsonDecode(response.body)['message']);

    /// Not acceptable
    /// Acceptance header is invalid for this endpoint resource.
    case 406:
      throw NotAcceptableException(jsonDecode(response.body)['message']);

    /// Proxy authentication required
    /// Authentication with proxy is required.
    case 407:
      throw ProxyAuthenticationRequiredException(
          jsonDecode(response.body)['message']);

    /// Request timed out
    /// Client did not produce a request within the time that the server
    /// was prepared to wait.
    case 408:
      throw RequestTimeOutException(jsonDecode(response.body)['message']);

    /// Conflict
    /// The request could not be completed due to a
    /// conflict with the current state of the resource.
    case 409:
      throw ConflictException(jsonDecode(response.body)['message']);

    /// Gone exception
    /// The requested resource is no longer available and has been
    /// permanently removed.
    case 410:
      throw GoneException(jsonDecode(response.body)['message']);

    /// Length required
    /// Length of the content is required, please include it with the request.
    case 411:
      throw LengthRequiredException(jsonDecode(response.body)['message']);

    /// Pre condition failed
    /// The request did not match the pre-conditions of the requested resource.
    case 412:
      throw PreConditionFailedException(jsonDecode(response.body)['message']);

    /// Request entity too large
    /// The request entity is larger than the server is willing
    /// or able to process.
    case 413:
      throw RequestEntityTooLargeException(
          jsonDecode(response.body)['message']);

    /// Request uri too long
    /// The request URI is longer than the server is willing to interpret.
    case 414:
      throw RequestUriTooLongException(jsonDecode(response.body)['message']);

    /// Unsupported media type
    /// The requested resource does not support the media type provided.
    case 415:
      throw UnsupportedMediaTypeException(jsonDecode(response.body)['message']);

    /// Request range not satisfiable
    /// The requested range for the resource is not available.
    case 416:
      throw RequestedRangeNotSatisfiableException(
          jsonDecode(response.body)['message']);

    /// Exception failed
    /// Unable to meet the expectation given in the Expect request header.
    case 417:
      throw FailedException(jsonDecode(response.body)['message']);

    /// Missing arguments
    /// The requested resource is missing required arguments.
    case 419:
      throw MissingArgumentsException(jsonDecode(response.body)['message']);

    /// Invalid  arguments
    /// The requested resource does not support one or
    /// more of the given parameters.
    case 420:
      throw InvalidArgumentsException(jsonDecode(response.body)['message']);

    /// UnProcessable entity
    /// The request was well-formed but was unable to be followed
    /// due to semantic errors.
    case 422:
      throw UnProcessableEntityException(jsonDecode(response.body)['message']);

    /// Internal Server Error
    /// Unexpected internal server error.
    case 500:
      throw InternalServerException(jsonDecode(response.body)['message']);

    /// Not implemented
    /// The requested resource is recognized but not implemented.
    case 501:
      throw NotImplementedException(jsonDecode(response.body)['message']);

    /// Bad gateway
    /// Invalid response received when acting as a proxy or gateway.
    case 502:
      throw BadGatewayException(jsonDecode(response.body)['message']);

    /// Service unavailable
    /// The server is currently unavailable.
    case 503:
      throw ServiceUnavailableException(jsonDecode(response.body)['message']);

    /// Gateway time out
    /// Did not receive a timely response from upstream server
    /// while acting as a gateway or proxy.
    case 504:
      throw GatewayTimeOutException(jsonDecode(response.body)['message']);

    /// HTTP version not supported
    /// The HTTP protocol version used in the request message is not supported.
    case 505:
      throw HttpVersionNotSupportedException(
          jsonDecode(response.body)['message']);

    /// Initialization failure
    /// A failure occurred during initialization of services.
    /// API will be unavailable.
    case 550:
      throw InitializationFailureException(
          jsonDecode(response.body)['message']);

    /// default error message
    default:
      throw FetchDataException('Something went wrong! ${response.statusCode}');
  }
}
