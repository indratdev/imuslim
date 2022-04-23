part of 'searchsurah_bloc.dart';

abstract class SearchsurahEvent extends Equatable {
  const SearchsurahEvent();

  @override
  List<Object> get props => [];
}

class GetSearchSurah extends SearchsurahEvent {
  String query;
  List<Data> masterData;

  GetSearchSurah({
    required this.query,
    required this.masterData,
  });

  @override
  List<Object> get props => [query, masterData];
}

// class PassingDataSurah extends SearchsurahEvent {
//   List<Data> dataSurah;

//   PassingDataSurah({
//     required this.dataSurah,
//   });

//   @override
//   List<Object> get props => [dataSurah];
// }
