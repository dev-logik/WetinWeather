import 'dart:async';
import 'dart:io';

import 'package:bloc_app/models/air_quality_pollutant_model.dart';
import 'package:chopper/chopper.dart';

class AirQualityServiceTwoConverter extends JsonConverter {
  @override
  Request convertRequest(Request request) {
    return super.convertRequest(request);
  }

  @override
  FutureOr<Response<BodyType>> convertResponse<BodyType, InnerType>(
    Response response,
  ) async {
    final List<AirQualityPollutantModel> _pollutants = [];
    String? pollutantName;
    String? pollutantSymbol;
    double? pollutantConcentration;
    try {
      //If the response is a success, then needs conversion.
      if (response.isSuccessful) {
        Map<String, dynamic> pollutantData;
        //Decode the json to Map;
        final decodedRes = await super.convertResponse(response);
        //Get the Map
        pollutantData = decodedRes.body as Map<String, dynamic>;
        //Filters the map for the specific data we need.
        if (pollutantData.containsKey('current')) {
          //Build the object the will store the data from the filtered pollutant data.
          pollutantData = pollutantData['current'];
          _pollutants.clear();
          _buildPollutantList(
            pollutantData,
            pollutantName,
            pollutantSymbol,
            pollutantConcentration,
            _pollutants,
          );
          return (response.copyWith(
            base: response.base,
            body: _pollutants as BodyType,
          ));
        }
      }

      //Do this if the response isn't a success.
      if (!response.isSuccessful) {
        throw HttpException(
          'Your request cannot be processed: ${response.statusCode}',
        );
      }
    } catch (e) {
      return response.copyWith(
        base: response.base,
        body: e as BodyType,
        bodyError: e.toString(),
      );
    }
    //Return not found if the response is incorrect.
    return Response(response.base, response.body as BodyType);
  }

  //Build the list which contains the data of interest.
  void _buildPollutantList(
    Map<String, dynamic> pollutantData,
    String? pollutantName,
    String? pollutantSymbol,
    double? pollutantConcentration,
    List<AirQualityPollutantModel> _pollutants,
  ) {
    for (var pollutantEntry in pollutantData.entries) {
      if (pollutantEntry.key.trim() == 'pm10') {
        pollutantName = ' (Particles < 10µm)';
        pollutantSymbol = 'PM10';
        pollutantConcentration = pollutantEntry.value as double;
      }
      if (pollutantEntry.key.trim() == 'pm2_5') {
        pollutantName = ' (Particles < 2.5µm)';
        pollutantSymbol = 'PM25';
        pollutantConcentration = pollutantEntry.value as double;
      }
      if (pollutantEntry.key.trim() == 'carbon_monoxide') {
        pollutantName = ' (Carbon Monoxide)';
        pollutantSymbol = 'CO';
        pollutantConcentration = pollutantEntry.value as double;
      }
      if (pollutantEntry.key.trim() == 'sulphur_dioxide') {
        pollutantName = ' (Sulphur Dioxide)';
        pollutantSymbol = 'SO₂';
        pollutantConcentration = pollutantEntry.value as double;
      }
      if (pollutantEntry.key.trim() == 'nitrogen_dioxide') {
        pollutantName = ' (Nitrogen Dioxide)';
        pollutantSymbol = 'NO₂';
        pollutantConcentration = pollutantEntry.value as double;
      }
      if (pollutantEntry.key.trim() == 'ozone') {
        pollutantName = ' (Ozone)';
        pollutantSymbol = 'O₃';
        pollutantConcentration = pollutantEntry.value as double;
      }

      if (pollutantEntry.key == 'time' || pollutantEntry.key == 'interval') {
        continue;
      }

      _pollutants.add(
        AirQualityPollutantModel(
          pollutantName: pollutantName ?? '',
          pollutantConcentration: pollutantConcentration ?? 0.0,
          pollutantSymbol: pollutantSymbol ?? '',
        ),
      );
    }
  }
}
