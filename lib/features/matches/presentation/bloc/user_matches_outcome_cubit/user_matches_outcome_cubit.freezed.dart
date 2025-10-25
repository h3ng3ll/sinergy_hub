// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_matches_outcome_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$UserMatchesOutcomeState {

 UserMatchesOutcomeStatus get status; dynamic get errorMessage; List<UserMatch> get userMatches; UserMatch? get activeMatch;
/// Create a copy of UserMatchesOutcomeState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserMatchesOutcomeStateCopyWith<UserMatchesOutcomeState> get copyWith => _$UserMatchesOutcomeStateCopyWithImpl<UserMatchesOutcomeState>(this as UserMatchesOutcomeState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserMatchesOutcomeState&&(identical(other.status, status) || other.status == status)&&const DeepCollectionEquality().equals(other.errorMessage, errorMessage)&&const DeepCollectionEquality().equals(other.userMatches, userMatches)&&(identical(other.activeMatch, activeMatch) || other.activeMatch == activeMatch));
}


@override
int get hashCode => Object.hash(runtimeType,status,const DeepCollectionEquality().hash(errorMessage),const DeepCollectionEquality().hash(userMatches),activeMatch);

@override
String toString() {
  return 'UserMatchesOutcomeState(status: $status, errorMessage: $errorMessage, userMatches: $userMatches, activeMatch: $activeMatch)';
}


}

/// @nodoc
abstract mixin class $UserMatchesOutcomeStateCopyWith<$Res>  {
  factory $UserMatchesOutcomeStateCopyWith(UserMatchesOutcomeState value, $Res Function(UserMatchesOutcomeState) _then) = _$UserMatchesOutcomeStateCopyWithImpl;
@useResult
$Res call({
 UserMatchesOutcomeStatus status, dynamic errorMessage, List<UserMatch> userMatches, UserMatch? activeMatch
});


$UserMatchCopyWith<$Res>? get activeMatch;

}
/// @nodoc
class _$UserMatchesOutcomeStateCopyWithImpl<$Res>
    implements $UserMatchesOutcomeStateCopyWith<$Res> {
  _$UserMatchesOutcomeStateCopyWithImpl(this._self, this._then);

  final UserMatchesOutcomeState _self;
  final $Res Function(UserMatchesOutcomeState) _then;

/// Create a copy of UserMatchesOutcomeState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = null,Object? errorMessage = freezed,Object? userMatches = null,Object? activeMatch = freezed,}) {
  return _then(_self.copyWith(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as UserMatchesOutcomeStatus,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as dynamic,userMatches: null == userMatches ? _self.userMatches : userMatches // ignore: cast_nullable_to_non_nullable
as List<UserMatch>,activeMatch: freezed == activeMatch ? _self.activeMatch : activeMatch // ignore: cast_nullable_to_non_nullable
as UserMatch?,
  ));
}
/// Create a copy of UserMatchesOutcomeState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserMatchCopyWith<$Res>? get activeMatch {
    if (_self.activeMatch == null) {
    return null;
  }

  return $UserMatchCopyWith<$Res>(_self.activeMatch!, (value) {
    return _then(_self.copyWith(activeMatch: value));
  });
}
}


/// Adds pattern-matching-related methods to [UserMatchesOutcomeState].
extension UserMatchesOutcomeStatePatterns on UserMatchesOutcomeState {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UserMatchesOutcomeState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UserMatchesOutcomeState() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UserMatchesOutcomeState value)  $default,){
final _that = this;
switch (_that) {
case _UserMatchesOutcomeState():
return $default(_that);}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UserMatchesOutcomeState value)?  $default,){
final _that = this;
switch (_that) {
case _UserMatchesOutcomeState() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( UserMatchesOutcomeStatus status,  dynamic errorMessage,  List<UserMatch> userMatches,  UserMatch? activeMatch)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UserMatchesOutcomeState() when $default != null:
return $default(_that.status,_that.errorMessage,_that.userMatches,_that.activeMatch);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( UserMatchesOutcomeStatus status,  dynamic errorMessage,  List<UserMatch> userMatches,  UserMatch? activeMatch)  $default,) {final _that = this;
switch (_that) {
case _UserMatchesOutcomeState():
return $default(_that.status,_that.errorMessage,_that.userMatches,_that.activeMatch);}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( UserMatchesOutcomeStatus status,  dynamic errorMessage,  List<UserMatch> userMatches,  UserMatch? activeMatch)?  $default,) {final _that = this;
switch (_that) {
case _UserMatchesOutcomeState() when $default != null:
return $default(_that.status,_that.errorMessage,_that.userMatches,_that.activeMatch);case _:
  return null;

}
}

}

