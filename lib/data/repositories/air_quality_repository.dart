import 'dart:async';

import 'package:bloc_app/data/repositories/repository.dart';
import 'package:bloc_app/models/air_quality_pollutant_model.dart';
import 'package:bloc_app/services/services.dart';
import 'package:bloc_app/utilities/exceptions.dart';
import 'package:chopper/chopper.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

//Simplifies the type definition the definition of the return
// type of response for the network request.
typedef ResponseFuture = Future<Response<List<AirQualityPollutantModel>>>;
typedef PollutantsFuture = Future<List<AirQualityPollutantModel>>;

final _baseUrlMainApi = dotenv.env['AQ_MAIN_URL'] as String;
final _baseUrlBackupApi = dotenv.env['AQ_BACKUP_BASE_URL'] as String;
final _backupToken = dotenv.env['AQ_BACKUP_TOKEN'] as String;

final _mainApiClient = ChopperClient(
  baseUrl: Uri.parse(_baseUrlMainApi),
  converter: AirQualityConverterForMainApi(),
  interceptors: [HttpLoggingInterceptor()],
  services: [AirQualityMainService.create()],
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
  //Fetches the data from the main API
  Future<Response<Result>> _fetchFromMainApi({
    required double lon,
    required double lat,
    required ChopperClient clientRef,
  }) async {
    final mainApiService = AirQualityMainService.create(clientRef);
    final response = await mainApiService.getCurrentAirQualityDetails(lon, lat);
    return response;
  }

  //Fetches the data from the backup API
  Future<Response<Result>> _fetchFromBackupApi({
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

    final _lon = locationData.longitude;
    final _lat = locationData.latitude;

    //Fetch data from the main Api
    final mainResponse = await _fetchFromMainApi(
      lon: _lon,
      lat: _lat,
      clientRef: _mainApiClient,
    );

    //Fetch data from the backup Api
    final backupResponse = await _fetchFromBackupApi(
      lon: _lon,
      lat: _lat,
      clientRef: _backupApiClient,
    );

    //If the main api responds positively, send data to bloc
    if (mainResponse.isSuccessful) {
      if (mainResponse.body != null) return Future.value(mainResponse.body);
    }

    //if the main Api fails, send data from the backup Api.
    if (!mainResponse.isSuccessful && backupResponse.isSuccessful) {
      if (backupResponse.body != null) return Future.value(backupResponse.body);
    }

    //If both fails, throw an exception.
    throw ApiFailureException();
  }
}
