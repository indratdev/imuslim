import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:imuslim/data/others/times.dart';
import 'package:imuslim/data/providers/api_connection.dart';

import '../../data/models/pray_times.dart';

// import 'package:smart_muslim/providers/api_connection.dart';

part 'pray_event.dart';
part 'pray_state.dart';

class PrayBloc extends Bloc<PrayEvent, PrayState> {
  ApiConnection api = ApiConnection();

  PrayBloc() : super(PrayInitial()) {
    on<GetDefaultPrayTime>((event, emit) async {
      try {
        emit(LoadingDefaultPrayTime());
        final result = await api.getDailyTimesPray(event.lat, event.lon);
        final nextTimePrayer =
            Times().nextTimeShalat(result.datetime[0].times.toJson());
        emit(SuccessDefaultPrayTime(
            dataPrayTime: result, nextTimePrayer: nextTimePrayer));
      } catch (e) {
        emit(FailureDefaultPrayTime(info: e.toString()));
      }
    });
  }
}
