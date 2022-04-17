import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:imuslim/data/models/spesifik_surah_model.dart';
import 'package:imuslim/data/others/shared_preferences.dart';
import 'package:imuslim/data/providers/repository.dart';
import 'package:imuslim/state/praybloc/pray_bloc.dart';
import 'package:meta/meta.dart';

part 'surah_event.dart';
part 'surah_state.dart';

class SurahBloc extends Bloc<SurahEvent, SurahState> {
  final repo = Repository();
  final pref = MySharedPref();

  SurahBloc() : super(SurahInitial()) {
    on<ViewDetailSurah>((event, emit) async {
      try {
        emit(LoadingSurahDetail());
        var result = await repo.getDetailSurah(event.number);
        emit(SuccessGetSurahDetail(data: result));
      } catch (e) {
        emit(FailureSurahDetail(info: e.toString()));
      }
    });

    on<MarkLastAyatSurah>((event, emit) {
      try {
        emit(LoadingMarkLastAyatSurah());
        pref.markLastSurah(event.surah, event.ayat);
        emit(SuccessMarkLastAyatSurah());
      } catch (e) {
        emit(FailureMarkLastAyatSurah(info: e.toString()));
      }
    });

    on<GetLastAyatSurah>((event, emit) async {
      try {
        var result = await pref.getMarkLastSurah(event.surah);
        emit(SuccessGetLastAyatSurah(ayat: result));
      } catch (e) {
        emit(FailureGetLastAyatSurah(info: e.toString()));
      }
    });
  }
}
