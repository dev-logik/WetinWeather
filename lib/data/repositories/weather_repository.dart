import 'dart:async';

import 'package:bloc_app/data/repositories/repository.dart';
import 'package:bloc_app/services/weather_main_service_converter.dart';
import 'package:chopper/chopper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import '../../services/services.dart';

final _baseUrlMainApi = dotenv.env['MAIN_WEATHER_URL'] as String;

final ChopperClient _mainClient = ChopperClient(
  baseUrl: Uri.parse(_baseUrlMainApi),
  converter: MainWeatherServiceConverter(),
  interceptors: [HttpLoggingInterceptor()],
);

class WeatherRepository implements Repository {
  //Responsible for fetching the data from the main API.
  Future<Response<Result>> _fetchDataFromMainApi({
    required double lon,
    required double lat,
    ChopperClient? client,
  }) async {
    debugPrint('before create');
    //Get the service object.
    final mainWeatherService = MainWeatherService.create(client);
    debugPrint('After create');

    debugPrint("Before Api call");
    final response = await mainWeatherService.getCurrentWeatherDetails(
      lat: lat,
      lon: lon,
    );
    debugPrint('After Api call');
    return Future.value(response);
  }

  @override
  Future<Result> fetchDataWithBackup() async {
    //Fetch the location data.
    final locationData = await LocationService.determinePositionInCodes();
    final _lon = locationData.longitude;
    final _lat = locationData.latitude;
    debugPrint("lon: ${_lon} and lat: ${_lat}");

    //Response from the main.
    final mainResponse = await _fetchDataFromMainApi(
      lon: _lon,
      lat: _lat,
      client: _mainClient,
    );

    //if the request is a success, get the data.
    if (mainResponse.isSuccessful) {
      if (mainResponse.body != null) {
        return Future.value(mainResponse.body);
      }
    }
    //If the request is erroneous, throw an error.
    return Future.value(
      (mainResponse.error is String)
          ? Error(Exception(mainResponse.error))
          : mainResponse.error as Error,
    );
  }
}
