part of 'pray_bloc.dart';

abstract class PrayEvent extends Equatable {
  const PrayEvent();

  @override
  List<Object> get props => [];
}

class GetDefaultPrayTime extends PrayEvent {
  double lat, lon;

  GetDefaultPrayTime({required this.lat, required this.lon});

  @override
  List<Object> get props => [lat, lon];
}

class GetAllSurah extends PrayEvent {}
