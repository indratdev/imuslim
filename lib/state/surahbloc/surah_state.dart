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

class LoadingMarkLastAyatSurah extends SurahState {}

class FailureMarkLastAyatSurah extends SurahState
    implements FailureSurahDetail {
  @override
  String info;

  FailureMarkLastAyatSurah({
    required this.info,
  });

  @override
  // TODO: implement props
  List<Object> get props => [info];
}

class SuccessMarkLastAyatSurah extends SurahState {}

class SuccessGetLastAyatSurah extends SurahState {
  String ayat;

  SuccessGetLastAyatSurah({
    required this.ayat,
  });
}

class FailureGetLastAyatSurah extends FailureSurahDetail {
  FailureGetLastAyatSurah({required String info}) : super(info: info);
}
