import 'package:bloc_app/data/repositories/repository.dart';
import 'package:bloc_app/models/weather_forecast_model_new.dart';
import 'package:bloc_app/services/weather_main_service_converter.dart';
import 'package:chopper/chopper.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import '../../services/services.dart';

final ChopperClient _mainClient = ChopperClient(
  baseUrl: Uri.parse(dotenv.env[''] as String),
  converter: MainWeatherServiceConverter(),
  services: [MainWeatherService.create()],
);

class WeatherRepository implements Repository {
  @override
  Future<dynamic> fetchDataWithBackup() async {
    //Fetch the location data.
    final locationData = await LocationService.determinePositionInCodes();
    final _lon = locationData.longitude;
    final _lat = locationData.latitude;

    //Get the service object.
    final mainWeatherService = MainWeatherService.create(_mainClient);

    //Responsible for fetching the data from the main API.
    Future<Response<dynamic>> _fetchDataFromMainApi() async {
      final response = await mainWeatherService.getCurrentWeatherDetails(
        lat: _lat,
        lon: _lon,
      );
      return Future.value(response);
    }

    //Response from the main.
    final responseMain = _fetchDataFromMainApi() as Response<dynamic>;

    //If the response is unsuccessful, throw an exception.
    if (!responseMain.isSuccessful) {
      return Future.error(responseMain.error as Exception);
    }

    //Return the data if it's a success.
    return Future.value(
      responseMain.body as List<WeatherForecastVariableModel>,
    );
  }
}
