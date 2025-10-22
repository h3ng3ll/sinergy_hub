import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../core/models/pageable/pageable.dart';
import '../user_data/user_data.dart';

part 'users_data_pg_state.g.dart';

part 'users_data_pg_state.freezed.dart';

@freezed
sealed class UserDataPgState with _$UserDataPgState implements  Pageable<UserData>{
  const factory UserDataPgState({
    @Default(0) int startIndex,
    @Default(10) int pageSize,
    @Default([]) List<UserData> items,
  }) = _UsersDataPgState;

  factory UserDataPgState.fromJson(
    Map<String, dynamic> json,
  ) => _$UserDataPgStateFromJson(
    json,
  );
}
