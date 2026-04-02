import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../user/domain/models/user_data/user_data.dart';
import '../../../../user/domain/usecases/get_current_user_data_use_case.dart';
import '../../../../user/domain/usecases/get_users_use_case.dart';
import '../../../../user/domain/usecases/listen_user_data_use_case.dart';
import '../../../domain/models/chat/chat.dart';
import '../../../domain/models/chat_message/chat_message.dart';
import '../../../domain/usecases/get_chat_by_id_use_case.dart';
import '../../../domain/usecases/get_last_messages_use_case.dart';
import '../../../domain/usecases/listen_chat_by_id_use_case.dart';
import '../../../domain/usecases/listen_chat_messages_use_case.dart';
import '../../../domain/usecases/send_message_use_case.dart';
import '../../../domain/usecases/update_typing_info_use_case.dart';

part 'chat_page_event.dart';

part 'chat_page_state.dart';

part 'chat_page_bloc.freezed.dart';

class ChatPageBloc extends Bloc<ChatPageEvent, ChatPageState> {
  final SendMessageUseCase _sendMessageUseCase;

  final ListenChatByIdUseCase _listenChatByIdUseCase;
  final ListenLastMessagesUseCase _getLastMessagesUseCase;

  final GetUsersUseCase _getUsersUseCase;
  final GetChatByIdUseCase _getChatByIdUseCase;
  final ListenUserDataUseCase _listenUserDataUseCase;
  final UpdateTypingInfoUseCase _updateTypingInfoUseCase;
  final GetCurrentUserDataUseCase _getCurrentUserDataUseCase;

  StreamSubscription? _lastMessageSubscription;
  StreamSubscription? _updateChatSubscription;
  StreamSubscription? _userDataSubscription;

  ChatPageBloc({
    required String chatId,
    required SendMessageUseCase sendMessageUseCase,
    required ListenLastMessagesUseCase getLastMessageUseCase,
    required ListenChatByIdUseCase listenChatByIdUseCase,
    required GetUsersUseCase getUsersUseCase,
    required UpdateTypingInfoUseCase updateTypingInfoUseCase,
    required GetChatByIdUseCase getChatByIdUseCase,
    required ListenUserDataUseCase listenUserDataUseCase,
    required GetCurrentUserDataUseCase getCurrentUserDataUseCase,
  }) : _sendMessageUseCase = sendMessageUseCase,
       _getUsersUseCase = getUsersUseCase,
       _getLastMessagesUseCase = getLastMessageUseCase,
       _updateTypingInfoUseCase = updateTypingInfoUseCase,
       _getChatByIdUseCase = getChatByIdUseCase,
       _listenChatByIdUseCase = listenChatByIdUseCase,
       _listenUserDataUseCase = listenUserDataUseCase,
       _getCurrentUserDataUseCase = getCurrentUserDataUseCase,

       super(
         ChatPageState(
           chatId: chatId,
         ),
       ) {
    on<_Subscribe>(_subscribe);
    on<_Init>(_init);

    on<_UpdateMessages>(_updateMessages);

    on<_SendMessage>(_sendMessage);
    on<_StartTyping>(_startTyping);
    on<_EndTyping>(_endTyping);
    on<_UpdateChat>(_updateChat);
    on<_UpdateUserData>(_updateUserData);
  }

  void _updateMessages(
    _UpdateMessages event,
    Emitter<ChatPageState> emit,
  ) => emit(
    state.copyWith(
      messages: [
        ...state.messages,
        ...event.messages,
      ],
    ),
  );

  void _updateChat(
    _UpdateChat event,
    Emitter<ChatPageState> emit,
  ) => emit(
    state.copyWith(
      chat: event.chat,
    ),
  );

  void _updateUserData(
    _UpdateUserData event,
    Emitter<ChatPageState> emit,
  ) {
    final users = [...state.users];
    final index = users.indexWhere(
      (e) => e.uid == event.user.uid,
    );
    if (index == -1) {
      emit(
        state.copyWith(
          users: users,
        ),
      );
    } else {
      users[index] = event.user;

      emit(
        state.copyWith(
          users: users,
        ),
      );
    }
  }

  void _subscribe(
    _Subscribe event,
    Emitter<ChatPageState> emit,
  ) async {
    _lastMessageSubscription = _getLastMessagesUseCase
        .call(
          chatId: state.chatId,
        )
        .listen(
          (List<ChatMessage> messages) => add(
            ChatPageEvent.updateMessages(
              messages: messages,
            ),
          ),
        );
    _updateChatSubscription = _listenChatByIdUseCase
        .call(
          chatId: state.chatId,
        )
        .listen(
          (Chat chat) => add(
            ChatPageEvent.updateChat(
              chat: chat,
            ),
          ),
        );
    _userDataSubscription = _listenUserDataUseCase
        .call(
          event.uid,
        )
        .listen(
          (user) {
            if (user != null) {
              add(
                ChatPageEvent.updateUserData(
                  user: user,
                ),
              );
            }
          },
        );
  }

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
      final Chat chat = await _getChatByIdUseCase.call(
        chatId: state.chatId,
      );
      final List<UserData> users = await _getUsersUseCase.call(
        ids: chat.participants,
      );
      final userData = await _getCurrentUserDataUseCase.call();



      add(
        ChatPageEvent.subscribe(
          uid: users.firstWhere(
            (e) => e.uid != userData.uid,
          ).uid,
        ),
      );

      emit(
        state.copyWith(
          users: users,
          chat: chat,
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

  void _sendMessage(_SendMessage event, emit) async {
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
      add(
        ChatPageEvent.endTyping(),
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

  void _startTyping(_StartTyping event, emit) async {
    try {
      emit(
        state.copyWith(
          status: ChatPageStatus.sending,
        ),
      );

      await _updateTypingInfoUseCase.call(
        chatId: state.chat!.chatId,
        status: true,
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

  void _endTyping(_EndTyping event, emit) async {
    try {
      emit(
        state.copyWith(
          status: ChatPageStatus.sending,
        ),
      );
      await _updateTypingInfoUseCase.call(
        chatId: state.chat!.chatId,
        status: false,
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

  @override
  Future<void> close() {
    _updateChatSubscription?.cancel();
    _lastMessageSubscription?.cancel();
    _userDataSubscription?.cancel();
    add(
      ChatPageEvent.endTyping(),
    );
    return super.close();
  }
}