/// @nodoc


class _UserMatchesOutcomeState implements UserMatchesOutcomeState {
  const _UserMatchesOutcomeState({this.status = UserMatchesOutcomeStatus.initial, this.errorMessage = '', final  List<UserMatch> userMatches = const [], this.activeMatch}): _userMatches = userMatches;
  

@override@JsonKey() final  UserMatchesOutcomeStatus status;
@override@JsonKey() final  dynamic errorMessage;
 final  List<UserMatch> _userMatches;
@override@JsonKey() List<UserMatch> get userMatches {
  if (_userMatches is EqualUnmodifiableListView) return _userMatches;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_userMatches);
}

@override final  UserMatch? activeMatch;

/// Create a copy of UserMatchesOutcomeState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UserMatchesOutcomeStateCopyWith<_UserMatchesOutcomeState> get copyWith => __$UserMatchesOutcomeStateCopyWithImpl<_UserMatchesOutcomeState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UserMatchesOutcomeState&&(identical(other.status, status) || other.status == status)&&const DeepCollectionEquality().equals(other.errorMessage, errorMessage)&&const DeepCollectionEquality().equals(other._userMatches, _userMatches)&&(identical(other.activeMatch, activeMatch) || other.activeMatch == activeMatch));
}


@override
int get hashCode => Object.hash(runtimeType,status,const DeepCollectionEquality().hash(errorMessage),const DeepCollectionEquality().hash(_userMatches),activeMatch);

@override
String toString() {
  return 'UserMatchesOutcomeState(status: $status, errorMessage: $errorMessage, userMatches: $userMatches, activeMatch: $activeMatch)';
}


}

/// @nodoc
abstract mixin class _$UserMatchesOutcomeStateCopyWith<$Res> implements $UserMatchesOutcomeStateCopyWith<$Res> {
  factory _$UserMatchesOutcomeStateCopyWith(_UserMatchesOutcomeState value, $Res Function(_UserMatchesOutcomeState) _then) = __$UserMatchesOutcomeStateCopyWithImpl;
@override @useResult
$Res call({
 UserMatchesOutcomeStatus status, dynamic errorMessage, List<UserMatch> userMatches, UserMatch? activeMatch
});


@override $UserMatchCopyWith<$Res>? get activeMatch;

}
/// @nodoc
class __$UserMatchesOutcomeStateCopyWithImpl<$Res>
    implements _$UserMatchesOutcomeStateCopyWith<$Res> {
  __$UserMatchesOutcomeStateCopyWithImpl(this._self, this._then);

  final _UserMatchesOutcomeState _self;
  final $Res Function(_UserMatchesOutcomeState) _then;

/// Create a copy of UserMatchesOutcomeState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = null,Object? errorMessage = freezed,Object? userMatches = null,Object? activeMatch = freezed,}) {
  return _then(_UserMatchesOutcomeState(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as UserMatchesOutcomeStatus,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as dynamic,userMatches: null == userMatches ? _self._userMatches : userMatches // ignore: cast_nullable_to_non_nullable
as List<UserMatch>,activeMatch: freezed == activeMatch ? _self.activeMatch : activeMatch // ignore: cast_nullable_to_non_nullable
as UserMatch?,
  ));
}

/// Create a copy of UserMatchesOutcomeState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserMatchCopyWith<$Res>? get activeMatch {
    if (_self.activeMatch == null) {
    return null;
  }

  return $UserMatchCopyWith<$Res>(_self.activeMatch!, (value) {
    return _then(_self.copyWith(activeMatch: value));
  });
}
}

// dart format on
