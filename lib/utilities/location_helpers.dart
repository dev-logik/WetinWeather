import 'package:geocoding/geocoding.dart';

import '../services/services.dart';

String locationDisplayStyle({
  required LocationDisplayStyleOptions option,
  required Placemark placemark,
}) {
  String strResult;
  switch (option) {
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
