import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../data/others/location_device.dart';

part 'location_event.dart';
part 'location_state.dart';

class LocationBloc extends Bloc<LocationEvent, LocationState> {
  LocationBloc() : super(LocationInitial()) {
    on<GetLocationEvent>((event, emit) async {
      try {
        emit(LoadingGetLocation());
        final result = await LocationDevice().determinePosition();
        // print(result);
        emit(SuccessGetLocation(result: result));
      } catch (e) {
        emit(FailedGetLocation(info: e.toString()));
        print(e.toString());
        print('===> failed when get location');
      }
    });
  }
}
