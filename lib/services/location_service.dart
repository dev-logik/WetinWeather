import 'package:bloc_app/models/geographic_coordinate.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

import '../utilities/utilities.dart';

enum LocationDisplayStyleOptions {
  CITY,
  CITY_COUNTRY,
  STATE_COUNTRY,
  CITY_STATE_COUNTRY,
}

abstract class LocationService {
  static Future<GeographicCoordinateModel> determinePositionInCodes() async {
    bool serviceEnabled;
    LocationPermission permission;
    Position position;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();

    if (!serviceEnabled) {
      return Future.error('Location Services are disabled.');
    }

    permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        Future.error('Location permissions were denied.');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      Future.error(
        'Location permissions are permanently denied, we cannot request permissions.',
      );
    }

    position = await Geolocator.getCurrentPosition(
      locationSettings: LocationSettings(
        accuracy: LocationAccuracy.medium,
        distanceFilter: 100,
      ),
    );

    return GeographicCoordinateModel.fromPosition(position);
  }

  static Future<String> determineLocationName({
    required GeographicCoordinateModel positionModel,
    LocationDisplayStyleOptions style = LocationDisplayStyleOptions.CITY,
  }) async {
    final double longitude = positionModel.longitude;
    final double latitude = positionModel.latitude;

    String strResult;
    Placemark placemark;

    List<Placemark> placemarks = await placemarkFromCoordinates(
      latitude,
      longitude,
    );

    if (placemarks.isEmpty) {
      Future.error('No placemark found for the given coordinates');
    }

    placemark = placemarks[0];

    strResult = locationDisplayStyle(placemark: placemark, option: style);

    return strResult;
  }
}
