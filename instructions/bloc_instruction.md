

# freezed_state template

    enum $NAME$Status {
        initial,
        loading,
        failed,
    }
        @freezed
        sealed class $NAME$State with _$$$NAME$State {
        const factory $NAME$State({
            @Default($NAME$Status.initial) $NAME$Status status,
            @Default('') String errorMessage,
        }) = _$NAME$State;
    }


# freezed_method
    void _$METHOD$(
            _$METHOD_PASCAL_CASE$ event,
            Emitter<$CLASS_NAME$State> emit,
        ) async {
        try {
        emit(
            state.copyWith(
                status: $CLASS_NAME$Status.loading,
            ),
        );
        emit(
            state.copyWith(
               status: $CLASS_NAME$Status.initial,
            ),
        );
        } catch (e) {
        emit(
            state.copyWith(
                status: $CLASS_NAME$Status.failed,
                errorMessage: e.toString(),
            ),
        );
        rethrow;
        }
    }

### freezed event creation
    const factory $CLASS_NAME$.$stateName$() = _$stateNameCamel$;

# For stream NEVER USE such pattern
-   streamListener + subscription
### freezed event creation
    const factory $CLASS_NAME$.$stateName$() = _$stateNameCamel$;

# For stream NEVER USE such pattern

- streamListener + subscription

## Instead of this use
    emit.forEach(
        stream,
        onData: (T data) {
            return emit(state.copyWith(
                status: ###.someStatus,
                ###: ###,
            );
        },
        onError:(e , _) {},
    );

# Examples 
## How to correctly wright (Trailing comma)
      emit(
        state.copyWith(
          localStream: _webRtcService.localStream,
          aCall: state.aCall?.copyWith(
            id: callId,
          ),
        ),
      );
## Incorrect  example:
      emit(
        state.copyWith(
          localStream: _webRtcService.localStream,
          aCall: state.aCall?.copyWith(id: callId),
        ),
      );


# Never call directly repositories inside bloc , you must create one layer of use case and its logic from there
## Bad example
      // Listen for ICE candidates from caller
      _callsRepository.listenCandidate(call.id).listen(
        (candidate) {
          _webRtcService.addIceCandidate(candidate);
        },
      );
## Good example
     emit.forEach(
        _listenCandidateUseCase.call(call.id),
        onData: (T data) {
             _webRtcService.addIceCandidate(candidate);
            return emit(state.copyWith(
                status: ###.someStatus,
                ###: ###,
            );
        },
        onError:(e , _) {
              return emit(state.copyWith(
                status: ###.someStatus,
                ###: ###,
            );
        },
    );
