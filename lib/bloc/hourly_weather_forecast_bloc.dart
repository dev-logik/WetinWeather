import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';

import '../data/repositories/repositories.dart';
import '../models/models.dart';
import '../utilities/utilities.dart';

//Defines UI events that will trigger the api calls and state changes.
sealed class HourlyForecastEvent {}

class LoadInitialHourlyWeatherForecastEvent extends HourlyForecastEvent {}

class PullToRefreshHourlyWeatherEvent extends HourlyForecastEvent {}

class StreamHourlyForecastEvent extends HourlyForecastEvent {}

//Defines the different states of the weather data
sealed class HourlyForecastStates {}

class HourlyWeatherForecastInit extends HourlyForecastStates {}

class HourlyWeatherForecastLoadingInProgress extends HourlyForecastStates {}

class HourlyWeatherForecastLoadSuccess extends HourlyForecastStates {
  final Success<HourlyForecasts> data;

  HourlyWeatherForecastLoadSuccess(this.data);
}

class HourlyWeatherForecastLoadFailure extends HourlyForecastStates {
  final Exception errObj;

  HourlyWeatherForecastLoadFailure(this.errObj);
}

class HourlyWeatherForecastDataBloc
    extends Bloc<HourlyForecastEvent, HourlyForecastStates> {
  late final HourlyWeatherForecastRepository _hourlyWeatherRepository;
  Timer? _timer;

  HourlyWeatherForecastDataBloc(this._hourlyWeatherRepository)
    : super(HourlyWeatherForecastInit()) {
    on<LoadInitialHourlyWeatherForecastEvent>(_onInitialDataEvent);

    on<PullToRefreshHourlyWeatherEvent>(_onInitialDataEvent);

    on<StreamHourlyForecastEvent>(_onDataStreamEvent);

    add(LoadInitialHourlyWeatherForecastEvent());
    //add(StreamWeatherDataEvent());
  }

  FutureOr<void> _onDataStreamEvent(event, emit) async {
    _timer = Timer.periodic(Duration(minutes: 30), (timer) async {
      try {
        emit(HourlyWeatherForecastLoadingInProgress());
        final weatherForecastData =
            await _hourlyWeatherRepository.fetchDataWithBackup();
        if (weatherForecastData is Success<HourlyForecasts>) {
          emit(HourlyWeatherForecastLoadSuccess(weatherForecastData));
        }
      } catch (ex) {
        emit(HourlyWeatherForecastLoadFailure(ex as Exception));
      }
    });
  }

  FutureOr<void> _onInitialDataEvent(event, emit) async {
    try {
      emit(HourlyWeatherForecastLoadingInProgress());
      final weatherForecastData =
          await _hourlyWeatherRepository.fetchDataWithBackup();
      if (weatherForecastData is Success<HourlyForecasts>) {
        emit(HourlyWeatherForecastLoadSuccess(weatherForecastData));
      }
    } on NoSuchMethodError catch (e) {
      debugPrint(e.toString());
    } catch (ex) {
      debugPrint('Error: ${ex.toString()}');
      emit(HourlyWeatherForecastLoadFailure(ex as Exception));
    }
  }

  @override
  Future<void> close() {
    _timer?.cancel();
    return super.close();
  }
}
