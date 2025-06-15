import 'dart:async';

import 'package:bloc_app/data/repositories/repository.dart';
import 'package:bloc_app/models/air_quality_pollutant_model.dart';
import 'package:bloc_app/services/air_quality_service_2_converter.dart';
import 'package:bloc_app/services/services.dart';
import 'package:chopper/chopper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

//Simplifies the type definition the definition of the return
// type of response for the network request.
typedef ResponseFuture = Future<Response<List<AirQualityPollutantModel>>>;

//Retrieve relevant data performing the requests.
//final _baseUrl1 = dotenv.env['AQ_SERVICE_1_BASE_URL'] as String;
final _baseUrl2 = dotenv.env['AQ_SERVICE_2_BASE_URL'] as String;
//final _token = dotenv.env['AQ_SERVICE_1_TOKEN'] as String;

final _apiClient2 = ChopperClient(
  baseUrl: Uri.parse(_baseUrl2),
  interceptors: [HttpLoggingInterceptor()],
  converter: AirQualityServiceTwoConverter(),
);

class AirQualityRepository extends Repository {
  final _apiService2 = AirQualityService_2.create(_apiClient2);

  //Fetches the data from the main API
  ResponseFuture _fetchDataFromApiService2(
    double longitude,
    double latitude,
    int forecastDays,
  ) async {
    final response = await _apiService2.getCurrentAirQualityDetails(
      longitude,
      latitude,
      forecastDays,
    );
    return response;
  }

  Future<List<AirQualityPollutantModel>> filteredData({
    int forecastDays = 1,
  }) async {
    final locationData = await LocationService.determinePositionInCodes();

    final lon = locationData.longitude;
    final lat = locationData.latitude;

    debugPrint('lat: ${locationData.latitude} lon: ${locationData.longitude}');

    final responseFromService2 = await _fetchDataFromApiService2(
      lon,
      lat,
      forecastDays,
    );
    debugPrint('Is it a success: ${responseFromService2.isSuccessful}');
    if (responseFromService2.isSuccessful) {
      //airQualityData = AirQualityModel.fromJson(responseBody1);
      List<AirQualityPollutantModel> responseBody2 =
          responseFromService2.body as List<AirQualityPollutantModel>;
      debugPrint('Pollutant Sample: ${responseBody2[1].toString()}');
      return Future.value(responseBody2);
    }

    return Future.error(responseFromService2.error!);
  }
}

class AQServiceOneInterceptor implements Interceptor {
  final token;
  AQServiceOneInterceptor({this.token});

  @override
  //Dynamically injects the token into the network request.
  FutureOr<Response<BodyType>> intercept<BodyType>(
    Chain<BodyType> chain,
  ) async {
    final request = await chain.request;
    final newParams = Map<String, dynamic>.from(request.parameters)
      ..['token'] = token;
    final currentRequest = request.copyWith(parameters: newParams);
    return chain.proceed(currentRequest);
  }
}
