import 'dart:ui';

import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../subscription/domain/usecases/watch_current_premium_status_use_case.dart';
import '../../../domain/models/background_palette/background_palette.dart';
import '../../../domain/usecases/get_background_palette_use_case.dart';
import '../../../domain/usecases/save_background_palette_use_case.dart';

part 'background_palette_event.dart';

part 'background_palette_state.dart';

part 'background_palette_state_ext.dart';

part 'background_palette_bloc.freezed.dart';

/// Global, app-lifetime background palette. `start` is dispatched once from
/// `main.dart`; `init` / `reset` come from the AuthBloc listener there, next
/// to `PremiumEvent.init` / `reset`.
class BackgroundPaletteBloc
    extends Bloc<BackgroundPaletteEvent, BackgroundPaletteState> {
  final GetBackgroundPaletteUseCase _getBackgroundPaletteUseCase;
  final SaveBackgroundPaletteUseCase _saveBackgroundPaletteUseCase;
  final WatchCurrentPremiumStatusUseCase _watchCurrentPremiumStatusUseCase;

  BackgroundPaletteBloc({
    required this._getBackgroundPaletteUseCase,
    required this._saveBackgroundPaletteUseCase,
    required this._watchCurrentPremiumStatusUseCase,
  }) : super(const BackgroundPaletteState()) {
    on<_Start>(
      _start,
      transformer: restartable(),
    );
    on<_Init>(
      _init,
      transformer: restartable(),
    );
    on<_Reset>(_reset);
    on<_SetPrimary>(
      _setPrimary,
      transformer: sequential(),
    );
    on<_SetSecondary>(
      _setSecondary,
      transformer: sequential(),
    );
    on<_ResetPalette>(
      _resetPalette,
      transformer: sequential(),
    );
  }

  Future<void> _start(
    _Start event,
    Emitter<BackgroundPaletteState> emit,
  ) {
    return emit.forEach(
      _watchCurrentPremiumStatusUseCase.call(),
      onData: (premiumStatus) => state.copyWith(
        isPremium: premiumStatus?.isActive ?? false,
      ),
      onError: (_, _) => state.copyWith(isPremium: false),
    );
  }

  /// AuthBloc re-emits on every token refresh, so the same uid arrives
  /// repeatedly — load only once per signed-in user.
  Future<void> _init(
    _Init event,
    Emitter<BackgroundPaletteState> emit,
  ) async {
    if (state.uid == event.uid && !state.isInitial) return;

    emit(
      state.copyWith(
        uid: event.uid,
        palette: null,
        status: EBackgroundPaletteStatus.loading,
      ),
    );

    final result = await _getBackgroundPaletteUseCase.call();

    result.fold(
      (palette) => emit(
        state.copyWith(
          palette: palette,
          status: EBackgroundPaletteStatus.ready,
          errorMessage: '',
        ),
      ),
      (failure) => emit(
        state.copyWith(
          status: EBackgroundPaletteStatus.failed,
          errorMessage: failure.message,
        ),
      ),
    );
  }

  void _reset(
    _Reset event,
    Emitter<BackgroundPaletteState> emit,
  ) {
    emit(
      BackgroundPaletteState(
        isPremium: state.isPremium,
      ),
    );
  }

  Future<void> _setPrimary(
    _SetPrimary event,
    Emitter<BackgroundPaletteState> emit,
  ) => _store(
    BackgroundPalette(
      primary: event.color,
      secondary: state.secondaryColor,
    ),
    emit,
  );

  Future<void> _setSecondary(
    _SetSecondary event,
    Emitter<BackgroundPaletteState> emit,
  ) => _store(
    BackgroundPalette(
      primary: state.primaryColor,
      secondary: event.color,
    ),
    emit,
  );

  Future<void> _resetPalette(
    _ResetPalette event,
    Emitter<BackgroundPaletteState> emit,
  ) => _store(null, emit);

  /// Applies [palette] immediately, then lets the server decide: the
  /// callable validates premium, and on any rejection the previous palette
  /// comes back. On success the server's normalized palette is kept.
  Future<void> _store(
    BackgroundPalette? palette,
    Emitter<BackgroundPaletteState> emit,
  ) async {
    final previous = state.palette;
    emit(
      state.copyWith(
        palette: palette,
        status: EBackgroundPaletteStatus.ready,
        errorMessage: '',
      ),
    );

    final result = await _saveBackgroundPaletteUseCase.call(
      palette: palette,
    );

    result.fold(
      (stored) => emit(
        state.copyWith(
          palette: stored,
        ),
      ),
      (failure) => emit(
        state.copyWith(
          palette: previous,
          status: EBackgroundPaletteStatus.failed,
          errorMessage: failure.message,
        ),
      ),
    );
  }
}
