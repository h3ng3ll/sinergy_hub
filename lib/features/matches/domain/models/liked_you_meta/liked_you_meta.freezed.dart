// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'liked_you_meta.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$LikedYouMeta {

 int get pendingCount;@TimestampConverter() DateTime get updatedAt;
/// Create a copy of LikedYouMeta
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LikedYouMetaCopyWith<LikedYouMeta> get copyWith => _$LikedYouMetaCopyWithImpl<LikedYouMeta>(this as LikedYouMeta, _$identity);

  /// Serializes this LikedYouMeta to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LikedYouMeta&&(identical(other.pendingCount, pendingCount) || other.pendingCount == pendingCount)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,pendingCount,updatedAt);

@override
String toString() {
  return 'LikedYouMeta(pendingCount: $pendingCount, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $LikedYouMetaCopyWith<$Res>  {
  factory $LikedYouMetaCopyWith(LikedYouMeta value, $Res Function(LikedYouMeta) _then) = _$LikedYouMetaCopyWithImpl;
@useResult
$Res call({
 int pendingCount,@TimestampConverter() DateTime updatedAt
});




}
/// @nodoc
class _$LikedYouMetaCopyWithImpl<$Res>
    implements $LikedYouMetaCopyWith<$Res> {
  _$LikedYouMetaCopyWithImpl(this._self, this._then);

  final LikedYouMeta _self;
  final $Res Function(LikedYouMeta) _then;

/// Create a copy of LikedYouMeta
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? pendingCount = null,Object? updatedAt = null,}) {
  return _then(_self.copyWith(
pendingCount: null == pendingCount ? _self.pendingCount : pendingCount // ignore: cast_nullable_to_non_nullable
as int,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [LikedYouMeta].
extension LikedYouMetaPatterns on LikedYouMeta {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _LikedYouMeta value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LikedYouMeta() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _LikedYouMeta value)  $default,){
final _that = this;
switch (_that) {
case _LikedYouMeta():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _LikedYouMeta value)?  $default,){
final _that = this;
switch (_that) {
case _LikedYouMeta() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int pendingCount, @TimestampConverter()  DateTime updatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LikedYouMeta() when $default != null:
return $default(_that.pendingCount,_that.updatedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int pendingCount, @TimestampConverter()  DateTime updatedAt)  $default,) {final _that = this;
switch (_that) {
case _LikedYouMeta():
return $default(_that.pendingCount,_that.updatedAt);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int pendingCount, @TimestampConverter()  DateTime updatedAt)?  $default,) {final _that = this;
switch (_that) {
case _LikedYouMeta() when $default != null:
return $default(_that.pendingCount,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _LikedYouMeta implements LikedYouMeta {
  const _LikedYouMeta({this.pendingCount = 0, @TimestampConverter() required this.updatedAt});
  factory _LikedYouMeta.fromJson(Map<String, dynamic> json) => _$LikedYouMetaFromJson(json);

@override@JsonKey() final  int pendingCount;
@override@TimestampConverter() final  DateTime updatedAt;

/// Create a copy of LikedYouMeta
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LikedYouMetaCopyWith<_LikedYouMeta> get copyWith => __$LikedYouMetaCopyWithImpl<_LikedYouMeta>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$LikedYouMetaToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LikedYouMeta&&(identical(other.pendingCount, pendingCount) || other.pendingCount == pendingCount)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,pendingCount,updatedAt);

@override
String toString() {
  return 'LikedYouMeta(pendingCount: $pendingCount, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$LikedYouMetaCopyWith<$Res> implements $LikedYouMetaCopyWith<$Res> {
  factory _$LikedYouMetaCopyWith(_LikedYouMeta value, $Res Function(_LikedYouMeta) _then) = __$LikedYouMetaCopyWithImpl;
@override @useResult
$Res call({
 int pendingCount,@TimestampConverter() DateTime updatedAt
});




}
/// @nodoc
class __$LikedYouMetaCopyWithImpl<$Res>
    implements _$LikedYouMetaCopyWith<$Res> {
  __$LikedYouMetaCopyWithImpl(this._self, this._then);

  final _LikedYouMeta _self;
  final $Res Function(_LikedYouMeta) _then;

/// Create a copy of LikedYouMeta
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? pendingCount = null,Object? updatedAt = null,}) {
  return _then(_LikedYouMeta(
pendingCount: null == pendingCount ? _self.pendingCount : pendingCount // ignore: cast_nullable_to_non_nullable
as int,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

// dart format on
