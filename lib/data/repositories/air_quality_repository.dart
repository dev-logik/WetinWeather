import 'dart:async';

import 'package:bloc_app/data/database/hive_local_storage.dart';
import 'package:bloc_app/data/repositories/repository.dart';
import 'package:bloc_app/models/current_pollutant_model.dart';
import 'package:bloc_app/services/connectivity_services.dart';
import 'package:bloc_app/services/services.dart';
import 'package:chopper/chopper.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

import '../../models/response_model.dart';
import '../../utilities/utilities.dart';

//Simplifies the type definition the definition of the return
// type of response for the network request.
typedef ResponseFuture = Future<Response>;
typedef PollutantsFuture = Future<List<CurrentPollutantModel>>;
typedef Pollutants = List<CurrentPollutantModel>;

final _baseUrlMainApi = dotenv.env['AQ_MAIN_URL'] as String;
final _baseUrlBackupApi = dotenv.env['AQ_BACKUP_BASE_URL'] as String;
final _backupToken = dotenv.env['AQ_BACKUP_TOKEN'] as String;

final _mainApiClient = ChopperClient(
  baseUrl: Uri.parse(_baseUrlMainApi),
  converter: AirQualityConverterForMainApi(),
  interceptors: [HttpLoggingInterceptor()],
  services: [AirQualityMainService.create()],
  client: TimeoutHttpClient(
    inner: http.Client(),
    timeout: Duration(seconds: 10),
  ),
);

final _backupApiClient = ChopperClient(
  baseUrl: Uri.parse(_baseUrlBackupApi),
  converter: AirQualityConverterForBackupApi(),
  interceptors: [
    HttpLoggingInterceptor(),
    AirQualityBackupInterceptor(token: _backupToken),
  ],
  services: [AirQualityBackupService.create()],
);

class AirQualityRepository extends Repository {
  final HiveLocalStorage<CurrentPollutantModel> _currentPollutantStorage;

  AirQualityRepository({
    required HiveLocalStorage<CurrentPollutantModel> currentPollutantStorage,
  }) : _currentPollutantStorage = currentPollutantStorage;

  //Fetches the data from the main API
  ResponseFuture _fetchFromMainApi({
    required double lon,
    required double lat,
    required ChopperClient clientRef,
  }) async {
    final mainApiService = AirQualityMainService.create(clientRef);
    final response = await mainApiService.getCurrentAirQualityDetails(lon, lat);
    return response;
  }

  //Fetches the data from the backup API
  ResponseFuture _fetchFromBackupApi({
    required double lon,
    required double lat,
    required ChopperClient clientRef,
  }) async {
    final backupApiService = AirQualityBackupService.create(clientRef);
    final response = await backupApiService.getCurrentAirQualityDetails(
      lon,
      lat,
    );
    return response;
  }

  //Fetches the data with a backup api
  Future<Result> fetchDataWithBackup() async {
    //Fetch current location
    final locationData = await LocationService.determinePositionInCodes();
    final Success<Pollutants> encapsulated;
    final Pollutants? cachedData, newData;

    final lon = locationData.longitude;
    final lat = locationData.latitude;

    //Check if the device is connected to internet, if it isn't, try accessing
    // the cached data.
    final isConnectionActive = await ConnectivityService.checkConnectivity();
    final isDataActive = await InternetConnectivityService.pingInternet();
    if (!isConnectionActive && !isDataActive) {
      //If the cache storage is empty, throw an exception.
      if (await _currentPollutantStorage.isStorageEmpty()) {
        return Future.error(NoCachedDataException());
      }
      cachedData = await _currentPollutantStorage.fetchData();
      encapsulated = Success<Pollutants>(cachedData!);
      return encapsulated;
    }

    //Fetch data from the main Api
    final mainResponse = await _fetchFromMainApi(
      lon: lon,
      lat: lat,
      clientRef: _mainApiClient,
    );

    //Fetch data from the backup Api
    final backupResponse = await _fetchFromBackupApi(
      lon: lon,
      lat: lat,
      clientRef: _backupApiClient,
    );

    //Otherwise, if the device is connected to a network, make a request
    //and cache the response.
    if (mainResponse.isSuccessful) {
      final responseBody = mainResponse.body;
      if (responseBody != null) {
        encapsulated = responseBody;
        newData = encapsulated.value;
        _currentPollutantStorage.cacheData(data: newData);
        return Future.value(responseBody as Success);
      }
    }

    //if the main Api fails, send data from the backup Api.
    if (!mainResponse.isSuccessful && backupResponse.isSuccessful) {
      final responseBody = backupResponse.body;
      if (backupResponse.body != null) {
        encapsulated = responseBody;
        newData = encapsulated.value;
        _currentPollutantStorage.cacheData(data: newData);
        return Future.value(responseBody);
      }
    }

    //If both fails, throw an exception.
    throw ApiFailureException();
  }
}
