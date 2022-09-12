/// API Exception Handler

import 'dart:async';
import 'dart:io';
import 'exception_classes.dart';

/// ExceptionHandlers class handle all types of exceptions
///
class ExceptionHandlers {
  getExceptionString(error) {
    /// Socket Exception
    ///
    /// SocketException is a subclass of IOException so
    /// it’s a checked exception.
    /// It is the most general exception that
    /// signals a problem when trying to open or access a socket.
    if (error is SocketException) {
      return 'No Internet Connection';
    }

    /// Http Exception
    ///
    else if (error is HttpException) {
      return 'HTTP error occurred';
    }

    /// Format Exception
    ///
    /// Exception thrown when a string or some other data does
    /// not have an expected format and cannot be parsed or processed.
    else if (error is FormatException) {
      return 'Invalid data format';
    }

    /// Timeout Exception
    ///
    /// Thrown when a scheduled timeout happens
    /// while waiting for an async result.
    else if (error is TimeoutException) {
      return 'Request time out';
    }

    /// BadRequest Exception
    /// Invalid syntax for this request was provided.
    else if (error is BadRequestException) {
      return error.message.toString();
    }

    /// UnAuthorized Exception
    /// You are unauthorized to access the requested resource. Please log in.
    else if (error is UnAuthorizedException) {
      return error.message.toString();
    }

    /// NotFound Exception
    else if (error is NotFoundException) {
      return error.message.toString();
    }

    /// Method not allowed Exception
    /// This method type is not currently supported.
    else if (error is MethodNotAllowedException) {
      return error.message.toString();
    }

    /// FetchData Exception
    else if (error is FetchDataException) {
      return error.message.toString();
    }

    /// Internal server Exception
    /// Unexpected internal server error.
    else if (error is InternalServerException) {
      return error.message.toString();
    }

    /// default error
    else {
      return 'Unknown error occurred';
    }
  }
}
