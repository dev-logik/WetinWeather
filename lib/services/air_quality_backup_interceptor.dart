import 'dart:async';

import 'package:chopper/chopper.dart';

class AirQualityBackupInterceptor implements Interceptor {
  final String token;
  AirQualityBackupInterceptor({required this.token});

  @override
  //Dynamically injects the token into the network request.
  FutureOr<Response<BodyType>> intercept<BodyType>(
    Chain<BodyType> chain,
  ) async {
    final request = await chain.request;
    final newParams = request.parameters;
    newParams['token'] = token;
    final currentRequest = request.copyWith(parameters: newParams);
    return chain.proceed(currentRequest);
  }
}
