import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../core/utils/extensions/bloc_ext.dart';
import '../../../domain/models/chat/chat.dart';
import '../../../domain/models/e_chat_filter.dart';
import '../../../domain/usecases/search_chats_use_case.dart';

part 'chats_filter_event.dart';

part 'chats_filter_state.dart';

part 'chats_filter_bloc.freezed.dart';

class ChatsFilterBloc extends Bloc<ChatsFilterEvent, ChatsFilterState> {
  final SearchChatsUseCase _searchChatsUseCase;

  ChatsFilterBloc({
    required SearchChatsUseCase searchChatsUseCase,
  }) : _searchChatsUseCase = searchChatsUseCase,
       super(const ChatsFilterState()) {
    on<_ApplyFilter>(_applyFilter);
    on<_Search>(
      _search,
      transformer: debounceTransformer(
        Duration(
          milliseconds: 500,
        ),
      ),
    );
  }

  void _applyFilter(_ApplyFilter event, emit) {
    try {
      emit(
        state.copyWith(
          filter: event.filter,
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

  void _search(_Search event, emit) async {
    try {
      emit(
        state.copyWith(
          query: event.query,
          status: ChatsFilterStatus.searching,
        ),
      );
      final List<Chat> chats = await _searchChatsUseCase.call(
        query: event.query,
        filter: state.filter,
      );
      emit(
        state.copyWith(
          query: event.query,
          chats: chats,
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
