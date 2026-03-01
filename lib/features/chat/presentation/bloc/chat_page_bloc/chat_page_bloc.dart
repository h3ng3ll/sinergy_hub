import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../user/domain/models/user_data/user_data.dart';
import '../../../../user/domain/usecases/get_users_use_case.dart';
import '../../../domain/models/chat_message/chat_message.dart';
import '../../../domain/usecases/get_chat_by_id_use_case.dart';
import '../../../domain/usecases/get_last_messages_use_case.dart';
import '../../../domain/usecases/listen_chat_messages_use_case.dart';
import '../../../domain/usecases/send_message_use_case.dart';

part 'chat_page_event.dart';

part 'chat_page_state.dart';

part 'chat_page_bloc.freezed.dart';

class ChatPageBloc extends Bloc<ChatPageEvent, ChatPageState> {
  final SendMessageUseCase _sendMessageUseCase;
  final ListenChatMessagesUseCase _listenChatMessagesUseCase;
  final GetChatByIdUseCase _getChatByIdUseCase;
  final GetLastMessagesUseCase _getLastMessagesUseCase;
  final GetUsersUseCase _getUsersUseCase;

  ChatPageBloc({
    required String chatId,
    required SendMessageUseCase sendMessageUseCase,
    required GetLastMessagesUseCase getLastMessageUseCase,
    required ListenChatMessagesUseCase listenChatMessagesUseCase,
    required GetChatByIdUseCase getChatByIdUseCase,
    required GetUsersUseCase getUsersUseCase,
  }) : _sendMessageUseCase = sendMessageUseCase,
       _listenChatMessagesUseCase = listenChatMessagesUseCase,
       _getUsersUseCase = getUsersUseCase,
       _getLastMessagesUseCase = getLastMessageUseCase,
       _getChatByIdUseCase = getChatByIdUseCase,

       super(
         ChatPageState(
           chatId: chatId,
         ),
       ) {
    on<_Subscribe>(_subscribe);
    on<_Init>(_init);
    on<_UpdateMessages>(_updateMessages);
    on<_SendMessage>(_sendMessage);
  }

  void _updateMessages(event, emit) {
    emit(
      state.copyWith(
        messages: event.messages,
      ),
    );
  }

  void _subscribe(
    ChatPageEvent event,
    Emitter<ChatPageState> emit,
  ) async => await emit.forEach(
    _getLastMessagesUseCase.call(
      chatId: state.chatId,
    ),
    onData: (message) => state.copyWith(
      messages: [
        ...state.messages,
        ...message,
      ],
      status: ChatPageStatus.initial,
    ),
  );

  void _init(
    _Init event,
    Emitter<ChatPageState> emit,
  ) async {
    try {
      emit(
        state.copyWith(
          status: ChatPageStatus.loading,
        ),
      );
      final chat = await _getChatByIdUseCase.call(
        chatId: state.chatId,
      );
      final users = await _getUsersUseCase.call(
        ids: chat.participants,
      );

      add(
        ChatPageEvent.subscribe(),
      );

      emit(
        state.copyWith(
          users: users,
          status: ChatPageStatus.initial,
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          status: ChatPageStatus.failed,
          errorMessage: e.toString(),
        ),
      );
      rethrow;
    }
  }

  void _sendMessage(event, emit) async {
    try {
      emit(
        state.copyWith(
          status: ChatPageStatus.sending,
        ),
      );
      await _sendMessageUseCase.call(
        chatId: state.chatId,
        message: event.message,
      );
      emit(
        state.copyWith(
          status: ChatPageStatus.sent,
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          errorMessage: e.toString(),
          status: ChatPageStatus.failed,
        ),
      );
    }
  }
}
