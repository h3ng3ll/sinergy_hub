import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rxdart/rxdart.dart';

import '../../../domain/models/premium_status/premium_status.dart';
import '../../../domain/usecases/identify_subscriber_use_case.dart';
import '../../../domain/usecases/watch_premium_status_use_case.dart';

part 'premium_event.dart';

part 'premium_state.dart';

part 'premium_state_ext.dart';

part 'premium_bloc.freezed.dart';

/// Global, app-lifetime subscription status. Dispatched ONLY from the
/// AuthBloc listener in main.dart, next to UserEvent.init/reset — never from
/// a screen's initState (see A3.8/A3.11 in the developer contract).
class PremiumBloc extends Bloc<PremiumEvent, PremiumState> {
  final IdentifySubscriberUseCase _identifySubscriberUseCase;
  final WatchPremiumStatusUseCase _watchPremiumStatusUseCase;

  PremiumBloc({
    required this._identifySubscriberUseCase,
    required this._watchPremiumStatusUseCase,
  }) : super(const PremiumState()) {
    on<PremiumEvent>(
      _onEvent,
      transformer: _switchOnDistinctUid,
    );
  }

  /// AuthBloc re-emits on every token refresh, so the same `init(uid)` arrives
  /// repeatedly. Consecutive duplicates are dropped, and any new event cancels
  /// the running Firestore subscription — a `reset` must stop listening to the
  /// previous user's document.
  static Stream<PremiumEvent> _switchOnDistinctUid(
    Stream<PremiumEvent> events,
    EventMapper<PremiumEvent> mapper,
  ) {
    return events
        .distinct(
          (prev, next) =>
              prev is _Init && next is _Init && prev.uid == next.uid,
        )
        .switchMap(mapper);
  }

  Future<void> _onEvent(
    PremiumEvent event,
    Emitter<PremiumState> emit,
  ) async {
    if (event is _Init) return _init(event, emit);
    if (event is _Reset) return _reset(event, emit);
  }

  Future<void> _init(
    _Init event,
    Emitter<PremiumState> emit,
  ) async {
    emit(
      state.copyWith(
        status: EPremiumStatus.loading,
      ),
    );

    await _identifySubscriberUseCase.logIn(event.uid);

    await emit.forEach<PremiumStatus?>(
      _watchPremiumStatusUseCase.call(uid: event.uid),
      onData: (premiumStatus) => state.copyWith(
        status: EPremiumStatus.ready,
        isPremium: premiumStatus?.isActive ?? false,
        premiumStatus: premiumStatus,
      ),
      onError: (e, _) => state.copyWith(
        status: EPremiumStatus.failed,
        errorMessage: e.toString(),
      ),
    );
  }

  Future<void> _reset(
    _Reset event,
    Emitter<PremiumState> emit,
  ) async {
    await _identifySubscriberUseCase.logOut();
    emit(const PremiumState());
  }
}
