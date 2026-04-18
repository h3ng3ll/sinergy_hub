import 'dart:ui';

import 'package:bloc/bloc.dart';
import 'package:flutter/gestures.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'tinder_card_state.dart';

part 'tinder_card_cubit.freezed.dart';

class TinderCardCubit extends Cubit<TinderCardState> {
  TinderCardCubit({
    required Size size,
  }) : super(
         TinderCardState(
           cardSize: size,
         ),
       );

  void onPanUpdate(DragUpdateDetails details) {
    final position = state.position + details.delta;
    late final TinderCardStatus status = _getStatus(
      position,
    );

    emit(
      state.copyWith(
        position: position, // move card
        rotation: 45 * position.dx / state.cardSize.width,

        status: status,

        /// angle offset depend on X
      ),
    );
  }

  void _reset() {
    emit(
      state.copyWith(
        status: TinderCardStatus.none,
        isDragging: false,
        position: Offset.zero,
        rotation: 0.0,
      ),
    );
  }

  TinderCardStatus _getStatus(Offset position) {
    late final TinderCardStatus status;
    final offset = 75.0;

    /// right
    if (position.dx > offset) {
      status = TinderCardStatus.liked;
    } else if (position.dx < -offset) {
      status = TinderCardStatus.reject;
    } else {
      status = TinderCardStatus.none;
    }

    return status;
  }

  /// if Trigger then return the status
  Future<TinderCardStatus> onPanEnd(DragEndDetails details) async {
    emit(
      state.copyWith(
        isDragging: false,
      ),
    );
    final position = state.position;
    late final TinderCardStatus status = _getStatus(
      position,
    );
    switch (status) {
      case TinderCardStatus.liked:
        _likeStatus();
        break;
      case TinderCardStatus.reject:
        break;
      case TinderCardStatus.none:
        break;
    }

    _reset();

    // /// ensure animation finished
    // await Future.delayed(
    //   Duration(
    //     milliseconds: 200,
    //   ),
    // );
    return status;
  }

  void _likeStatus() {
    emit(
      state.copyWith(
        rotation: 20,
        position:
            state.position +
            Offset(
              2 * state.cardSize.width,
              0.0,
            ),
      ),
    );
  }

  void onPanStart(DragStartDetails details) {
    final position = state.position;
    _getStatus(
      position,
    );

    emit(
      state.copyWith(
        isDragging: true,
        // status: status,
      ),
    );
    // _reset();
    // return status;
  }
}
