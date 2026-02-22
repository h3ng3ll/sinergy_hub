import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:collection/collection.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../domain/models/chat/chat.dart';
import '../../../../../domain/models/chat_message/chat_message.dart';
import '../../../../../domain/usecases/get_chat_by_id_use_case.dart';
import '../../../../../domain/usecases/get_last_messages_use_case.dart';
import '../../../../../domain/usecases/send_message_use_case.dart';
import '../../../../bloc/chat_cubit/chat_cubit.dart';

part 'chat_page_event.dart';

part 'chat_page_state.dart';

part 'chat_page_bloc.freezed.dart';

class ChatPageBloc extends Bloc<ChatPageEvent, ChatPageState> {
  final SendMessageUseCase _sendMessageUseCase;

  final GetChatByIdUseCase _getChatByIdUseCase;

  StreamSubscription? _chatSubscription;
  StreamSubscription? _messagesBlocSubscription;

  ChatPageBloc({
    required String chatId,
    required ChatCubit chatCubit,
    required GetLastMessagesUseCase getLastMessageUseCase,
    required SendMessageUseCase sendMessageUseCase,
    required GetChatByIdUseCase getChatByIdUseCase,
  }) : _sendMessageUseCase = sendMessageUseCase,
       _getChatByIdUseCase = getChatByIdUseCase,
       super(ChatPageState()) {
    on<_Load>(_load);
    on<_UpdateChat>(_updateChat);
    on<_UpdateMessages>(_updateMessages);
    on<_SendMessage>(_sendMessage);

    final existingChat = chatCubit.state.chats.firstWhereOrNull(
      (c) => c.chatId == chatId,
    );

    if (existingChat != null) {
      add(
        ChatPageEvent.updateChat(
          chat: existingChat,
        ),
      );
    }
    _chatSubscription =
        _getChatByIdUseCase(
          chatId: chatId,
        ).listen(
          (chat) {
            add(
              ChatPageEvent.updateChat(
                chat: chat,
              ),
            );
          },
        );

    _messagesBlocSubscription = getLastMessageUseCase
        .call(
          chatId,
        )
        .listen(
          (newMessages) {
            if (newMessages.isNotEmpty) {
              final updatedList = List<ChatMessage>.from(
                state.messages,
              );
              updatedList.insertAll(
                0,
                newMessages,
              ); // prepend новые
              add(
                ChatPageEvent.updateMessages(
                  messages: updatedList,
                ),
              );
            }
          },
        );
  }

  void _updateChat(event, emit) {
    emit(
      state.copyWith(
        chat: event.chat,
        status: ChatPageStatus.initial,
      ),
    );
  }

  void _updateMessages(event, emit) {
    emit(
      state.copyWith(
        messages: event.messages,
      ),
    );
  }

  void _load(event, emit) {
    try {
      emit(
        state.copyWith(
          status: ChatPageStatus.loading,
        ),
      );

      emit(
        state.copyWith(
          status: ChatPageStatus.initial,
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

  void _sendMessage(event, emit) {
    try {
      // emit(
      //   state.copyWith(
      //     status: ChatPageStatus.loading,
      //   ),
      // );
      _sendMessageUseCase.call(
        chat: state.chat!,
        message: event.message,
      );
      // emit(
      //   state.copyWith(
      //     status: ChatPageStatus.initial,
      //   ),
      // );
    } catch (e) {
      emit(
        state.copyWith(
          errorMessage: e.toString(),
          status: ChatPageStatus.failed,
        ),
      );
    }
  }

  @override
  Future<void> close() {
    _chatSubscription?.cancel();
    _messagesBlocSubscription?.cancel();
    return super.close();
  }
}
