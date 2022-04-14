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
  MapEntry<String, dynamic> nextTimePrayer;
  String diffTime;

  SuccessDefaultPrayTime({
    required this.dataPrayTime,
    required this.nextTimePrayer,
    required this.diffTime,
  });

  @override
  List<Object> get props => [dataPrayTime, nextTimePrayer, diffTime];
}

class LoadingSurah extends PrayState {}

class FailureSurah extends FailureDefaultPrayTime {
  FailureSurah({required String info}) : super(info: info);
}

class SuccessGetSurah extends PrayState {
  SurahModel surah;

  SuccessGetSurah({
    required this.surah,
  });

  @override
  List<Object> get props => [surah];
}
