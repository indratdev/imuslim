part of 'searchsurah_bloc.dart';

abstract class SearchsurahState extends Equatable {
  const SearchsurahState();

  @override
  List<Object> get props => [];
}

class SearchsurahInitial extends SearchsurahState {}

class SuccessGetSearchSurah extends SearchsurahState {
  List<Data> value;

  SuccessGetSearchSurah({
    required this.value,
  });

  @override
  List<Object> get props => [value];
}

// class PassingDataSurahState extends SearchsurahState {
//   List<Data> dataSurah;

//   PassingDataSurahState({
//     required this.dataSurah,
//   });

//   @override
//   List<Object> get props => [dataSurah];
// }
