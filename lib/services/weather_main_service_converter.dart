import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:chopper/chopper.dart';
import 'package:flutter/cupertino.dart';

import '../models/models.dart';

class MainWeatherServiceConverter implements Converter {
  @override
  FutureOr<Request> convertRequest(Request request) {
    final contentType = request.headers[contentTypeKey];
    if (contentType != null && contentType.contains(jsonHeaders)) {
      final encodedRequest = jsonEncode(request.body);
      request = applyHeader(
        request.copyWith(body: encodedRequest),
        contentType,
        jsonHeaders,
      );
      return request;
    }
    return Future.value(request.copyWith(body: request.body));
  }

  @override
  FutureOr<Response<BodyType>> convertResponse<BodyType, InnerType>(
    Response response,
  ) async {
    final weatherVariables = <CurrentWeatherVariableModel>[];
    try {
      //If response isn't successful, throw an exception.
      if (!response.isSuccessful) {
        throw HttpException(
          'Request failed with status: ${response.statusCode}',
        );
      }

      //Decode the response body
      final decodedResponse =
          await jsonDecode(response.body) as Map<String, dynamic>;

      //If the decoded response doesn't have the "current" key, throw an exception.
      if (!decodedResponse.containsKey('current')) {
        throw HttpException('Check the base url and endpoint for debugging');
      }

      //Get a sub-map of the decoded response that contains the data and the units of the data.
      final currentData = decodedResponse['current'] as Map<String, dynamic>;
      final currentDataUnits =
          decodedResponse['current_units'] as Map<String, dynamic>;

      //Extract the required data
      for (var dataEntry in currentData.entries) {
        //Build the weather object.
        var _data = _parseJsonData(dataEntry, currentDataUnits);

        //Add it to the list, if the data is valid.
        if (_data != null) {
          weatherVariables.add(_data);
        }
      }

      //If no data is converted, throw an exception.
      if (weatherVariables.isEmpty) {
        throw FormatException('No valid pollutant data found');
      }
      debugPrint("DATA" + weatherVariables.toString());
      //Respond with the actual object.
      return Future.value(
        response.copyWith(
          body:
              Success<List<CurrentWeatherVariableModel>>(weatherVariables)
                  as BodyType,
        ),
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

  Response<BodyType> _errorResponse<BodyType>(
    Response response,
    String message,
  ) {
    return response.copyWith(bodyError: Error(Exception('$message')));
  }

  //Build the required object, based on the json data received.
  CurrentWeatherVariableModel? _parseJsonData(
    MapEntry<String, dynamic> mapEntry,
    Map<String, dynamic> dataUnits,
  ) {
    final entryKey = mapEntry.key;
    switch (entryKey) {
      case 'temperature_2m':
        return CurrentWeatherVariableModel(
          jsonName: entryKey,
          displayName: 'Temp.',
          unit: dataUnits[entryKey],
          value: mapEntry.value as double,
        );
      case 'relative_humidity_2m':
        return CurrentWeatherVariableModel(
          jsonName: entryKey,
          displayName: 'Humidity',
          unit: dataUnits[entryKey],
          value: (mapEntry.value as int).toDouble(),
        );
      case 'apparent_temperature':
        return CurrentWeatherVariableModel(
          jsonName: entryKey,
          displayName: 'Reel Feel',
          unit: dataUnits[entryKey],
          value: mapEntry.value as double,
        );
      case 'is_day':
        return CurrentWeatherVariableModel(
          jsonName: entryKey,
          displayName: 'Is it day?',
          unit: dataUnits[entryKey],
          value: (mapEntry.value as int),
        );
      case 'precipitation':
        return CurrentWeatherVariableModel(
          jsonName: entryKey,
          displayName: 'Precipitation',
          unit: dataUnits[entryKey],
          value: mapEntry.value as double,
        );
      case 'wind_speed_10m':
        return CurrentWeatherVariableModel(
          jsonName: entryKey,
          displayName: 'Wind Speed',
          unit: dataUnits[entryKey],
          value: mapEntry.value as double,
        );
      case 'wind_direction_10m':
        return CurrentWeatherVariableModel(
          jsonName: entryKey,
          displayName: 'Wind Vector',
          unit: dataUnits[entryKey],
          value: (mapEntry.value as int),
        );
      case 'weather_code':
        return CurrentWeatherVariableModel(
          jsonName: entryKey,
          displayName: 'Weather',
          unit: dataUnits[entryKey],
          value: (mapEntry.value as int),
        );
      case 'rain':
        return CurrentWeatherVariableModel(
          jsonName: entryKey,
          displayName: 'Rain',
          unit: dataUnits[entryKey],
          value: mapEntry.value as double,
        );
      case 'showers':
        return CurrentWeatherVariableModel(
          jsonName: entryKey,
          displayName: 'Showers',
          unit: dataUnits[entryKey],
          value: mapEntry.value as double,
        );
      case 'snowfall':
        return CurrentWeatherVariableModel(
          jsonName: entryKey,
          displayName: 'Snowfall',
          unit: dataUnits[entryKey],
          value: mapEntry.value as double,
        );
      case 'cloud_cover':
        return CurrentWeatherVariableModel(
          jsonName: entryKey,
          displayName: 'Cloud Cover',
          unit: dataUnits[entryKey],
          value: (mapEntry.value as int),
        );
      case 'interval':
      case 'time':
        return null;
      default:
        return null;
    }
  }
}
