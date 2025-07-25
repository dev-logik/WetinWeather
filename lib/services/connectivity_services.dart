import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:http/http.dart' as http;

class ConnectivityService {
  ConnectivityService._();

  static final _connectivity = Connectivity();
  static const _allowableConnections = [
    ConnectivityResult.mobile,
    ConnectivityResult.wifi,
    ConnectivityResult.vpn,
  ];

  static Future<bool> checkConnectivity() async {
    final connectivityResults = await _connectivity.checkConnectivity();
    return connectivityResults.any(
      (result) => _allowableConnections.contains(result),
    );
  }

  static Stream<bool> get onConnectivityChanged {
    return _connectivity.onConnectivityChanged.map((connectivityResults) {
      // Check if any of the new results are in our allowable list
      return connectivityResults.any(
        (result) => _allowableConnections.contains(result),
      );
    });
  }
}

class InternetConnectivityService {
  InternetConnectivityService._();

  static Future<bool> pingInternet() async {
    final baseUrl = 'https://www.google.com';
    final baseUri = Uri.parse(baseUrl);
    try {
      final response = await http.get(baseUri);
      return response.statusCode == 200;
    } catch (ex) {
      return Future.value(false);
    }
  }
}
