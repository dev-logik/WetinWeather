import 'dart:async';
import 'dart:io';

import 'package:chopper/chopper.dart';

abstract class ErrorHelpers {
  static String getFriendlyError(dynamic error) {
    if (error is SocketException) {
      return "No internet connection. Please check your network.";
    } else if (error is TimeoutException) {
      return "Request timed out. Try again later.";
    } else if (error is FormatException) {
      return "Invalid server response.";
    } else if (error is Response) {
      // Handle Chopper's HTTP errors (4xx/5xx)
      switch (error.statusCode) {
        case 400:
          return "Invalid request.";
        case 401:
          return "Please log in again.";
        case 404:
          return "Resource not found.";
        case 500:
          return "Server error. Contact support.";
        default:
          return "HTTP error (${error.statusCode}).";
      }
    }
    return "Something went wrong.";
  }
}
