import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloc_app/data/repositories/repositories.dart';
import 'package:bloc_app/models/models.dart';
import 'package:flutter/cupertino.dart';

//Defines UI events that will trigger the api calls and state changes.
sealed class WeatherEvent {}

class LoadInitialWeatherDataEvent extends WeatherEvent {}

class PullToRefreshWeatherEvent extends WeatherEvent {}

class StreamWeatherDataEvent extends WeatherEvent {}

//Defines the different states of the weather data
sealed class WeatherDataStates {}

class WeatherDataInitial extends WeatherDataStates {}

class WeatherDataLoadingInProgress extends WeatherDataStates {}

class WeatherDataLoadSuccess extends WeatherDataStates {
  final Success<List<CurrentWeatherVariableModel>> data;

  WeatherDataLoadSuccess(this.data);
}

class WeatherDataLoadFailure extends WeatherDataStates {
  final Exception errObj;

  WeatherDataLoadFailure(this.errObj);
}

class WeatherDataBloc extends Bloc<WeatherEvent, WeatherDataStates> {
  late final WeatherRepository _weatherRepository;
  late final Timer _timer;

  WeatherDataBloc(this._weatherRepository) : super(WeatherDataInitial()) {
    on<LoadInitialWeatherDataEvent>(_onInitialDataEvent);

    on<PullToRefreshWeatherEvent>(_onInitialDataEvent);

    on<StreamWeatherDataEvent>(_onDataStreamEvent);

    add(LoadInitialWeatherDataEvent());
    //add(StreamWeatherDataEvent());
  }

  FutureOr<void> _onDataStreamEvent(event, emit) async {
    _timer = Timer.periodic(Duration(minutes: 30), (timer) async {
      try {
        emit(WeatherDataLoadingInProgress());
        final weatherData = await _weatherRepository.fetchDataWithBackup();
        if (weatherData is Success<List<CurrentWeatherVariableModel>>) {
          emit(WeatherDataLoadSuccess(weatherData));
        }
      } catch (ex) {
        emit(WeatherDataLoadFailure(ex as Exception));
      }
    });
  }

  FutureOr<void> _onInitialDataEvent(event, emit) async {
    try {
      emit(WeatherDataLoadingInProgress());
      final weatherData = await _weatherRepository.fetchDataWithBackup();
      if (weatherData is Success<List<CurrentWeatherVariableModel>>) {
        emit(WeatherDataLoadSuccess(weatherData));
      }
    } on NoSuchMethodError catch (e) {
      debugPrint(e.toString());
    } catch (ex) {
      debugPrint('Error: ${ex.toString()}');
      emit(WeatherDataLoadFailure(ex as Exception));
    }
  }

  @override
  Future<void> close() {
    _timer.cancel();
    return super.close();
  }
}
