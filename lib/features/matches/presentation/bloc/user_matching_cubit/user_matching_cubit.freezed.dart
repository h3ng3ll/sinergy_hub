// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_matching_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$UserMatchingState {

 List<UserMatch> get userMatches; String get errorMessage; UserMatchingStatus get status;
/// Create a copy of UserMatchingState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserMatchingStateCopyWith<UserMatchingState> get copyWith => _$UserMatchingStateCopyWithImpl<UserMatchingState>(this as UserMatchingState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserMatchingState&&const DeepCollectionEquality().equals(other.userMatches, userMatches)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage)&&(identical(other.status, status) || other.status == status));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(userMatches),errorMessage,status);

@override
String toString() {
  return 'UserMatchingState(userMatches: $userMatches, errorMessage: $errorMessage, status: $status)';
}


}

/// @nodoc
abstract mixin class $UserMatchingStateCopyWith<$Res>  {
  factory $UserMatchingStateCopyWith(UserMatchingState value, $Res Function(UserMatchingState) _then) = _$UserMatchingStateCopyWithImpl;
@useResult
$Res call({
 List<UserMatch> userMatches, String errorMessage, UserMatchingStatus status
});




}
/// @nodoc
class _$UserMatchingStateCopyWithImpl<$Res>
    implements $UserMatchingStateCopyWith<$Res> {
  _$UserMatchingStateCopyWithImpl(this._self, this._then);

  final UserMatchingState _self;
  final $Res Function(UserMatchingState) _then;

/// Create a copy of UserMatchingState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? userMatches = null,Object? errorMessage = null,Object? status = null,}) {
  return _then(_self.copyWith(
userMatches: null == userMatches ? _self.userMatches : userMatches // ignore: cast_nullable_to_non_nullable
as List<UserMatch>,errorMessage: null == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as UserMatchingStatus,
  ));
}

}


/// Adds pattern-matching-related methods to [UserMatchingState].
extension UserMatchingStatePatterns on UserMatchingState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UserMatchingState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UserMatchingState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UserMatchingState value)  $default,){
final _that = this;
switch (_that) {
case _UserMatchingState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UserMatchingState value)?  $default,){
final _that = this;
switch (_that) {
case _UserMatchingState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<UserMatch> userMatches,  String errorMessage,  UserMatchingStatus status)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UserMatchingState() when $default != null:
return $default(_that.userMatches,_that.errorMessage,_that.status);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<UserMatch> userMatches,  String errorMessage,  UserMatchingStatus status)  $default,) {final _that = this;
switch (_that) {
case _UserMatchingState():
return $default(_that.userMatches,_that.errorMessage,_that.status);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<UserMatch> userMatches,  String errorMessage,  UserMatchingStatus status)?  $default,) {final _that = this;
switch (_that) {
case _UserMatchingState() when $default != null:
return $default(_that.userMatches,_that.errorMessage,_that.status);case _:
  return null;

}
}

}

/// @nodoc


class _UserMatchingState implements UserMatchingState {
  const _UserMatchingState({final  List<UserMatch> userMatches = const [], this.errorMessage = '', this.status = UserMatchingStatus.loading}): _userMatches = userMatches;
  

 final  List<UserMatch> _userMatches;
@override@JsonKey() List<UserMatch> get userMatches {
  if (_userMatches is EqualUnmodifiableListView) return _userMatches;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_userMatches);
}

@override@JsonKey() final  String errorMessage;
@override@JsonKey() final  UserMatchingStatus status;

/// Create a copy of UserMatchingState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UserMatchingStateCopyWith<_UserMatchingState> get copyWith => __$UserMatchingStateCopyWithImpl<_UserMatchingState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UserMatchingState&&const DeepCollectionEquality().equals(other._userMatches, _userMatches)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage)&&(identical(other.status, status) || other.status == status));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_userMatches),errorMessage,status);

@override
String toString() {
  return 'UserMatchingState(userMatches: $userMatches, errorMessage: $errorMessage, status: $status)';
}


}

/// @nodoc
abstract mixin class _$UserMatchingStateCopyWith<$Res> implements $UserMatchingStateCopyWith<$Res> {
  factory _$UserMatchingStateCopyWith(_UserMatchingState value, $Res Function(_UserMatchingState) _then) = __$UserMatchingStateCopyWithImpl;
@override @useResult
$Res call({
 List<UserMatch> userMatches, String errorMessage, UserMatchingStatus status
});




}
/// @nodoc
class __$UserMatchingStateCopyWithImpl<$Res>
    implements _$UserMatchingStateCopyWith<$Res> {
  __$UserMatchingStateCopyWithImpl(this._self, this._then);

  final _UserMatchingState _self;
  final $Res Function(_UserMatchingState) _then;

/// Create a copy of UserMatchingState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? userMatches = null,Object? errorMessage = null,Object? status = null,}) {
  return _then(_UserMatchingState(
userMatches: null == userMatches ? _self._userMatches : userMatches // ignore: cast_nullable_to_non_nullable
as List<UserMatch>,errorMessage: null == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as UserMatchingStatus,
  ));
}


}

// dart format on
