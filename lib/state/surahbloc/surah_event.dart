part of 'surah_bloc.dart';

@immutable
abstract class SurahEvent {}

class ViewDetailSurah extends SurahEvent {
  int number;
  // BuildContext context;
  // Route routeName;

  ViewDetailSurah({
    required this.number,
    // required this.context,
    // required this.routeName,
  });
}
