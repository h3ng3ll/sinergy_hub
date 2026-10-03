import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../user/domain/models/user_data/user_data.dart';
import '../../../../user/domain/usecases/listen_user_data_use_case.dart';
import '../../../domain/models/chat/chat.dart';
import '../../../domain/models/chat_message/chat_message.dart';
import '../../../domain/usecases/get_last_messages_use_case.dart';
import '../../../domain/usecases/listen_chat_by_id_use_case.dart';
import '../../../domain/usecases/open_chat_use_case.dart';
import '../../../domain/usecases/send_message_use_case.dart';
import '../../../domain/usecases/toggle_block_user_use_case.dart';
import '../../../domain/usecases/update_typing_info_use_case.dart';

part 'chat_page_event.dart';

part 'chat_page_state.dart';

part 'chat_page_bloc.freezed.dart';

class ChatPageBloc extends Bloc<ChatPageEvent, ChatPageState> {
  final SendMessageUseCase _sendMessageUseCase;

  final ListenChatByIdUseCase _listenChatByIdUseCase;
  final ListenLastMessagesUseCase _getLastMessagesUseCase;

  final OpenChatUseCase _openChatUseCase;
  final ListenUserDataUseCase _listenUserDataUseCase;
  final UpdateTypingInfoUseCase _updateTypingInfoUseCase;
  final ToggleBlockUserUseCase _toggleBlockUserUseCase;

  StreamSubscription? _lastMessageSubscription;
  StreamSubscription? _updateChatSubscription;
  StreamSubscription? _userDataSubscription;

  ChatPageBloc({
    required SendMessageUseCase sendMessageUseCase,
    required ListenLastMessagesUseCase getLastMessageUseCase,
    required ListenChatByIdUseCase listenChatByIdUseCase,
    required OpenChatUseCase openChatUseCase,
    required UpdateTypingInfoUseCase updateTypingInfoUseCase,
    required ListenUserDataUseCase listenUserDataUseCase,
    required ToggleBlockUserUseCase toggleBlockUserUseCase,
  }) : _sendMessageUseCase = sendMessageUseCase,
       _openChatUseCase = openChatUseCase,
       _getLastMessagesUseCase = getLastMessageUseCase,
       _updateTypingInfoUseCase = updateTypingInfoUseCase,
       _listenChatByIdUseCase = listenChatByIdUseCase,
       _listenUserDataUseCase = listenUserDataUseCase,
       _toggleBlockUserUseCase = toggleBlockUserUseCase,

       super(
         ChatPageState(),
       ) {
    on<_Subscribe>(_subscribe);
    on<_Init>(_init);

    on<_UpdateMessages>(_updateMessages);

    on<_SendMessage>(_sendMessage);
    on<_StartTyping>(_startTyping);
    on<_EndTyping>(_endTyping);
    on<_UpdateChat>(_updateChat);
    on<_UpdateUserData>(_updateUserData);
    on<_ToggleBlock>(_toggleBlock);
  }

  void _updateMessages(
    _UpdateMessages event,
    Emitter<ChatPageState> emit,
  ) => emit(
    state.copyWith(
      messages:
          [
            ...state.messages,
            ...event.messages,
          ]..sort(
            (a, b) => a.createdAt.compareTo(b.createdAt),
          ),
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
          onError: (e) {
            emit(
              state.copyWith(
                errorMessage: e.toString(),
                status: ChatPageStatus.failed,
              ),
            );
          },
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
    final chatId = event.chatId;
    await _lastMessageSubscription?.cancel();
    await _updateChatSubscription?.cancel();
    await _userDataSubscription?.cancel();
    _lastMessageSubscription = null;
    _updateChatSubscription = null;
    _userDataSubscription = null;
    emit(
      ChatPageState(
        chatId: chatId,
        status: ChatPageStatus.loading,
      ),
    );

    final result = await _openChatUseCase.call(
      chatId: chatId,
    );
    result.fold(
      (data) {
        add(
          ChatPageEvent.subscribe(
            uid: data.peerUid,
          ),
        );
        emit(
          state.copyWith(
            users: data.users,
            userData: data.currentUser,
            chat: data.chat,
            chatId: chatId,
            status: ChatPageStatus.initial,
          ),
        );
      },
      (failure) {
        emit(
          ChatPageState(
            chatId: chatId,
            status: ChatPageStatus.failed,
            errorMessage: failure.message,
          ),
        );
      },
    );
  }

  void _toggleBlock(
    _ToggleBlock event,
    Emitter<ChatPageState> emit,
  ) async {
    final res = await _toggleBlockUserUseCase.call(
      chatId: state.chatId,
      targetUid: event.targetUid,
      blocked: event.blocked,
    );
    res.fold(
      (_) {
        /// The updated block flag arrives via the chat stream
        /// (_listenChatByIdUseCase -> _updateChat), so no local state
        /// change is needed here.
      },
      (failure) => emit(
        state.copyWith(
          errorMessage: failure.message,
          status: ChatPageStatus.failed,
        ),
      ),
    );
  }

  void _sendMessage(
    _SendMessage event,
    Emitter<ChatPageState> emit,
  ) async {
    /// Defense-in-depth: never send if the OTHER party has blocked me
    /// (my own uid is flagged in `blocked`). The blocker is not restricted
    /// by their own action.
    final myUid = state.userData?.uid;
    if (myUid != null && state.chat?.isBlockedBy(myUid) == true) return;

    emit(
      state.copyWith(
        status: ChatPageStatus.sending,
      ),
    );
    final res = await _sendMessageUseCase.call(
      chatId: state.chatId,
      message: event.message,
    );

    res.fold(
      (_) {
        emit(
          state.copyWith(
            status: ChatPageStatus.sent,
          ),
        );
      },
      (e) {
        emit(
          state.copyWith(
            errorMessage: e.message,
            status: ChatPageStatus.failed,
          ),
        );
      },
    );
    add(
      ChatPageEvent.endTyping(),
    );
  }

  Future<void> _setTypingStatus({required bool isTyping}) async {
    final chat = state.chat;
    if (chat == null) return;
    await _updateTypingInfoUseCase.call(
      chatId: chat.chatId,
      /// A blocked chat never advertises typing to either side; publishing
      /// false also clears a status that was set before the block landed.
      status: isTyping && !chat.anyBlocked,
    );
  }

  void _startTyping(_StartTyping event, emit) async {
    await _setTypingStatus(isTyping: true);
  }

  void _endTyping(_EndTyping event, emit) async {
    await _setTypingStatus(isTyping: false);
  }

  @override
  Future<void> close() async {
    await _updateChatSubscription?.cancel();
    await _lastMessageSubscription?.cancel();
    await _userDataSubscription?.cancel();
    await _setTypingStatus(isTyping: false);
    return super.close();
  }
}
