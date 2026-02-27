

### freezed_state template

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


### freezed_method

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