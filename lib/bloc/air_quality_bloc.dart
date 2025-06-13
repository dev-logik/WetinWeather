import 'package:bloc/bloc.dart';
import 'package:bloc_app/data/repositories/air_quality_repository.dart';
import 'package:bloc_app/models/airQualityService1.dart';

sealed class AirQualityEvent {}

class PullToRefreshEvent extends AirQualityEvent {}

sealed class AirQualityState {}

class AirQualityInitial extends AirQualityState {}

class AirQualityLoadInProgress extends AirQualityState {}

class AirQualityLoadSuccess extends AirQualityState {
  final AirQualityModelService1 data;
  AirQualityLoadSuccess(this.data);
}

class AirQualityLoadFailure extends AirQualityState {
  final Exception exception;
  AirQualityLoadFailure(this.exception);
}

class AirQualityBloc extends Bloc<AirQualityEvent, AirQualityState> {
  late final _dataRepository = AirQualityRepository();

  AirQualityBloc() : super(AirQualityInitial()) {
    on<PullToRefreshEvent>((event, emit) async {
      try {
        emit(AirQualityLoadInProgress());
        final data = await _dataRepository.filteredData();
        emit(AirQualityLoadSuccess(data));
      } catch (exception) {
        emit(AirQualityLoadFailure(Exception(exception.toString())));
      }
    });
  }
}
