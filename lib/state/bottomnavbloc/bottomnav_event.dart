part of 'bottomnav_bloc.dart';

abstract class BottomnavEvent extends Equatable {
  const BottomnavEvent();

  @override
  List<Object> get props => [];
}

class ChangePage extends BottomnavEvent {
  int page;

  ChangePage({required this.page});
}
