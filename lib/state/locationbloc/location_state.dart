part of 'location_bloc.dart';

abstract class LocationState extends Equatable {
  const LocationState();

  @override
  List<Object> get props => [];
}

class LocationInitial extends LocationState {}

class LoadingGetLocation extends LocationState {}

class FailedGetLocation extends LocationState {
  String info;

  FailedGetLocation({required this.info});
  @override
  List<Object> get props => [info];
}

class SuccessGetLocation extends LocationState {
  Map<String, dynamic> result;

  SuccessGetLocation({required this.result});
  @override
  List<Object> get props => [result];
}
