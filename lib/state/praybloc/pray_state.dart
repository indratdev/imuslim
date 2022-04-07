part of 'pray_bloc.dart';

abstract class PrayState extends Equatable {
  const PrayState();

  @override
  List<Object> get props => [];
}

class PrayInitial extends PrayState {}

class LoadingDefaultPrayTime extends PrayState {}

class FailureDefaultPrayTime extends PrayState {
  String info;

  FailureDefaultPrayTime({required this.info});

  @override
  List<Object> get props => [info];
}

class SuccessDefaultPrayTime extends PrayState {
  PrayTimes dataPrayTime;
  Map<String, dynamic> nextTimePrayer;

  SuccessDefaultPrayTime(
      {required this.dataPrayTime, required this.nextTimePrayer});

  @override
  List<Object> get props => [dataPrayTime, nextTimePrayer];
}
