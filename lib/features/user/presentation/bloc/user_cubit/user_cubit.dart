import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../domain/models/user_data/user_data.dart';
import '../../../domain/repositories/i_user_repository.dart';

part 'user_state.dart';

part 'user_cubit.freezed.dart';

class UserCubit extends Cubit<UserState> {
  final IUserRepository _userRepository;

  StreamSubscription? _userSubscription;
  StreamSubscription? _userDataSubscription;

  UserCubit({
    required User? preloadUser,
    required IUserRepository userRepository,
  }) : _userRepository = userRepository,
       super(
         UserState(
           user: preloadUser,
         ),
       ) {
    _userSubscription = _userRepository.currentUserStream().listen(
      (user) {
        if (user != null && _userDataSubscription == null) {
          _subscribeUserData(
            user.uid,
          );
        } else {
          _userDataSubscription?.cancel();
        }

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

  void _subscribeUserData(
    String uid,
  ) {
    _userDataSubscription?.cancel();
    _userDataSubscription = _userRepository
        .userDataStream(
          uid,
        )
        .listen((userData) {
          emit(
            state.copyWith(
              userData: userData,
            ),
          );
        });
  }

  @override
  Future<void> close() {
    _userDataSubscription?.cancel();
    _userSubscription?.cancel();
    return super.close();
  }
}
