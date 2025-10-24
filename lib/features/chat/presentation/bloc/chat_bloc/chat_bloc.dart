import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../user/presentation/bloc/user_cubit/user_cubit.dart';
import '../../../domain/models/chat/chat.dart';
import '../../../domain/usecases/get_chats_use_case.dart';
import '../../../domain/usecases/init_chat_use_case.dart';

part 'chat_event.dart';

part 'chat_state.dart';

part 'chat_bloc.freezed.dart';

class ChatBloc extends Bloc<ChatEvent, ChatState> {
  final InitChatUseCase _initChatUseCase;
  final UserCubit _userCubit;

  StreamSubscription? _subscription;

  ChatBloc({
    required GetChatsUseCase getChatsUseCase,
    required InitChatUseCase initChatUseCase,
    required UserCubit userCubit,
  }) : _initChatUseCase = initChatUseCase,
       _userCubit = userCubit,
       super(const ChatState()) {
    on<_Update>(_update);
    on<_Create>(_create);

    if (userCubit.uid == null) return;
    _subscription = getChatsUseCase
        .call(
          userCubit.uid!,
        )
        .listen(
          (
            chats,
          ) {
            add(
              ChatEvent.update(
                chats: chats,
              ),
            );
          },
        );
  }

  void _update(event, emit) {
    final chats = event.chats;
    emit(
      state.copyWith(
        chats: chats,
      ),
    );
  }

  void _create(event, emit) async {
    try {
      final user = _userCubit.state.user;
      if (user == null) return;
      emit(
        state.copyWith(
          status: ChatStatus.loading,
        ),
      );
      final uid = event.uid;

      await _initChatUseCase.call(
        participants: [
          user.uid,
          uid,
        ],
      );
      emit(
        state.copyWith(
          status: ChatStatus.initial,
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

  @override
  Future<void> close() {
    _subscription?.cancel();
    return super.close();
  }
}
