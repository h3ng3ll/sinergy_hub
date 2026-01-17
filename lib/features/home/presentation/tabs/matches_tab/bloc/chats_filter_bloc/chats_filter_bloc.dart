import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../../chat/domain/models/e_chat_filter.dart';

part 'chats_filter_event.dart';
part 'chats_filter_state.dart';
part 'chats_filter_bloc.freezed.dart';

class ChatsFilterBloc extends Bloc<ChatsFilterEvent, ChatsFilterState> {
  ChatsFilterBloc() : super(const ChatsFilterState()) {
    on<_ApplyFilter>(_applyFilter);
  }

  void _applyFilter(event, emit) {
      try {
        emit(
          state.copyWith(
            status: ChatsFilterStatus.loading,
          ),
        );

         emit(
            state.copyWith(
              status: ChatsFilterStatus.initial,
            ),
         );

      } catch (e) {
        emit(
          state.copyWith(
            errorMessage: e.toString(),
            status: ChatsFilterStatus.failed,
          ),
        );
      }
    }
}
