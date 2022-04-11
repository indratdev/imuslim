import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:imuslim/data/providers/repository.dart';

part 'times_event.dart';
part 'times_state.dart';

class TimesBloc extends Bloc<TimesEvent, TimesState> {
  final repo = Repository();

  TimesBloc() : super(TimesInitial()) {
    on<GetcurrentDateLocal>((event, emit) {
      try {
        emit(LoadingTimes());
        final value = repo.currentDateLocal();
        emit(SuccessTimes(value: value));
      } catch (e) {
        emit(FailureTimes(error: e.toString()));
      }
    });
  }
}
