import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:imuslim/data/providers/repository.dart';

import '../../data/models/surah_model.dart';

part 'searchsurah_event.dart';
part 'searchsurah_state.dart';

class SearchsurahBloc extends Bloc<SearchsurahEvent, SearchsurahState> {
  final repo = Repository();

  SearchsurahBloc() : super(SearchsurahInitial()) {
    on<GetSearchSurah>((event, emit) {
      final result = repo.getsearchSurah(event.query, event.masterData);
      emit(SuccessGetSearchSurah(value: result));
    });

    // on<PassingDataSurah>((event, emit) {
    //   emit(PassingDataSurahState(dataSurah: event.dataSurah));
    // });
  }
}
