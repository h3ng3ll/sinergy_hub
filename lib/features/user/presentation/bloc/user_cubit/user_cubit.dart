import 'dart:async';
import 'dart:typed_data';

import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../domain/models/user_data/user_data.dart';
import '../../../domain/repositories/i_user_repository.dart';
import '../../../domain/usecases/update_user_usecase.dart';

part 'user_state.dart';

part 'user_cubit.freezed.dart';

class UserCubit extends Cubit<UserState> {
  final UpdateUserUseCase _updateUserUseCase;

  final IUserRepository _userRepository;

  StreamSubscription? _userSubscription;
  StreamSubscription? _userDataSubscription;

  UserCubit({
    required User? preloadUser,
    required IUserRepository userRepository,
    required UpdateUserUseCase updateUserUseCase,
  }) : _userRepository = userRepository,
       _updateUserUseCase = updateUserUseCase,
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

  /// Set userData on the view of given
  /// UserData instance
  Future<void> update(
    UserData user,
    Uint8List? img,
  ) async {
    try {
      emit(
        state.copyWith(
          status: UserStatus.loading,
        ),
      );
      await _updateUserUseCase.call(
        user,
        img,
      );
    } catch (e) {
      emit(
        state.copyWith(
          errorMessage: e.toString(),
          status: UserStatus.failed,
        ),
      );
      rethrow;
    }
  }

  void _subscribeUserData(
    String uid,
  ) {
    _userDataSubscription?.cancel();
    _userDataSubscription = _userRepository
        .userDataStream(
          uid,
        )
        .listen(
          (userData) {
            emit(
              state.copyWith(
                userData: userData,
                status: UserStatus.updated,
              ),
            );
          },
        );
  }

  @override
  Future<void> close() {
    _userDataSubscription?.cancel();
    _userSubscription?.cancel();
    return super.close();
  }
}
