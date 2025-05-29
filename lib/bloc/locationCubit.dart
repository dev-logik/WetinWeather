import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloc_app/models/geographic_coordinate.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../services/services.dart';

class LocationState {
  final String locationName;
  Exception exceptionOb = Exception('Default');
  LocationState({required this.locationName});
}

class LocationCubit extends Cubit<LocationState> {
  LocationCubit(super.initialState);
  GeographicCoordinateModel? _positionObj;
  String? _locationName;

  Future<void> startLocationService() async {
    await _updateLocation();
  }

  Future<void> _updateLocation() async {
    try {
      _positionObj = await LocationService.determinePositionInCodes();

      if (_positionObj != null) {
        _locationName = await LocationService.determineLocationName(
          _positionObj!,
          LocationDisplayStyleOptions.CITY,
        );
        emit(LocationState(locationName: _locationName ?? ''));
      } else {
        throw Exception('Location Service Failed For The Current Location.');
      }
    } catch (exception) {
      debugPrint(exception.toString());

      await Fluttertoast.showToast(
        msg: exception.toString(),
        backgroundColor: Colors.redAccent,
        textColor: Colors.white,
        gravity: ToastGravity.SNACKBAR,
        fontSize: 14.sp,
      );
    }
  }
}
