import 'package:flutter_bloc/flutter_bloc.dart';

sealed class CounterEvent {}

final class IncrementCounterBloc extends CounterEvent {}

final class DecrementCounterBloc extends CounterEvent {
}

class CounterBloc extends Bloc<CounterEvent, int> {
  CounterBloc(super.initialState) {
    on<IncrementCounterBloc>((event, emit) => emit(state + 1));
    on<DecrementCounterBloc>((event, emit) => emit(state - 1));
  }
}
