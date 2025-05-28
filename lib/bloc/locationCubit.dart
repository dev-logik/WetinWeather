import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloc_app/models/geographic_coordinate.dart';
import 'package:flutter/cupertino.dart';

import '../services/services.dart';

class LocationState {
  final String locationName;
  LocationState({required this.locationName});
}

class LocationCubit extends Cubit<LocationState> {
  LocationCubit(super.initialState);
  Timer? _timer;
  GeographicCoordinateModel? _positionObj;
  String? _locationName;

  Future<void> startLocationService() async {
    _timer?.cancel();
    await _updateLocation();
  }

  Future<void> _updateLocation() async {
    try {
      _positionObj = await LocationService.determinePositionInCodes();
      _locationName = await LocationService.determineLocationName(
        _positionObj!,
        LocationDisplayStyleOptions.CITY,
      );
      emit(LocationState(locationName: _locationName ?? ''));
    } catch (exception) {
      debugPrint("ERROR -> ${exception}");
    }
  }

  Future<void> dispose() async {
    _timer?.cancel();
  }
}
