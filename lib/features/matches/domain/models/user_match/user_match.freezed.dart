// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_match.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$UserMatch {

 UserData get user; TinderCardStatus get status; DateTime get time; String get icon;
/// Create a copy of UserMatch
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserMatchCopyWith<UserMatch> get copyWith => _$UserMatchCopyWithImpl<UserMatch>(this as UserMatch, _$identity);

  /// Serializes this UserMatch to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserMatch&&(identical(other.user, user) || other.user == user)&&(identical(other.status, status) || other.status == status)&&(identical(other.time, time) || other.time == time)&&(identical(other.icon, icon) || other.icon == icon));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,user,status,time,icon);

@override
String toString() {
  return 'UserMatch(user: $user, status: $status, time: $time, icon: $icon)';
}


}

/// @nodoc
abstract mixin class $UserMatchCopyWith<$Res>  {
  factory $UserMatchCopyWith(UserMatch value, $Res Function(UserMatch) _then) = _$UserMatchCopyWithImpl;
@useResult
$Res call({
 UserData user, TinderCardStatus status, DateTime time, String icon
});


$UserDataCopyWith<$Res> get user;

}
/// @nodoc
class _$UserMatchCopyWithImpl<$Res>
    implements $UserMatchCopyWith<$Res> {
  _$UserMatchCopyWithImpl(this._self, this._then);

  final UserMatch _self;
  final $Res Function(UserMatch) _then;

/// Create a copy of UserMatch
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? user = null,Object? status = null,Object? time = null,Object? icon = null,}) {
  return _then(_self.copyWith(
user: null == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as UserData,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as TinderCardStatus,time: null == time ? _self.time : time // ignore: cast_nullable_to_non_nullable
as DateTime,icon: null == icon ? _self.icon : icon // ignore: cast_nullable_to_non_nullable
as String,
  ));
}
/// Create a copy of UserMatch
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserDataCopyWith<$Res> get user {
  
  return $UserDataCopyWith<$Res>(_self.user, (value) {
    return _then(_self.copyWith(user: value));
  });
}
}


/// Adds pattern-matching-related methods to [UserMatch].
extension UserMatchPatterns on UserMatch {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UserMatch value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UserMatch() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UserMatch value)  $default,){
final _that = this;
switch (_that) {
case _UserMatch():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UserMatch value)?  $default,){
final _that = this;
switch (_that) {
case _UserMatch() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( UserData user,  TinderCardStatus status,  DateTime time,  String icon)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UserMatch() when $default != null:
return $default(_that.user,_that.status,_that.time,_that.icon);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( UserData user,  TinderCardStatus status,  DateTime time,  String icon)  $default,) {final _that = this;
switch (_that) {
case _UserMatch():
return $default(_that.user,_that.status,_that.time,_that.icon);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( UserData user,  TinderCardStatus status,  DateTime time,  String icon)?  $default,) {final _that = this;
switch (_that) {
case _UserMatch() when $default != null:
return $default(_that.user,_that.status,_that.time,_that.icon);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _UserMatch implements UserMatch {
  const _UserMatch({required this.user, required this.status, required this.time, this.icon = ''});
  factory _UserMatch.fromJson(Map<String, dynamic> json) => _$UserMatchFromJson(json);

@override final  UserData user;
@override final  TinderCardStatus status;
@override final  DateTime time;
@override@JsonKey() final  String icon;

/// Create a copy of UserMatch
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UserMatchCopyWith<_UserMatch> get copyWith => __$UserMatchCopyWithImpl<_UserMatch>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UserMatchToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UserMatch&&(identical(other.user, user) || other.user == user)&&(identical(other.status, status) || other.status == status)&&(identical(other.time, time) || other.time == time)&&(identical(other.icon, icon) || other.icon == icon));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,user,status,time,icon);

@override
String toString() {
  return 'UserMatch(user: $user, status: $status, time: $time, icon: $icon)';
}


}

/// @nodoc
abstract mixin class _$UserMatchCopyWith<$Res> implements $UserMatchCopyWith<$Res> {
  factory _$UserMatchCopyWith(_UserMatch value, $Res Function(_UserMatch) _then) = __$UserMatchCopyWithImpl;
@override @useResult
$Res call({
 UserData user, TinderCardStatus status, DateTime time, String icon
});


@override $UserDataCopyWith<$Res> get user;

}
/// @nodoc
class __$UserMatchCopyWithImpl<$Res>
    implements _$UserMatchCopyWith<$Res> {
  __$UserMatchCopyWithImpl(this._self, this._then);

  final _UserMatch _self;
  final $Res Function(_UserMatch) _then;

/// Create a copy of UserMatch
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? user = null,Object? status = null,Object? time = null,Object? icon = null,}) {
  return _then(_UserMatch(
user: null == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as UserData,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as TinderCardStatus,time: null == time ? _self.time : time // ignore: cast_nullable_to_non_nullable
as DateTime,icon: null == icon ? _self.icon : icon // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

/// Create a copy of UserMatch
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserDataCopyWith<$Res> get user {
  
  return $UserDataCopyWith<$Res>(_self.user, (value) {
    return _then(_self.copyWith(user: value));
  });
}
}

// dart format on
