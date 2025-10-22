// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_match_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$UserMatchDto {

 String get userId; TinderCardStatus get matchStatus; EUserMatchCompleteness get completeness; DateTime get time;
/// Create a copy of UserMatchDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserMatchDtoCopyWith<UserMatchDto> get copyWith => _$UserMatchDtoCopyWithImpl<UserMatchDto>(this as UserMatchDto, _$identity);

  /// Serializes this UserMatchDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserMatchDto&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.matchStatus, matchStatus) || other.matchStatus == matchStatus)&&(identical(other.completeness, completeness) || other.completeness == completeness)&&(identical(other.time, time) || other.time == time));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,userId,matchStatus,completeness,time);

@override
String toString() {
  return 'UserMatchDto(userId: $userId, matchStatus: $matchStatus, completeness: $completeness, time: $time)';
}


}

/// @nodoc
abstract mixin class $UserMatchDtoCopyWith<$Res>  {
  factory $UserMatchDtoCopyWith(UserMatchDto value, $Res Function(UserMatchDto) _then) = _$UserMatchDtoCopyWithImpl;
@useResult
$Res call({
 String userId, TinderCardStatus matchStatus, EUserMatchCompleteness completeness, DateTime time
});




}
/// @nodoc
class _$UserMatchDtoCopyWithImpl<$Res>
    implements $UserMatchDtoCopyWith<$Res> {
  _$UserMatchDtoCopyWithImpl(this._self, this._then);

  final UserMatchDto _self;
  final $Res Function(UserMatchDto) _then;

/// Create a copy of UserMatchDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? userId = null,Object? matchStatus = null,Object? completeness = null,Object? time = null,}) {
  return _then(_self.copyWith(
userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,matchStatus: null == matchStatus ? _self.matchStatus : matchStatus // ignore: cast_nullable_to_non_nullable
as TinderCardStatus,completeness: null == completeness ? _self.completeness : completeness // ignore: cast_nullable_to_non_nullable
as EUserMatchCompleteness,time: null == time ? _self.time : time // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [UserMatchDto].
extension UserMatchDtoPatterns on UserMatchDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UserMatchDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UserMatchDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UserMatchDto value)  $default,){
final _that = this;
switch (_that) {
case _UserMatchDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UserMatchDto value)?  $default,){
final _that = this;
switch (_that) {
case _UserMatchDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String userId,  TinderCardStatus matchStatus,  EUserMatchCompleteness completeness,  DateTime time)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UserMatchDto() when $default != null:
return $default(_that.userId,_that.matchStatus,_that.completeness,_that.time);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String userId,  TinderCardStatus matchStatus,  EUserMatchCompleteness completeness,  DateTime time)  $default,) {final _that = this;
switch (_that) {
case _UserMatchDto():
return $default(_that.userId,_that.matchStatus,_that.completeness,_that.time);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String userId,  TinderCardStatus matchStatus,  EUserMatchCompleteness completeness,  DateTime time)?  $default,) {final _that = this;
switch (_that) {
case _UserMatchDto() when $default != null:
return $default(_that.userId,_that.matchStatus,_that.completeness,_that.time);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _UserMatchDto extends UserMatchDto {
  const _UserMatchDto({required this.userId, required this.matchStatus, required this.completeness, required this.time}): super._();
  factory _UserMatchDto.fromJson(Map<String, dynamic> json) => _$UserMatchDtoFromJson(json);

@override final  String userId;
@override final  TinderCardStatus matchStatus;
@override final  EUserMatchCompleteness completeness;
@override final  DateTime time;

/// Create a copy of UserMatchDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UserMatchDtoCopyWith<_UserMatchDto> get copyWith => __$UserMatchDtoCopyWithImpl<_UserMatchDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UserMatchDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UserMatchDto&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.matchStatus, matchStatus) || other.matchStatus == matchStatus)&&(identical(other.completeness, completeness) || other.completeness == completeness)&&(identical(other.time, time) || other.time == time));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,userId,matchStatus,completeness,time);

@override
String toString() {
  return 'UserMatchDto(userId: $userId, matchStatus: $matchStatus, completeness: $completeness, time: $time)';
}


}

/// @nodoc
abstract mixin class _$UserMatchDtoCopyWith<$Res> implements $UserMatchDtoCopyWith<$Res> {
  factory _$UserMatchDtoCopyWith(_UserMatchDto value, $Res Function(_UserMatchDto) _then) = __$UserMatchDtoCopyWithImpl;
@override @useResult
$Res call({
 String userId, TinderCardStatus matchStatus, EUserMatchCompleteness completeness, DateTime time
});




}
/// @nodoc
class __$UserMatchDtoCopyWithImpl<$Res>
    implements _$UserMatchDtoCopyWith<$Res> {
  __$UserMatchDtoCopyWithImpl(this._self, this._then);

  final _UserMatchDto _self;
  final $Res Function(_UserMatchDto) _then;

/// Create a copy of UserMatchDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? userId = null,Object? matchStatus = null,Object? completeness = null,Object? time = null,}) {
  return _then(_UserMatchDto(
userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,matchStatus: null == matchStatus ? _self.matchStatus : matchStatus // ignore: cast_nullable_to_non_nullable
as TinderCardStatus,completeness: null == completeness ? _self.completeness : completeness // ignore: cast_nullable_to_non_nullable
as EUserMatchCompleteness,time: null == time ? _self.time : time // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

// dart format on
