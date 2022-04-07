import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../data/others/times.dart';

part 'times_event.dart';
part 'times_state.dart';

class TimesBloc extends Bloc<TimesEvent, TimesState> {
  Times times = Times();
  TimesBloc() : super(TimesInitial()) {
    on<GetcurrentDateLocal>((event, emit) {
      try {
        emit(LoadingTimes());
        final value = times.currentDateLocal();
        emit(SuccessTimes(value: value));
      } catch (e) {
        emit(FailureTimes(error: e.toString()));
      }
    });
  }
}
