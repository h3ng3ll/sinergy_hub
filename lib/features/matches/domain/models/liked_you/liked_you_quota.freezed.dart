// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'liked_you_quota.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$LikedYouQuota {

@JsonKey(unknownEnumValue: ELikedYouQuotaPeriod.weekly) ELikedYouQuotaPeriod get period; int get limit; int get used; int get remaining; DateTime? get resetsAt; bool get isUnlimited;
/// Create a copy of LikedYouQuota
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LikedYouQuotaCopyWith<LikedYouQuota> get copyWith => _$LikedYouQuotaCopyWithImpl<LikedYouQuota>(this as LikedYouQuota, _$identity);

  /// Serializes this LikedYouQuota to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LikedYouQuota&&(identical(other.period, period) || other.period == period)&&(identical(other.limit, limit) || other.limit == limit)&&(identical(other.used, used) || other.used == used)&&(identical(other.remaining, remaining) || other.remaining == remaining)&&(identical(other.resetsAt, resetsAt) || other.resetsAt == resetsAt)&&(identical(other.isUnlimited, isUnlimited) || other.isUnlimited == isUnlimited));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,period,limit,used,remaining,resetsAt,isUnlimited);

@override
String toString() {
  return 'LikedYouQuota(period: $period, limit: $limit, used: $used, remaining: $remaining, resetsAt: $resetsAt, isUnlimited: $isUnlimited)';
}


}

