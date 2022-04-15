part of 'surah_bloc.dart';

@immutable
abstract class SurahState {}

class SurahInitial extends SurahState {}

class LoadingSurahDetail extends SurahState {}

class FailureSurahDetail extends SurahState {
  String info;

  FailureSurahDetail({
    required this.info,
  });

  @override
  List<Object> get props => [info];
}

class SuccessGetSurahDetail extends SurahState {
  SpesifikSurahModel data;
  // BuildContext context;
  // Route routeName;

  SuccessGetSurahDetail({
    required this.data,
    // required this.context,
    // required this.routeName,
  });

  @override
  List<Object> get props => [data];
}
