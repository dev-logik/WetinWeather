import 'package:http/http.dart' as http;

class TimeoutHttpClient extends http.BaseClient {
  final http.Client _inner;
  final Duration _timeout;

  TimeoutHttpClient({required http.Client inner, required Duration timeout})
    : _inner = inner,
      _timeout = timeout;

  @override
  Future<http.StreamedResponse> send(http.BaseRequest request) {
    return _inner.send(request).timeout(_timeout);
  }
}
