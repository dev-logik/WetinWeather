import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:chopper/chopper.dart';

import '../models/air_quality_pollutant_model.dart';

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
      if (!response.isSuccessful) {
        throw HttpException(
          'Request failed with status ${response.statusCode}',
        );
      }

      final decoded = await jsonDecode(response.body) as BodyType;

      if (decoded is! Map<String, dynamic>) {
        throw FormatException('Invalid response format');
      }

      if (!decoded.containsKey('current')) {
        throw FormatException('Missing "current" field in response');
      }

      final currentData = decoded['current'] as Map<String, dynamic>;
      final pollutants = _parsePollutants(currentData);

      if (pollutants.isEmpty) {
        throw FormatException('No valid pollutant data found');
      }

      return response.copyWith(body: pollutants as BodyType);
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

  List<AirQualityPollutantModel> _parsePollutants(
    Map<String, dynamic> currentData,
  ) {
    final pollutants = <AirQualityPollutantModel>[];

    currentData.forEach((key, value) {
      final pollutant = _mapPollutant(key, value);
      if (pollutant != null) {
        pollutants.add(pollutant);
      }
    });

    return pollutants;
  }

  AirQualityPollutantModel? _mapPollutant(String key, dynamic value) {
    if (value is! num) return null;

    final concentration = value.toDouble();

    switch (key) {
      case 'pm10':
        return AirQualityPollutantModel(
          pollutantName: ' Coarse PM',
          pollutantSymbol: 'PM10',
          pollutantConcentration: concentration,
        );
      case 'pm2_5':
        return AirQualityPollutantModel(
          pollutantName: ' Fine PM',
          pollutantSymbol: 'PM25',
          pollutantConcentration: concentration,
        );
      case 'carbon_monoxide':
        return AirQualityPollutantModel(
          pollutantName: ' CO Gas',
          pollutantSymbol: 'CO',
          pollutantConcentration: concentration,
        );
      case 'sulphur_dioxide':
        return AirQualityPollutantModel(
          pollutantName: ' Sulfur Dioxide',
          pollutantSymbol: 'SO₂',
          pollutantConcentration: concentration,
        );
      case 'nitrogen_dioxide':
        return AirQualityPollutantModel(
          pollutantName: ' Nitrogen Dioxide',
          pollutantSymbol: 'NO₂',
          pollutantConcentration: concentration,
        );
      case 'ozone':
        return AirQualityPollutantModel(
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
    return response.copyWith(bodyError: message, body: message as BodyType);
  }
}
