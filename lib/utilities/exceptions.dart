class ApiFailureException implements Exception {
  final String message;
  ApiFailureException({this.message = ''});
}
