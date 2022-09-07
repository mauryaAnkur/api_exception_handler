/// Exception Handlers

import 'dart:async';
import 'dart:io';

import 'exception_classes.dart';

class ExceptionHandlers {
  getExceptionString(error) {
    if (error is SocketException) {
      return 'No Internet Connection';
    } else if (error is HttpException) {
      return 'HTTP error occurred';
    } else if (error is FormatException) {
      return 'Invalid data format';
    } else if (error is TimeoutException) {
      return 'Request time out';
    } else if (error is BadRequestException) {
      return error.message.toString();
    } else if (error is UnAuthorizedException) {
      return error.message.toString();
    } else if (error is NotFoundException) {
      return error.message.toString();
    } else if (error is MethodNotAllowedException) {
      return error.message.toString();
    } else if (error is FetchDataException) {
      return error.message.toString();
    } else if (error is InternalServerException) {
      return error.message.toString();
    } else {
      return 'Unknown error occurred';
    }
  }
}
