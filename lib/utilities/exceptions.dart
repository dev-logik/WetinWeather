class ApiFailureException implements Exception {
  final String message;

  ApiFailureException({this.message = ''});
}

class LocationServiceFailed implements Exception {
  final String message;

  LocationServiceFailed({this.message = ''});
}
