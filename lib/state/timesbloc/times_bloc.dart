import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:imuslim/data/times/times.dart';

part 'times_event.dart';
part 'times_state.dart';

class TimesBloc extends Bloc<TimesEvent, TimesState> {
  Times times = Times();
  TimesBloc() : super(TimesInitial()) {
    on<GetCurrentTime>((event, emit) {
      try {
        emit(LoadingTimes());
        final value = times.currentTime();
        emit(SuccessTimes(value: value));
      } catch (e) {
        emit(FailureTimes(error: e.toString()));
      }
    });
  }
}
