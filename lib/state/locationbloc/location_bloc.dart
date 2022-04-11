import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:imuslim/data/providers/repository.dart';

part 'location_event.dart';
part 'location_state.dart';

class LocationBloc extends Bloc<LocationEvent, LocationState> {
  final repo = Repository();

  LocationBloc() : super(LocationInitial()) {
    on<GetLocationEvent>((event, emit) async {
      try {
        emit(LoadingGetLocation());
        final result = await repo.determinePosition();
        emit(SuccessGetLocation(result: result));
      } catch (e) {
        emit(FailedGetLocation(info: e.toString()));
        print(e.toString());
        print('===> failed when get location');
      }
    });
  }
}
