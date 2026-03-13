import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../user_data/user_data.dart';

part 'users_data_pg_state.freezed.dart';

@freezed
sealed class UserDataPgState with _$UserDataPgState {
  const factory UserDataPgState({
    @Default(0) int startIndex,
    @Default(10) int pageSize,
    @Default(true) bool hasMore,

    /// Firebase field
    DocumentSnapshot? lastDocument,
    @Default({}) Set<String> excludedUids,
    @Default([]) List<UserData> items,
  }) = _UsersDataPgState;
}
