import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'home_tab_event.dart';
part 'home_tab_state.dart';
part 'home_tab_bloc.freezed.dart';

class HomeTabBloc extends Bloc<HomeTabEvent, HomeTabState> {
  HomeTabBloc() : super(const HomeTabState()) {
    on<HomeTabEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
