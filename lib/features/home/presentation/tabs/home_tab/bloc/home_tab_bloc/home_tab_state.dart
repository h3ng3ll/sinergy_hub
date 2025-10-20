part of 'home_tab_bloc.dart';

enum HomeTabStatus {
  initial,
  loading,
  failed,
}

@freezed
sealed class HomeTabState with _$HomeTabState {
  const factory HomeTabState({
    @Default(HomeTabStatus.loading) HomeTabStatus status,
  }) = _HomeTabState;
}
