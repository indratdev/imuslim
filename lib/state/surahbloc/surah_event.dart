part of 'surah_bloc.dart';

@immutable
abstract class SurahEvent {}

class ViewDetailSurah extends SurahEvent {
  int number;

  ViewDetailSurah({
    required this.number,
  });
}
