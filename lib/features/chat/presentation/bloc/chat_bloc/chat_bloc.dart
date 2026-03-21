import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../domain/models/chat/chat.dart';
import '../../../domain/usecases/listen_chats_use_case.dart';

part 'chat_event.dart';

part 'chat_state.dart';

part 'chat_bloc.freezed.dart';

class ChatBloc extends Bloc<ChatEvent, ChatState> {
  final ListenChatsUseCase _getChatsUseCase;

  ChatBloc({
    required ListenChatsUseCase getChatsUseCase,
  }) : _getChatsUseCase = getChatsUseCase,
       super(const ChatState()) {
    on<_Init>(_init);
  }

  Future<void> _init(
    _Init event,
    Emitter<ChatState> emit,
  ) async {
    await emit.forEach(
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
}
