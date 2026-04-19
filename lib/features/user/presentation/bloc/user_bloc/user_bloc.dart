import 'dart:async';
import 'dart:typed_data';

import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../domain/models/user_data/user_data.dart';
import '../../../domain/usecases/listen_user_data_use_case.dart';

part 'user_event.dart';

part 'user_state.dart';

part 'user_bloc.freezed.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final ListenUserDataUseCase _listenUserDataUseCase;
  StreamSubscription? _userSub;

  UserBloc({
    required ListenUserDataUseCase listenUserDataUseCase,
  }) : _listenUserDataUseCase = listenUserDataUseCase,
       super(const UserState()) {
    on<_Init>(
      _init,
      transformer: restartable(),
    );
    on<_Reset>(_reset);
  }

  Future<void> _init(
    _Init event,
    Emitter<UserState> emit,
  ) async {
    await emit.forEach<UserData?>(
      _listenUserDataUseCase.call(
        event.uid,
      ),
      onData: (UserData? user) {
        return state.copyWith(
          userData: user,
          status: user != null ? UserStatus.loaded : UserStatus.noData,
        );
      },
      onError: (e, _) => state.copyWith(
        status: UserStatus.failed,
      ),
    );
  }

  void _reset(
    _Reset event,
    Emitter<UserState> emit,
  ) async {
    await _userSub?.cancel();
    _userSub = null;
    emit(
      const UserState(),
    );
  }
}
