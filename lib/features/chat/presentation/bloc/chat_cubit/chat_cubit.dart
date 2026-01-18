import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../user/presentation/bloc/user_cubit/user_cubit.dart';
import '../../../domain/models/chat/chat.dart';
import '../../../domain/usecases/get_chats_use_case.dart';
import '../../../domain/usecases/init_chat_use_case.dart';

part 'chat_state.dart';

part 'chat_cubit.freezed.dart';

class ChatCubit extends Cubit<ChatState> {
  final InitChatUseCase _initChatUseCase;
  final GetChatsUseCase _getChatsUseCase;

  StreamSubscription? _subscription;

  ChatCubit({
    required GetChatsUseCase getChatsUseCase,
    required InitChatUseCase initChatUseCase,
    required UserCubit userCubit,
  }) : _initChatUseCase = initChatUseCase,
       _getChatsUseCase = getChatsUseCase,
       super(const ChatState());

  void init(String uid) {
    _subscription = _getChatsUseCase
        .call(
      uid,
        )
        .listen(
          (
            chats,
          ) {
            _update(
              chats: chats,
            );
          },
        );
  }

  void _update({
    required List<Chat> chats,
  }) {
    emit(
      state.copyWith(
        chats: chats,
        status: ChatStatus.initial,
      ),
    );
  }

  Future<String> create({
    required String uid,
    required String currentUid,
  }) async {
    try {
      emit(
        state.copyWith(
          status: ChatStatus.loading,
        ),
      );

      final chat = await _initChatUseCase.call(
        participants: [
          currentUid,
          uid,
        ],
      );
      emit(
        state.copyWith(
          status: ChatStatus.initial,
        ),
      );
      return chat.chatId;
    } catch (e) {
      emit(
        state.copyWith(
          errorMessage: e.toString(),
          status: ChatStatus.failed,
        ),
      );
      return '';
    }
  }

  @override
  Future<void> close() {
    _subscription?.cancel();
    return super.close();
  }
}