/// @nodoc
abstract mixin class $LikedYouQuotaCopyWith<$Res>  {
  factory $LikedYouQuotaCopyWith(LikedYouQuota value, $Res Function(LikedYouQuota) _then) = _$LikedYouQuotaCopyWithImpl;
@useResult
$Res call({
@JsonKey(unknownEnumValue: ELikedYouQuotaPeriod.weekly) ELikedYouQuotaPeriod period, int limit, int used, int remaining, DateTime? resetsAt, bool isUnlimited
});




}
/// @nodoc
class _$LikedYouQuotaCopyWithImpl<$Res>
    implements $LikedYouQuotaCopyWith<$Res> {
  _$LikedYouQuotaCopyWithImpl(this._self, this._then);

  final LikedYouQuota _self;
  final $Res Function(LikedYouQuota) _then;

/// Create a copy of LikedYouQuota
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? period = null,Object? limit = null,Object? used = null,Object? remaining = null,Object? resetsAt = freezed,Object? isUnlimited = null,}) {
  return _then(_self.copyWith(
period: null == period ? _self.period : period // ignore: cast_nullable_to_non_nullable
as ELikedYouQuotaPeriod,limit: null == limit ? _self.limit : limit // ignore: cast_nullable_to_non_nullable
as int,used: null == used ? _self.used : used // ignore: cast_nullable_to_non_nullable
as int,remaining: null == remaining ? _self.remaining : remaining // ignore: cast_nullable_to_non_nullable
as int,resetsAt: freezed == resetsAt ? _self.resetsAt : resetsAt // ignore: cast_nullable_to_non_nullable
as DateTime?,isUnlimited: null == isUnlimited ? _self.isUnlimited : isUnlimited // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [LikedYouQuota].
extension LikedYouQuotaPatterns on LikedYouQuota {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _LikedYouQuota value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LikedYouQuota() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _LikedYouQuota value)  $default,){
final _that = this;
switch (_that) {
case _LikedYouQuota():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _LikedYouQuota value)?  $default,){
final _that = this;
switch (_that) {
case _LikedYouQuota() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(unknownEnumValue: ELikedYouQuotaPeriod.weekly)  ELikedYouQuotaPeriod period,  int limit,  int used,  int remaining,  DateTime? resetsAt,  bool isUnlimited)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LikedYouQuota() when $default != null:
return $default(_that.period,_that.limit,_that.used,_that.remaining,_that.resetsAt,_that.isUnlimited);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(unknownEnumValue: ELikedYouQuotaPeriod.weekly)  ELikedYouQuotaPeriod period,  int limit,  int used,  int remaining,  DateTime? resetsAt,  bool isUnlimited)  $default,) {final _that = this;
switch (_that) {
case _LikedYouQuota():
return $default(_that.period,_that.limit,_that.used,_that.remaining,_that.resetsAt,_that.isUnlimited);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(unknownEnumValue: ELikedYouQuotaPeriod.weekly)  ELikedYouQuotaPeriod period,  int limit,  int used,  int remaining,  DateTime? resetsAt,  bool isUnlimited)?  $default,) {final _that = this;
switch (_that) {
case _LikedYouQuota() when $default != null:
return $default(_that.period,_that.limit,_that.used,_that.remaining,_that.resetsAt,_that.isUnlimited);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(anyMap: true)
class _LikedYouQuota implements LikedYouQuota {
  const _LikedYouQuota({@JsonKey(unknownEnumValue: ELikedYouQuotaPeriod.weekly) this.period = ELikedYouQuotaPeriod.weekly, this.limit = 0, this.used = 0, this.remaining = 0, this.resetsAt, this.isUnlimited = false});
  factory _LikedYouQuota.fromJson(Map<String, dynamic> json) => _$LikedYouQuotaFromJson(json);

@override@JsonKey(unknownEnumValue: ELikedYouQuotaPeriod.weekly) final  ELikedYouQuotaPeriod period;
@override@JsonKey() final  int limit;
@override@JsonKey() final  int used;
@override@JsonKey() final  int remaining;
@override final  DateTime? resetsAt;
@override@JsonKey() final  bool isUnlimited;

/// Create a copy of LikedYouQuota
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LikedYouQuotaCopyWith<_LikedYouQuota> get copyWith => __$LikedYouQuotaCopyWithImpl<_LikedYouQuota>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$LikedYouQuotaToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LikedYouQuota&&(identical(other.period, period) || other.period == period)&&(identical(other.limit, limit) || other.limit == limit)&&(identical(other.used, used) || other.used == used)&&(identical(other.remaining, remaining) || other.remaining == remaining)&&(identical(other.resetsAt, resetsAt) || other.resetsAt == resetsAt)&&(identical(other.isUnlimited, isUnlimited) || other.isUnlimited == isUnlimited));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,period,limit,used,remaining,resetsAt,isUnlimited);

@override
String toString() {
  return 'LikedYouQuota(period: $period, limit: $limit, used: $used, remaining: $remaining, resetsAt: $resetsAt, isUnlimited: $isUnlimited)';
}


}

/// @nodoc
abstract mixin class _$LikedYouQuotaCopyWith<$Res> implements $LikedYouQuotaCopyWith<$Res> {
  factory _$LikedYouQuotaCopyWith(_LikedYouQuota value, $Res Function(_LikedYouQuota) _then) = __$LikedYouQuotaCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(unknownEnumValue: ELikedYouQuotaPeriod.weekly) ELikedYouQuotaPeriod period, int limit, int used, int remaining, DateTime? resetsAt, bool isUnlimited
});




}
/// @nodoc
class __$LikedYouQuotaCopyWithImpl<$Res>
    implements _$LikedYouQuotaCopyWith<$Res> {
  __$LikedYouQuotaCopyWithImpl(this._self, this._then);

  final _LikedYouQuota _self;
  final $Res Function(_LikedYouQuota) _then;

/// Create a copy of LikedYouQuota
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? period = null,Object? limit = null,Object? used = null,Object? remaining = null,Object? resetsAt = freezed,Object? isUnlimited = null,}) {
  return _then(_LikedYouQuota(
period: null == period ? _self.period : period // ignore: cast_nullable_to_non_nullable
as ELikedYouQuotaPeriod,limit: null == limit ? _self.limit : limit // ignore: cast_nullable_to_non_nullable
as int,used: null == used ? _self.used : used // ignore: cast_nullable_to_non_nullable
as int,remaining: null == remaining ? _self.remaining : remaining // ignore: cast_nullable_to_non_nullable
as int,resetsAt: freezed == resetsAt ? _self.resetsAt : resetsAt // ignore: cast_nullable_to_non_nullable
as DateTime?,isUnlimited: null == isUnlimited ? _self.isUnlimited : isUnlimited // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
