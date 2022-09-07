/// Process API Response

import 'dart:convert';

import 'package:http/http.dart' as http;

import 'exception_classes.dart';

/// ----- API error with status codes ----- ///

dynamic processResponse(http.Response response) {
  switch (response.statusCode) {
    case 200:
      var responseJson = response.body;
      return responseJson;
    case 300:

      /// Multiple Choices
      throw MultipleChoicesException(jsonDecode(response.body)['message']);
    case 301:

      /// Moved permanently
      throw MovedPermanentlyException(jsonDecode(response.body)['message']);
    case 302:

      /// Found
      throw FoundException(jsonDecode(response.body)['message']);
    case 303:

      /// See other
      throw SeeOtherException(jsonDecode(response.body)['message']);
    case 304:

      /// Not modified
      throw NotModifiedException(jsonDecode(response.body)['message']);
    case 305:

      /// Use proxy
      throw UseProxyException(jsonDecode(response.body)['message']);
    case 307:

      /// Temporary redirect
      throw TemporaryRedirectException(jsonDecode(response.body)['message']);
    case 400:

      /// Bad Request
      throw BadRequestException(jsonDecode(response.body)['message']);
    case 401:

      /// Unauthorized
      throw UnAuthorizedException(jsonDecode(response.body)['message']);
    case 403:

      /// Forbidden
      throw UnAuthorizedException(jsonDecode(response.body)['message']);
    case 404:

      /// Resource not found
      throw NotFoundException(jsonDecode(response.body)['message']);
    case 405:

      /// Method not allowed
      throw MethodNotAllowedException(jsonDecode(response.body)['message']);
    case 406:

      /// Not acceptable
      throw NotAcceptableException(jsonDecode(response.body)['message']);
    case 407:

      /// Proxy authentication required
      throw ProxyAuthenticationRequiredException(
          jsonDecode(response.body)['message']);
    case 408:

      /// Request timed out
      throw RequestTimeOutException(jsonDecode(response.body)['message']);
    case 409:

      /// Conflict
      throw ConflictException(jsonDecode(response.body)['message']);
    case 410:

      /// Found
      throw GoneException(jsonDecode(response.body)['message']);
    case 411:

      /// Length required
      throw LengthRequiredException(jsonDecode(response.body)['message']);
    case 412:

      /// Pre condition failed
      throw PreConditionFailedException(jsonDecode(response.body)['message']);
    case 413:

      /// Request entity too large
      throw RequestEntityTooLargeException(
          jsonDecode(response.body)['message']);
    case 414:

      /// Request uri too long
      throw RequestUriTooLongException(jsonDecode(response.body)['message']);
    case 415:

      /// Unsupported media type
      throw UnsupportedMediaTypeException(jsonDecode(response.body)['message']);
    case 416:

      /// Request range not satisfiable
      throw RequestedRangeNotSatisfiableException(
          jsonDecode(response.body)['message']);
    case 417:

      /// Exception failed
      throw FailedException(jsonDecode(response.body)['message']);
    case 419:

      /// Missing arguments
      throw MissingArgumentsException(jsonDecode(response.body)['message']);
    case 420:

      /// Invalid  arguments
      throw InvalidArgumentsException(jsonDecode(response.body)['message']);
    case 422:

      /// UnProcessable entity
      throw UnProcessableEntityException(jsonDecode(response.body)['message']);
    case 500:

      /// Internal Server Error
      throw InternalServerException(jsonDecode(response.body)['message']);
    case 501:

      /// Not implemented
      throw NotImplementedException(jsonDecode(response.body)['message']);
    case 502:

      /// Bad gateway
      throw BadGatewayException(jsonDecode(response.body)['message']);
    case 503:

      /// Service unavailable
      throw ServiceUnavailableException(jsonDecode(response.body)['message']);
    case 504:

      /// Gateway time out
      throw GatewayTimeOutException(jsonDecode(response.body)['message']);
    case 505:

      /// HTTP version not supported
      throw HttpVersionNotSupportedException(
          jsonDecode(response.body)['message']);
    case 550:

      /// Initialization failure
      throw InitializationFailureException(
          jsonDecode(response.body)['message']);
    default:
      throw FetchDataException('Something went wrong! ${response.statusCode}');
  }
}
