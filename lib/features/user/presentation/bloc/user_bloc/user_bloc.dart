import 'dart:async';
import 'dart:typed_data';

import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../domain/models/user_data/user_data.dart';
import '../../../domain/repositories/i_user_repository.dart';
import '../../../domain/usecases/update_user_usecase.dart';

part 'user_event.dart';

part 'user_state.dart';

part 'user_bloc.freezed.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final IUserRepository _userRepository;

  UserBloc({
    required IUserRepository userRepository,
  }) : _userRepository = userRepository,
       super(const UserState()) {
    on<_Init>(_init);
  }

  void _init(
    _Init event,
    Emitter<UserState> emit,
  ) async {
    await emit.forEach(
      _userRepository.currentUserStream(),
      onData: (user) {
        // if (user != null && _userDataSubscription == null) {
        //   _subscribeUserData(
        //     user.uid,
        //   );
        // } else {
        //   _userDataSubscription?.cancel();
        // }

        return state.copyWith(
          user: user,
          status: UserStatus.loaded,
        );
      },
    );
  }


}
