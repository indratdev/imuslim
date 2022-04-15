import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:imuslim/data/models/surah_model.dart';
import 'package:imuslim/data/providers/repository.dart';

import '../../data/models/pray_times.dart';

// import 'package:smart_muslim/providers/api_connection.dart';

part 'pray_event.dart';
part 'pray_state.dart';

class PrayBloc extends Bloc<PrayEvent, PrayState> {
  final repo = Repository();

  PrayBloc() : super(PrayInitial()) {
    on<GetDefaultPrayTime>((event, emit) async {
      try {
        emit(LoadingDefaultPrayTime());
        final result = await repo.getDailyTimesPray(event.lat, event.lon);
        final nextTimePrayer =
            repo.nextTimeShalat(result.datetime[0].times.toJson());
        final diffTime = await repo.checkSelisihWaktu(nextTimePrayer.value);

        emit(SuccessDefaultPrayTime(
          dataPrayTime: result,
          nextTimePrayer: nextTimePrayer,
          diffTime: diffTime,
        ));
      } catch (e) {
        emit(FailureDefaultPrayTime(info: e.toString()));
      }
    });

    on<GetAllSurah>((event, emit) async {
      try {
        emit(LoadingSurah());
        final result = await repo.getSurah();
        emit(SuccessGetSurah(surah: result));
      } catch (e) {
        emit(FailureSurah(info: e.toString()));
      }
    });
  } // end bloc
}
