import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../domain/models/chat/chat.dart';
import '../../../domain/usecases/listen_chats_use_case.dart';
import '../../../domain/usecases/init_chat_use_case.dart';

part 'chat_event.dart';

part 'chat_state.dart';

part 'chat_bloc.freezed.dart';

class ChatBloc extends Bloc<ChatEvent, ChatState> {
  final InitChatUseCase _initChatUseCase;
  final ListenChatsUseCase _getChatsUseCase;

  ChatBloc({
    required ListenChatsUseCase getChatsUseCase,
    required InitChatUseCase initChatUseCase,
  }) : _initChatUseCase = initChatUseCase,
       _getChatsUseCase = getChatsUseCase,
       super(const ChatState()) {
    on<_Init>(_init);
    on<_CreateChat>(_createChat);
  }

  void _init(
    _Init event,
    Emitter<ChatState> emit,
  ) {
    emit.forEach(
      _getChatsUseCase.call(),
      onData: (chats) => state.copyWith(
        chats: chats,
        status: ChatStatus.initial,
      ),
      onError: (e, _) => state.copyWith(
        errorMessage: e.toString(),
        status: ChatStatus.failed,
      ),
    );
  }

  void _createChat(
    _CreateChat event,
    Emitter<ChatState> emit,
  ) async {
    try {
      emit(
        state.copyWith(
          status: ChatStatus.loading,
        ),
      );

      final chat = await _initChatUseCase.call(
        participants: [
          event.uid,
        ],
      );
      emit(
        state.copyWith(
          status: ChatStatus.initial,
          createdChatId: chat.chatId,
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          errorMessage: e.toString(),
          status: ChatStatus.failed,
        ),
      );
    }
  }
}
