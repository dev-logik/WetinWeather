import 'dart:async';
import 'dart:io';

import 'package:bloc_app/utilities/exceptions.dart';
import 'package:chopper/chopper.dart';
import 'package:http/http.dart' hide Response;

import '../services/network_exceptions.dart';

abstract class ErrorHelpers {
  static String getFriendlyError(dynamic error) {
    if (error is SocketException || error is ClientException) {
      return "No internet connection. Please check your network.";
    } else if (error is TimeoutException) {
      return "Request timed out. Try again later.";
    } else if (error is FormatException) {
      return "Invalid server response.";
    } else if (error is ApiFailureException) {
      return "Server temporarily down. Try again!";
    } else if (error is NoCachedDataException) {
      return "No cached data available. Turn on internet connection.";
    }
    if (error is TimeoutException) {
      return 'Connection timed out. Check Internet Connection!';
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
    return "Something went wrong. ${error.toString()}";
  }
}
