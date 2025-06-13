import 'dart:async';
import 'dart:io';

import 'package:chopper/chopper.dart';

class AirQualityServiceTwoConverter extends JsonConverter {
  @override
  Request convertRequest(Request request) {
    return super.convertRequest(request);
  }

  @override
  FutureOr<Response<BodyType>> convertResponse<BodyType, InnerType>(
    Response response,
  ) async {
    final contentType = 'content-type';
    final jsonType = 'application/json';
    final responseHeader = response.headers;
    try {
      //If the response is a success, then needs conversion.
      if (response.isSuccessful) {
        Map<String, dynamic> data;
        final decodedRes = await super.convertResponse(response);
        data = decodedRes.body as Map<String, dynamic>;
        if (data.containsKey('current')) {
          return (response.copyWith(
            base: response.base,
            body: data['current'] as BodyType,
          ));
        }
      }

      if (response.body is String) {
        return response.copyWith(
          base: response.base,
          body: response.body as BodyType,
        );
      }

      if (!response.isSuccessful) {
        throw HttpException(
          'Your request cannot be processed: ${response.statusCode}',
        );
      }
    } catch (e) {
      return response.copyWith(
        base: response.base,
        body: e as BodyType,
        bodyError: e.toString(),
      );
    }
    //Return not found if the response is incorrect.
    return Response(response.base, response.body as BodyType);
  }
}
