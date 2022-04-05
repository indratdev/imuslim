import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
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
        emit(SuccessDefaultPrayTime(dataPrayTime: result));
      } catch (e) {
        emit(FailureDefaultPrayTime(info: e.toString()));
      }
    });
  }
}
