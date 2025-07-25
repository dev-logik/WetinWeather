import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:chopper/chopper.dart';

import '../models/models.dart';
import '../utilities/utilities.dart';

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
      final decodedRes =
          await jsonDecode(response.body) as Map<String, dynamic>;

      if (decodedRes.containsKey('current')) {
        //Get a sub-map of the decoded response that contains the data and the units of the data.
        final currentData = decodedRes['current'] as JsonMap;
        final currentDataUnits = decodedRes['current_units'] as JsonMap;

        //Extract the required data
        for (var dataEntry in currentData.entries) {
          //Build the weather object.
          var _data = _parseCurrentWeatherJsonData(dataEntry, currentDataUnits);

          //Add it to the list, if the data is valid.
          if (_data != null) {
            weatherVariables.add(_data);
          }
        }

        //If no data is converted, throw an exception.
        if (weatherVariables.isEmpty) {
          throw FormatException('No valid weather data found');
        }
        //Respond with the actual object.
        return Future.value(
          response.copyWith(
            body:
                Success<List<CurrentWeatherVariableModel>>(weatherVariables)
                    as BodyType,
          ),
        );
      }

      if (decodedRes.containsKey('hourly')) {
        final hourlyData = decodedRes['hourly'] as JsonMap;
        //final hourlyDataUnits = decodedRes['hourly_unit'] as JsonMap;
        final hourlyForecasts = _buildHourlyForecasts(hourlyData);
        //If no data is converted, throw an exception.
        if (hourlyForecasts.isEmpty) {
          throw FormatException('No valid weather data found');
        }
        //Respond with the actual object.
        return Future.value(
          response.copyWith(
            body: Success<HourlyForecasts>(hourlyForecasts) as BodyType,
          ),
        );
      }

      //If the decoded response doesn't have the "current" key, throw an exception.
      throw HttpException('Check the base url and endpoint for debugging');
    } on SocketException {
      return _errorResponse(response, 'No internet connection');
    } on TimeoutException {
      return _errorResponse(response, 'Request timed out');
    } on HttpException catch (e) {
      return _errorResponse(response, e.message);
    }
    // } catch (e) {
    //   return _errorResponse(response, 'Unknown error: ${e.toString()}');
    // }
  }

  HourlyForecasts _buildHourlyForecasts(JsonMap hourlyData) {
    final timeData = hourlyData['time'] as List<dynamic>;
    final tempData = hourlyData['temperature_2m'] as List<dynamic>;
    final humidityData = hourlyData['relative_humidity_2m'] as List<dynamic>;
    final dewPointData = hourlyData['dew_point_2m'] as List<dynamic>;
    final realFeelData = hourlyData['apparent_temperature'] as List<dynamic>;
    final precProbData =
        hourlyData['precipitation_probability'] as List<dynamic>;
    final precipitationData = hourlyData['precipitation'] as List<dynamic>;
    final rainData = hourlyData['rain'] as List<dynamic>;
    final showersData = hourlyData['showers'] as List<dynamic>;
    final snowFallData = hourlyData['snowfall'] as List<dynamic>;
    final weatherCodeData = hourlyData['weather_code'] as List<dynamic>;
    final cloudCoverData = hourlyData['cloud_cover'] as List<dynamic>;
    final windSpeedData = hourlyData['wind_speed_10m'] as List<dynamic>;
    final windDirectionData = hourlyData['wind_direction_10m'] as List<dynamic>;

    final weatherLen = timeData.length;

    return List.generate(
      weatherLen,
      (index) => HourlyWeatherForecastModel(
        relativeHumidity: humidityData[index],
        temperature: tempData[index],
        cloudCover: cloudCoverData[index],
        dewPoint: dewPointData[index],
        precipitation: precipitationData[index],
        precipitationProb: precProbData[index],
        rain: rainData[index],
        realFeel: realFeelData[index],
        showers: showersData[index],
        snowFall: snowFallData[index],
        time: timeData[index],
        weatherCode: weatherCodeData[index],
        windDirection: windDirectionData[index],
        windSpeed: windSpeedData[index],
      ),
    );
  }

  Response<BodyType> _errorResponse<BodyType>(
    Response response,
    String message,
  ) {
    return response.copyWith(bodyError: Error(Exception('$message')));
  }

  //Build the required object, based on the json data received.
  CurrentWeatherVariableModel? _parseCurrentWeatherJsonData(
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
