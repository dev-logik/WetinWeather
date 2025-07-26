import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloc_app/models/geographic_coordinate.dart';
import 'package:bloc_app/utilities/utilities.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../services/services.dart';

class LocationState {
  final String? locationName;
  Exception exceptionOb = Exception('Default');

  LocationState({this.locationName});
}

class LocationCubit extends Cubit<LocationState> {
  LocationCubit(super.initialState);

  GeographicCoordinateModel? _positionObj;
  String? _locationName;

  Future<void> startLocationService({
    LocationDisplayStyleOptions locationStyleOption =
        LocationDisplayStyleOptions.CITY,
  }) async {
    await _updateLocation(locationStyleOption: locationStyleOption);
  }

  Future<void> _updateLocation({
    required LocationDisplayStyleOptions locationStyleOption,
  }) async {
    try {
      await _fetchLocation(locationStyleOption);
    } catch (exception) {
      debugPrint(exception.toString());
      await Fluttertoast.showToast(
        msg: ErrorHelpers.getFriendlyError(exception),
        backgroundColor: Colors.redAccent,
        textColor: Colors.white,
        gravity: ToastGravity.SNACKBAR,
        fontSize: 14.sp,
      );
    }
  }

  //Fetches the location.
  Future<void> _fetchLocation(
    LocationDisplayStyleOptions locationStyleOption,
  ) async {
    _positionObj = await LocationService.determinePositionInCodes();

    if (_positionObj != null) {
      _locationName = await LocationService.determineLocationName(
        positionModel: _positionObj!,
        style: locationStyleOption,
      );
      emit(LocationState(locationName: _locationName));
    } else {
      throw LocationServiceFailed();
    }
  }
}
