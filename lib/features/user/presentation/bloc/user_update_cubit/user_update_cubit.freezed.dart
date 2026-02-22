// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_update_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$UserUpdateState {

 UserData? get userData; UserUpdateStatus get status; String get errorMessage;
/// Create a copy of UserUpdateState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserUpdateStateCopyWith<UserUpdateState> get copyWith => _$UserUpdateStateCopyWithImpl<UserUpdateState>(this as UserUpdateState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserUpdateState&&(identical(other.userData, userData) || other.userData == userData)&&(identical(other.status, status) || other.status == status)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,userData,status,errorMessage);

@override
String toString() {
  return 'UserUpdateState(userData: $userData, status: $status, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class $UserUpdateStateCopyWith<$Res>  {
  factory $UserUpdateStateCopyWith(UserUpdateState value, $Res Function(UserUpdateState) _then) = _$UserUpdateStateCopyWithImpl;
@useResult
$Res call({
 UserData? userData, UserUpdateStatus status, String errorMessage
});


$UserDataCopyWith<$Res>? get userData;

}
/// @nodoc
class _$UserUpdateStateCopyWithImpl<$Res>
    implements $UserUpdateStateCopyWith<$Res> {
  _$UserUpdateStateCopyWithImpl(this._self, this._then);

  final UserUpdateState _self;
  final $Res Function(UserUpdateState) _then;

/// Create a copy of UserUpdateState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? userData = freezed,Object? status = null,Object? errorMessage = null,}) {
  return _then(_self.copyWith(
userData: freezed == userData ? _self.userData : userData // ignore: cast_nullable_to_non_nullable
as UserData?,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as UserUpdateStatus,errorMessage: null == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String,
  ));
}
/// Create a copy of UserUpdateState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserDataCopyWith<$Res>? get userData {
    if (_self.userData == null) {
    return null;
  }

  return $UserDataCopyWith<$Res>(_self.userData!, (value) {
    return _then(_self.copyWith(userData: value));
  });
}
}


/// Adds pattern-matching-related methods to [UserUpdateState].
extension UserUpdateStatePatterns on UserUpdateState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UserUpdateState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UserUpdateState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UserUpdateState value)  $default,){
final _that = this;
switch (_that) {
case _UserUpdateState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UserUpdateState value)?  $default,){
final _that = this;
switch (_that) {
case _UserUpdateState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( UserData? userData,  UserUpdateStatus status,  String errorMessage)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UserUpdateState() when $default != null:
return $default(_that.userData,_that.status,_that.errorMessage);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( UserData? userData,  UserUpdateStatus status,  String errorMessage)  $default,) {final _that = this;
switch (_that) {
case _UserUpdateState():
return $default(_that.userData,_that.status,_that.errorMessage);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( UserData? userData,  UserUpdateStatus status,  String errorMessage)?  $default,) {final _that = this;
switch (_that) {
case _UserUpdateState() when $default != null:
return $default(_that.userData,_that.status,_that.errorMessage);case _:
  return null;

}
}

}

/// @nodoc


class _UserUpdateState implements UserUpdateState {
  const _UserUpdateState({this.userData, this.status = UserUpdateStatus.initial, this.errorMessage = ''});
  

@override final  UserData? userData;
@override@JsonKey() final  UserUpdateStatus status;
@override@JsonKey() final  String errorMessage;

/// Create a copy of UserUpdateState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UserUpdateStateCopyWith<_UserUpdateState> get copyWith => __$UserUpdateStateCopyWithImpl<_UserUpdateState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UserUpdateState&&(identical(other.userData, userData) || other.userData == userData)&&(identical(other.status, status) || other.status == status)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,userData,status,errorMessage);

@override
String toString() {
  return 'UserUpdateState(userData: $userData, status: $status, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class _$UserUpdateStateCopyWith<$Res> implements $UserUpdateStateCopyWith<$Res> {
  factory _$UserUpdateStateCopyWith(_UserUpdateState value, $Res Function(_UserUpdateState) _then) = __$UserUpdateStateCopyWithImpl;
@override @useResult
$Res call({
 UserData? userData, UserUpdateStatus status, String errorMessage
});


@override $UserDataCopyWith<$Res>? get userData;

}
/// @nodoc
class __$UserUpdateStateCopyWithImpl<$Res>
    implements _$UserUpdateStateCopyWith<$Res> {
  __$UserUpdateStateCopyWithImpl(this._self, this._then);

  final _UserUpdateState _self;
  final $Res Function(_UserUpdateState) _then;

/// Create a copy of UserUpdateState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? userData = freezed,Object? status = null,Object? errorMessage = null,}) {
  return _then(_UserUpdateState(
userData: freezed == userData ? _self.userData : userData // ignore: cast_nullable_to_non_nullable
as UserData?,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as UserUpdateStatus,errorMessage: null == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

/// Create a copy of UserUpdateState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserDataCopyWith<$Res>? get userData {
    if (_self.userData == null) {
    return null;
  }

  return $UserDataCopyWith<$Res>(_self.userData!, (value) {
    return _then(_self.copyWith(userData: value));
  });
}
}

// dart format on
