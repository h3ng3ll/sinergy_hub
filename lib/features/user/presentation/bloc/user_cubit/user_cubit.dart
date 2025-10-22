import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../domain/repositories/i_user_repository.dart';

part 'user_state.dart';

part 'user_cubit.freezed.dart';

class UserCubit extends Cubit<UserState> {
  final IUserRepository _userRepository;

  StreamSubscription? _subscription;

  UserCubit({
    required User? preloadUser,
    required IUserRepository userRepository,
  }) : _userRepository = userRepository,
       super(
         UserState(
           user: preloadUser,
         ),
       ) {
    _subscription = _userRepository.currentUserStream().listen(
      (user) {
        emit(
          state.copyWith(
            user: user,
            status: UserStatus.loaded,
          ),
        );
      },
      onError: (err) {
        emit(
          state.copyWith(
            errorMessage: err.toString(),
            status: UserStatus.failed,
          ),
        );
      },
    );
  }

  String? get uid {
    final state = this.state;
    return state.user?.uid;
  }

  @override
  Future<void> close() {
    _subscription?.cancel();
    return super.close();
  }
}
