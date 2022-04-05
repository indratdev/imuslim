part of 'times_bloc.dart';

abstract class TimesState extends Equatable {
  const TimesState();

  @override
  List<Object> get props => [];
}

class TimesInitial extends TimesState {}

class LoadingTimes extends TimesState {}

class FailureTimes extends TimesState {
  String error;

  FailureTimes({required this.error});

  @override
  List<Object> get props => [error];
}

class SuccessTimes extends TimesState {
  String value;

  SuccessTimes({required this.value});

  @override
  List<Object> get props => [value];
}
