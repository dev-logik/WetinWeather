import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:bloc_app/models/weather_forecast_model_new.dart';
import 'package:chopper/chopper.dart';

class MainWeatherServiceConverter implements Converter {
  @override
  FutureOr<Request> convertRequest(Request request) {
    final encodedRequest = jsonEncode(request.body);
    return request.copyWith(body: encodedRequest);
  }

  @override
  FutureOr<Response<BodyType>> convertResponse<BodyType, InnerType>(
    Response response,
  ) async {
    final weatherVariables = <WeatherForecastVariableModel>[];
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
          decodedResponse['current_units'] as Map<String, String>;

      //Extract the required data
      for (var dataEntry in currentData.entries) {
        //Work with a fresh list.
        if (weatherVariables.isNotEmpty) {
          weatherVariables.clear();
        }

        //Build the weather object.
        final _data = _parseJsonData(dataEntry, currentDataUnits);

        //Add it to the list, if the data is valid.
        if (_data != null) {
          weatherVariables.add(_data);
        }
      }

      //Respond with the actual object.
      return response.copyWith(
        base: response.base,
        body: weatherVariables as BodyType,
        bodyError: response.error,
      );
    } on SocketException {
      return response.copyWith(
        base: response.base,
        bodyError: response.error as Exception,
      );
    } on TimeoutException {
      return response.copyWith(
        base: response.base,
        bodyError: response.error as Exception,
      );
    } on HttpException {
      return response.copyWith(
        base: response.base,
        bodyError: response.error as Exception,
      );
    } catch (ex) {
      return response.copyWith(base: response.base, bodyError: ex as Exception);
    }
  }

  //Build the required object, based on the json data received.
  WeatherForecastVariableModel? _parseJsonData(
    MapEntry<String, dynamic> mapEntry,
    Map<String, dynamic> dataUnits,
  ) {
    final entryKey = mapEntry.key;
    final entryValue = (mapEntry.value as num).toDouble();
    switch (entryKey) {
      case 'temperature_2m':
        return WeatherForecastVariableModel(
          jsonName: entryKey,
          displayName: 'Temp.',
          unit: dataUnits[entryKey],
          value: entryValue,
        );
      case 'relative_humidity_2m':
        return WeatherForecastVariableModel(
          jsonName: entryKey,
          displayName: 'Humidity',
          unit: dataUnits[entryKey],
          value: entryValue,
        );
      case 'apparent_temperature':
        return WeatherForecastVariableModel(
          jsonName: entryKey,
          displayName: 'Reel Feel',
          unit: dataUnits[entryKey],
          value: entryValue,
        );
      case 'is_day':
        return WeatherForecastVariableModel(
          jsonName: entryKey,
          displayName: 'Is it day?',
          unit: dataUnits[entryKey],
          value: entryValue,
        );
      case 'precipitation':
        return WeatherForecastVariableModel(
          jsonName: entryKey,
          displayName: 'Precipitation',
          unit: dataUnits[entryKey],
          value: entryValue,
        );
      case 'wind_speed_10m':
        return WeatherForecastVariableModel(
          jsonName: entryKey,
          displayName: 'Wind Speed',
          unit: dataUnits[entryKey],
          value: entryValue,
        );
      case 'wind_direction_10m':
        return WeatherForecastVariableModel(
          jsonName: entryKey,
          displayName: 'Wind Direction',
          unit: dataUnits[entryKey],
          value: entryValue,
        );
      case 'weather_code':
        return WeatherForecastVariableModel(
          jsonName: entryKey,
          displayName: 'Weather',
          unit: dataUnits[entryKey],
          value: entryValue,
        );
      case 'rain':
        return WeatherForecastVariableModel(
          jsonName: entryKey,
          displayName: 'Rain',
          unit: dataUnits[entryKey],
          value: entryValue,
        );
      case 'showers':
        return WeatherForecastVariableModel(
          jsonName: entryKey,
          displayName: 'Showers',
          unit: dataUnits[entryKey],
          value: entryValue,
        );
      case 'snowfall':
        return WeatherForecastVariableModel(
          jsonName: entryKey,
          displayName: 'Snowfall',
          unit: dataUnits[entryKey],
          value: entryValue,
        );
      case 'cloud_cover':
        return WeatherForecastVariableModel(
          jsonName: entryKey,
          displayName: 'Wind Direction',
          unit: dataUnits[entryKey],
          value: entryValue,
        );
      case 'interval':
      case 'time':
        return null;
      default:
        return null;
    }
  }
}
