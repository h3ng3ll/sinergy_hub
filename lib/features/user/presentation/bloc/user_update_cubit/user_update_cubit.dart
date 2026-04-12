import 'dart:typed_data';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../domain/models/user_data/user_data.dart';
import '../../../domain/usecases/update_user_usecase.dart';

part 'user_update_state.dart';

part 'user_update_cubit.freezed.dart';

class UserUpdateCubit extends Cubit<UserUpdateState> {
  final UpdateUserUseCase _updateUserUseCase;

  UserUpdateCubit({
    required UpdateUserUseCase updateUserUseCase,
  }) : _updateUserUseCase = updateUserUseCase,
       super(
         const UserUpdateState(),
       );

  /// Set userData on the view of given
  /// UserData instance
  Future<void> update(
    UserData user,
    Uint8List? img,
  ) async {
    if (state.status == UserUpdateStatus.loading) return;
    emit(
      state.copyWith(
        status: UserUpdateStatus.loading,
      ),
    );

    final result = await _updateUserUseCase.call(user, img);

    result.fold(
      (_) {
        emit(
          state.copyWith(
            status: UserUpdateStatus.initial,
          ),
        );
      },
      (failure) {
        emit(
          state.copyWith(
            errorMessage: failure.message,
            status: UserUpdateStatus.failed,
          ),
        );
      },
    );
  }
}
