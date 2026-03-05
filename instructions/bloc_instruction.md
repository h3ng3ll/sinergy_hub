

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

State & Status Extensions Usage Instruction
1. Общий принцип

Во всех feature-модулях, где используется Bloc/Cubit и State, логика проверки статусов должна выноситься в extensions, а не писаться напрямую в UI.

Запрещено в UI:

if (state.status == EProjectStatus.loading) {}

Разрешено:

if (state.isLoading) {}
2. Структура State

Каждая feature должна иметь:

Enum со статусами

State с полем status

Extension для удобных геттеров

Пример для Project:

enum EProjectStatus {
initial,
loading,
success,
failed,
}
class ProjectState {
final EProjectStatus status;
final List<Project> projects;
final String? error;

const ProjectState({
required this.status,
this.projects = const [],
this.error,
});
}
3. Extension для State

Для каждого State создаётся extension с логическими геттерами.

Пример:

extension ProjectStateX on ProjectState {
bool get isInitial => status == EProjectStatus.initial;

bool get isLoading => status == EProjectStatus.loading;

bool get isSuccess => status == EProjectStatus.success;

bool get isFailed => status == EProjectStatus.failed;

bool get hasError => error != null && error!.isNotEmpty;

bool get hasProjects => projects.isNotEmpty;
}
4. Использование в UI

UI должен работать только через extension-геттеры.

Пример:

BlocBuilder<ProjectBloc, ProjectState>(
builder: (context, state) {
if (state.isLoading) {
return const Loader();
}

    if (state.isFailed) {
      return ErrorView(state.error);
    }

    if (state.isInitial && !state.hasProjects) {
      return const EmptyView();
    }

    return ProjectList(state.projects);
},
);

Без прямого обращения к enum.

5. Initial State Helpers

Для initial статуса также создаются вспомогательные геттеры.

Пример:

extension ProjectInitialX on ProjectState {
bool get isEmptyInitial =>
isInitial && projects.isEmpty && error == null;
}

Использование:

if (state.isEmptyInitial) {
return const EmptyView();
}
6. Названия Extension

Формат:

<Feature>StateX

Примеры:

ProjectStateX

AuthStateX

ChatStateX

CallStateX

7. Пример с CallState (эталон)
   enum ECallStatus {
   idle,
   calling,
   connected,
   failed,
   }
   class CallState {
   final ECallStatus status;

const CallState({required this.status});
}
extension CallStateX on CallState {
bool get isIdle => status == ECallStatus.idle;

bool get isCalling => status == ECallStatus.calling;

bool get isConnected => status == ECallStatus.connected;

bool get isFailed => status == ECallStatus.failed;
}
8. Обязательное правило проекта

Во всём проекте:

✅ Все проверки состояния → только через extension
❌ Прямые сравнения enum в UI → запрещены

9. Расширенные Computed Getters (Business Logic)

В extension допускается бизнес-логика, упрощающая UI.

Пример:

extension ProjectStateX on ProjectState {
bool get canCreateProject =>
!isLoading && !isFailed;

bool get canShowList =>
isSuccess && projects.isNotEmpty;

bool get showEmptyState =>
isSuccess && projects.isEmpty;
}

UI:

if (state.showEmptyState) {
return EmptyView();
}
10. Где хранить Extensions

Каждая feature:

feature/project/
bloc/
project_bloc.dart
project_state.dart
project_state_ext.dart

Extension выносится в отдельный файл:

*_state_ext.dart
Итоговое правило

Все State-статусы и их проверки инкапсулируются в extension-геттерах.
UI работает только с логическими флагами, а не с enum напрямую.
Это уменьшает дублирование, упрощает рефакторинг и делает код читаемым.