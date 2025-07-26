import 'dart:async';

import 'package:bloc_app/data/database/hive_local_storage.dart';
import 'package:bloc_app/services/connectivity_services.dart';
import 'package:chopper/chopper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

import '../../models/models.dart';
import '../../services/services.dart';
import '../../utilities/utilities.dart';
import '../repositories/repositories.dart';

final _baseUrlMainApi = dotenv.env['MAIN_WEATHER_URL'] as String;

final ChopperClient _mainClient = ChopperClient(
  baseUrl: Uri.parse(_baseUrlMainApi),
  converter: MainWeatherServiceConverter(),
  interceptors: [HttpLoggingInterceptor()],
  services: [MainWeatherService.create()],
  client: TimeoutHttpClient(
    inner: http.Client(),
    timeout: Duration(seconds: 10),
  ),
);

class HourlyWeatherForecastRepository implements Repository {
  final HiveLocalStorage<HourlyWeatherForecastModel> _weatherForecastStorage;

  HourlyWeatherForecastRepository({
    required HiveLocalStorage<HourlyWeatherForecastModel> currentWeatherStorage,
  }) : _weatherForecastStorage = currentWeatherStorage;

  //Responsible for fetching the data from the main API.
  Future<Response<Result>> _fetchDataFromMainApi({
    required double lon,
    required double lat,
    ChopperClient? client,
  }) async {
    //Get the service object.
    final mainWeatherService = MainWeatherService.create(client);
    final response = await mainWeatherService.getHourlyWeatherForecast(
      lat: lat,
      lon: lon,
    );

    return response;
  }

  @override
  Future<Result> fetchDataWithBackup() async {
    //Fetch the location data.
    final locationData = await LocationService.determinePositionInCodes();
    final lon = locationData.longitude;
    final lat = locationData.latitude;
    debugPrint('lat:${lat} n lon:${lon}');
    Success<HourlyForecasts> encapsulated;
    HourlyForecasts? cachedData, newData;

    //Check if the device is connected to internet, if it isn't, try accessing
    // the cached data.
    final isConnectionActive = await ConnectivityService.checkConnectivity();
    final isDataActive = await InternetConnectivityService.pingInternet();

    if (!isConnectionActive && !isDataActive) {
      //If the cache storage is empty, throw an exception.
      if (await _weatherForecastStorage.isStorageEmpty())
        return Future.error(NoCachedDataException());
      //Otherwise return the cached data.
      cachedData = await _weatherForecastStorage.fetchData();
      encapsulated = Success<HourlyForecasts>(cachedData!);
      return encapsulated;
    }

    //Otherwise, if the device is connected to a network, make a request
    //and cache the response.
    final mainResponse = await _fetchDataFromMainApi(
      lon: lon,
      lat: lat,
      client: _mainClient,
    );

    if (mainResponse.isSuccessful) {
      final responseBody = mainResponse.body;
      if (responseBody is Success<HourlyForecasts>) {
        encapsulated = responseBody;
        newData = encapsulated.value;
        _weatherForecastStorage.cacheData(data: newData);
        return Future.value(encapsulated);
      }
    }

    //If the request is erroneous, throw an error.
    if (mainResponse.error == null) {
      return Future.error(
        Error(
          Exception(
            "Unknown error: Response was not successful and body was null, but no error object provided.",
          ),
        ),
      );
    }

    if (mainResponse.error is Error) {
      return Future.value(mainResponse.error as Error);
    } else if (mainResponse.error is String) {
      return Future.value(Error(Exception(mainResponse.error)));
    } else {
      return Future.value(
        Error(Exception('Unexpected error type: ${mainResponse.error}')),
      );
    }
  }
}
