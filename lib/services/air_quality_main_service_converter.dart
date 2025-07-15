import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:bloc_app/models/response_model.dart';
import 'package:chopper/chopper.dart';

import '../models/current_pollutant_model.dart';

class AirQualityConverterForMainApi implements Converter {
  @override
  Request convertRequest(Request request) {
    return request.copyWith(body: jsonEncode(request));
  }

  @override
  FutureOr<Response<BodyType>> convertResponse<BodyType, InnerType>(
    Response response,
  ) async {
    try {
      //if  response isn't a success, throw an exception.
      if (!response.isSuccessful) {
        throw HttpException(
          'Request failed with status ${response.statusCode}',
        );
      }

      //Decode the data.
      final decoded = await jsonDecode(response.body) as Map<String, dynamic>;

      //if doesn't have the following field, throw an exception.
      if (!decoded.containsKey('current')) {
        throw FormatException('Missing "current" field in response');
      }

      //Get the required data raw.
      final currentData = decoded['current'] as Map<String, dynamic>;

      //Get convert the data into a model
      final pollutants = _parsePollutants(currentData);

      if (pollutants.isEmpty) {
        throw FormatException('No valid pollutant data found');
      }

      return response.copyWith(
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

  List<CurrentPollutantModel> _parsePollutants(
    Map<String, dynamic> currentData,
  ) {
    final pollutants = <CurrentPollutantModel>[];

    currentData.forEach((key, value) {
      final pollutant = _mapPollutant(key, value);
      if (pollutant != null) {
        pollutants.add(pollutant);
      }
    });

    return pollutants;
  }

  CurrentPollutantModel? _mapPollutant(String key, dynamic value) {
    if (value is! num) return null;

    final concentration = value.toDouble();

    switch (key) {
      case 'pm10':
        return CurrentPollutantModel(
          pollutantName: ' Coarse PM',
          pollutantSymbol: 'PM10',
          pollutantConcentration: concentration,
        );
      case 'pm2_5':
        return CurrentPollutantModel(
          pollutantName: ' Fine PM',
          pollutantSymbol: 'PM25',
          pollutantConcentration: concentration,
        );
      case 'carbon_monoxide':
        return CurrentPollutantModel(
          pollutantName: ' CO Gas',
          pollutantSymbol: 'CO',
          pollutantConcentration: concentration,
        );
      case 'sulphur_dioxide':
        return CurrentPollutantModel(
          pollutantName: ' Sulfur Dioxide',
          pollutantSymbol: 'SO₂',
          pollutantConcentration: concentration,
        );
      case 'nitrogen_dioxide':
        return CurrentPollutantModel(
          pollutantName: ' Nitrogen Dioxide',
          pollutantSymbol: 'NO₂',
          pollutantConcentration: concentration,
        );
      case 'ozone':
        return CurrentPollutantModel(
          pollutantName: ' Ozone',
          pollutantSymbol: 'O₃',
          pollutantConcentration: concentration,
        );
      case 'time':
      case 'interval':
        return null;
      default:
        return null;
    }
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
