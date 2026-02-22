import 'dart:typed_data';

import 'package:bloc/bloc.dart';
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
    try {
      emit(
        state.copyWith(
          status: UserUpdateStatus.loading,
        ),
      );
      await _updateUserUseCase.call(
        user,
        img,
      );
      emit(
        state.copyWith(
          status: UserUpdateStatus.initial,
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          errorMessage: e.toString(),
          status: UserUpdateStatus.failed,
        ),
      );
      rethrow;
    }
  }
}
