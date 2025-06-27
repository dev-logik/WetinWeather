import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloc_app/data/repositories/air_quality_repository.dart';
import 'package:bloc_app/models/air_quality_pollutant_model.dart';
import 'package:bloc_app/services/response_model.dart';

//Defines the events that can be triggered from the UI.
sealed class AirQualityEvent {}

class LoadInitialDataEvent extends AirQualityEvent {}

class PullToRefreshEvent extends AirQualityEvent {}

class AirQualityFetchDataStreamEvent extends AirQualityEvent {}

//Defines the different states the air quality data can be in.
sealed class AirQualityState {}

class AirQualityInitial extends AirQualityState {}

class AirQualityLoadingInProgress extends AirQualityState {}

class AirQualityLoadSuccess extends AirQualityState {
  final Success<List<AirQualityPollutantModel>> data;
  AirQualityLoadSuccess(this.data);
}

class AirQualityLoadFailure extends AirQualityState {
  final Exception exception;
  AirQualityLoadFailure(this.exception);
}

//Defines the business logic for the air quality data.
class AirQualityBloc extends Bloc<AirQualityEvent, AirQualityState> {
  late final AirQualityRepository _airQualityRepository;
  late final Timer? _timer;
  static const int DATA_REFRESH_INTERVAL = 1200;
  AirQualityBloc(this._airQualityRepository) : super(AirQualityInitial()) {
    on<LoadInitialDataEvent>(
      (event, emit) => _onLoadInitialDataEvent(event, emit),
    );

    on<PullToRefreshEvent>((event, emit) => _onPullToRefreshEvent(event, emit));

    on<AirQualityFetchDataStreamEvent>(
      (event, emit) => _onFetchDataStreamEvent(event, emit),
    );

    add(LoadInitialDataEvent());
  }

  Future<void> _onLoadInitialDataEvent(
    LoadInitialDataEvent event,
    Emitter<AirQualityState> emit,
  ) async {
    try {
      emit(AirQualityLoadingInProgress());
      final data = await _airQualityRepository.fetchDataWithBackup();
      if (data is Success<List<AirQualityPollutantModel>>) {
        emit(AirQualityLoadSuccess(data));
      }
    } catch (exception) {
      emit(AirQualityLoadFailure(Exception(exception)));
    }
  }

  Future<void> _onPullToRefreshEvent(
    PullToRefreshEvent event,
    Emitter<AirQualityState> emit,
  ) async {
    try {
      emit(AirQualityLoadingInProgress());
      final data = await _airQualityRepository.fetchDataWithBackup();
      if (data is Success<List<AirQualityPollutantModel>>) {
        emit(AirQualityLoadSuccess(data));
      }
    } catch (ex) {
      emit(AirQualityLoadFailure(Exception(ex)));
    }
  }

  Future<void> _onFetchDataStreamEvent(
    AirQualityFetchDataStreamEvent event,
    Emitter<AirQualityState> emit,
  ) async {
    _timer?.cancel();
    _timer = await Timer.periodic(Duration(seconds: DATA_REFRESH_INTERVAL), (
      timer,
    ) async {
      try {
        emit(AirQualityLoadingInProgress());
        final data = await _airQualityRepository.fetchDataWithBackup();
        if (data is Success<List<AirQualityPollutantModel>>) {
          emit(AirQualityLoadSuccess(data));
        }
      } catch (ex) {
        emit(AirQualityLoadFailure(Exception(ex)));
      }
    });
  }

  @override
  Future<void> close() {
    _timer?.cancel();
    return super.close();
  }
}
