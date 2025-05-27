import 'dart:async';

import 'package:bloc/bloc.dart';

class DateTimeState {
  DateTime _dateTimeObj;
  DateTime get accessDateTime => _dateTimeObj;
  DateTimeState(this._dateTimeObj);
}

class DateTimeCubit extends Cubit<DateTimeState> {
  Timer? _timer;
  DateTimeCubit(DateTimeState initialState) : super(initialState);

  void startTime() {
    //Resets the timer.
    _timer?.cancel();
    //Restarts the timer.
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      //Updates the time each second.
      _updateTime();
    });
  }

  void _updateTime() {
    //Updates the time and emit the new update.
    emit(DateTimeState(DateTime.now()));
  }

  void dispose() {
    //Disposes the timer object.
    _timer?.cancel();
  }
}
