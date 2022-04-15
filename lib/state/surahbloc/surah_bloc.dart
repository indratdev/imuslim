import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:imuslim/data/models/spesifik_surah_model.dart';
import 'package:imuslim/data/providers/repository.dart';
import 'package:meta/meta.dart';

part 'surah_event.dart';
part 'surah_state.dart';

class SurahBloc extends Bloc<SurahEvent, SurahState> {
  final repo = Repository();

  SurahBloc() : super(SurahInitial()) {
    on<ViewDetailSurah>((event, emit) async {
      try {
        emit(LoadingSurahDetail());
        var result = await repo.getDetailSurah(event.number);
        print(result);

        emit(SuccessGetSurahDetail(data: result));
      } catch (e) {
        print('gagal get surah detail');
        emit(FailureSurahDetail(info: e.toString()));
      }
    });
  }
}
