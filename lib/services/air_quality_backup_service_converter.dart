import 'dart:async';
import 'dart:convert';
import 'dart:io' show HttpException, SocketException;

import 'package:chopper/chopper.dart';

import '../models/models.dart';

class AirQualityConverterForBackupApi implements Converter {
  @override
  Request convertRequest(Request request) {
    return request.copyWith(body: jsonEncode(request));
  }

  @override
  FutureOr<Response<BodyType>> convertResponse<BodyType, InnerType>(
    Response response,
  ) async {
    try {
      //If the response is not successful, throw an exception.
      if (!response.isSuccessful) {
        throw HttpException(
          'Request failed with status: ${response.statusCode}',
        );
      }

      //Decode the response.
      final decoded = await jsonDecode(response.body) as BodyType;

      //Throw an exception if the decoded object is not a map.
      if (decoded is! Map<String, dynamic>) {
        throw FormatException('Invalid response format');
      }

      //If the response map contains a 'status' key with a value other than 'ok', throw an exception.
      if (decoded['status'] != "ok") {
        throw HttpException(decoded['data'] ?? 'API returned error status');
      }

      //Get the value associated with the subkey 'iaqi'.
      final pollutantsData = decoded["data"]["iaqi"] as Map<String, dynamic>;

      //Define and empty list of pollutants.
      final pollutants = <CurrentPollutantModel>[];

      //Build the list
      for (var entry in pollutantsData.entries) {
        var pollutant = _mapPollutantEntry(entry);
        if (pollutant != null) {
          pollutants.add(pollutant);
        }
      }

      if (pollutants.isEmpty) {
        throw FormatException('No valid pollutant data found');
      }

      if (pollutants is String) {
        throw FormatException('No valid pollutant data found');
      }
      return response.copyWith(
        base: response.base,
        body: Success<List<CurrentPollutantModel>>(pollutants) as BodyType,
      );
    } on SocketException {
      return _errorResponse(response, 'No internet connection');
    } on TimeoutException {
      return _errorResponse(response, 'Request timed out');
    } on HttpException catch (e) {
      return _errorResponse(response, e.message);
    } catch (e) {
      return _errorResponse(response, 'Unknown error: ${e.toString()}');
    }
  }

  CurrentPollutantModel? _mapPollutantEntry(MapEntry<String, dynamic> entry) {
    final key = entry.key;
    final value = entry.value;

    if (value is! Map<String, dynamic> || !value.containsKey('v')) {
      return null;
    }

    final concentration = (value['v'] as num).toDouble();

    if (key == 'pm25') {
      return CurrentPollutantModel(
        pollutantName: 'Fine PM',
        pollutantSymbol: 'PM25',
        pollutantConcentration: concentration,
      );
    }
    if (key == 'pm10') {
      return CurrentPollutantModel(
        pollutantName: 'Coarse PM',
        pollutantSymbol: 'PM10',
        pollutantConcentration: concentration,
      );
    }

    if (key == 'co') {
      return CurrentPollutantModel(
        pollutantName: 'CO Gas',
        pollutantSymbol: 'CO',
        pollutantConcentration: concentration,
      );
    }
    if (key == 'so2') {
      return CurrentPollutantModel(
        pollutantName: 'Sulfur Dioxide',
        pollutantSymbol: 'SO₂',
        pollutantConcentration: concentration,
      );
    }
    if (key == 'no2') {
      return CurrentPollutantModel(
        pollutantName: 'Nitrogen Dioxide',
        pollutantSymbol: 'NO₂',
        pollutantConcentration: concentration,
      );
    }
    if (key == 'o3') {
      return CurrentPollutantModel(
        pollutantName: 'Ozone',
        pollutantSymbol: 'O₃',
        pollutantConcentration: concentration,
      );
    }
    if (key == 'dew' ||
        key == 'w' ||
        key == 'h' ||
        key == 't' ||
        key == 'wg' ||
        key == 'p') {
      return null;
    }
    return null;
  }

  Response<BodyType> _errorResponse<BodyType>(
    Response response,
    String message,
  ) {
    return response.copyWith(
      bodyError: Error(Exception('$message')),
      body: Error(Exception('$message')) as BodyType,
    );
  }
}
