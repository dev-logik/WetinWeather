import 'package:bloc_app/models/geographic_coordinate.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

enum LocationDisplayStyleOptions {
  CITY,
  CITY_COUNTRY,
  STATE_COUNTRY,
  CITY_STATE_COUNTRY,
}

class LocationService {
  LocationService._();

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
        accuracy: LocationAccuracy.best,
        distanceFilter: 100,
      ),
    );

    return GeographicCoordinateModel.fromPosition(position);
  }

  static Future<String> determineLocationName(
    GeographicCoordinateModel positionModel,
    LocationDisplayStyleOptions style,
  ) async {
    final double longitude = positionModel.longitude;
    final double latitude = positionModel.latitude;
    String strResult;
    Placemark placemark;
    List<Placemark> placemarks = await placemarkFromCoordinates(
      latitude,
      longitude,
    );
    placemark = placemarks[0];
    switch (style) {
      case LocationDisplayStyleOptions.CITY:
        strResult = placemark.locality ?? '';
        break;
      case LocationDisplayStyleOptions.CITY_COUNTRY:
        strResult = '${placemark.locality ?? ''}, ${placemark.country ?? ''}';
        break;
      case LocationDisplayStyleOptions.STATE_COUNTRY:
        strResult =
            "${placemark.administrativeArea ?? ''}, ${placemark.country ?? ''}";
      case LocationDisplayStyleOptions.CITY_STATE_COUNTRY:
        strResult =
            "${placemark.locality ?? ''}, ${placemark.administrativeArea ?? ''}, ${placemark.country ?? ''}";
        break;
    }
    return strResult;
  }
}
