// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ice_candidate.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$IceCandidate {

 String get candidate; String? get sdpMid; int? get sdpMineIndex;
/// Create a copy of IceCandidate
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$IceCandidateCopyWith<IceCandidate> get copyWith => _$IceCandidateCopyWithImpl<IceCandidate>(this as IceCandidate, _$identity);

  /// Serializes this IceCandidate to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is IceCandidate&&(identical(other.candidate, candidate) || other.candidate == candidate)&&(identical(other.sdpMid, sdpMid) || other.sdpMid == sdpMid)&&(identical(other.sdpMineIndex, sdpMineIndex) || other.sdpMineIndex == sdpMineIndex));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,candidate,sdpMid,sdpMineIndex);

@override
String toString() {
  return 'IceCandidate(candidate: $candidate, sdpMid: $sdpMid, sdpMineIndex: $sdpMineIndex)';
}


}

/// @nodoc
abstract mixin class $IceCandidateCopyWith<$Res>  {
  factory $IceCandidateCopyWith(IceCandidate value, $Res Function(IceCandidate) _then) = _$IceCandidateCopyWithImpl;
@useResult
$Res call({
 String candidate, String? sdpMid, int? sdpMineIndex
});




}
/// @nodoc
class _$IceCandidateCopyWithImpl<$Res>
    implements $IceCandidateCopyWith<$Res> {
  _$IceCandidateCopyWithImpl(this._self, this._then);

  final IceCandidate _self;
  final $Res Function(IceCandidate) _then;

/// Create a copy of IceCandidate
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? candidate = null,Object? sdpMid = freezed,Object? sdpMineIndex = freezed,}) {
  return _then(_self.copyWith(
candidate: null == candidate ? _self.candidate : candidate // ignore: cast_nullable_to_non_nullable
as String,sdpMid: freezed == sdpMid ? _self.sdpMid : sdpMid // ignore: cast_nullable_to_non_nullable
as String?,sdpMineIndex: freezed == sdpMineIndex ? _self.sdpMineIndex : sdpMineIndex // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// Adds pattern-matching-related methods to [IceCandidate].
extension IceCandidatePatterns on IceCandidate {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _IceCandidate value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _IceCandidate() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _IceCandidate value)  $default,){
final _that = this;
switch (_that) {
case _IceCandidate():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _IceCandidate value)?  $default,){
final _that = this;
switch (_that) {
case _IceCandidate() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String candidate,  String? sdpMid,  int? sdpMineIndex)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _IceCandidate() when $default != null:
return $default(_that.candidate,_that.sdpMid,_that.sdpMineIndex);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String candidate,  String? sdpMid,  int? sdpMineIndex)  $default,) {final _that = this;
switch (_that) {
case _IceCandidate():
return $default(_that.candidate,_that.sdpMid,_that.sdpMineIndex);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String candidate,  String? sdpMid,  int? sdpMineIndex)?  $default,) {final _that = this;
switch (_that) {
case _IceCandidate() when $default != null:
return $default(_that.candidate,_that.sdpMid,_that.sdpMineIndex);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _IceCandidate implements IceCandidate {
  const _IceCandidate({required this.candidate, this.sdpMid, this.sdpMineIndex});
  factory _IceCandidate.fromJson(Map<String, dynamic> json) => _$IceCandidateFromJson(json);

@override final  String candidate;
@override final  String? sdpMid;
@override final  int? sdpMineIndex;

/// Create a copy of IceCandidate
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$IceCandidateCopyWith<_IceCandidate> get copyWith => __$IceCandidateCopyWithImpl<_IceCandidate>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$IceCandidateToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _IceCandidate&&(identical(other.candidate, candidate) || other.candidate == candidate)&&(identical(other.sdpMid, sdpMid) || other.sdpMid == sdpMid)&&(identical(other.sdpMineIndex, sdpMineIndex) || other.sdpMineIndex == sdpMineIndex));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,candidate,sdpMid,sdpMineIndex);

@override
String toString() {
  return 'IceCandidate(candidate: $candidate, sdpMid: $sdpMid, sdpMineIndex: $sdpMineIndex)';
}


}

/// @nodoc
abstract mixin class _$IceCandidateCopyWith<$Res> implements $IceCandidateCopyWith<$Res> {
  factory _$IceCandidateCopyWith(_IceCandidate value, $Res Function(_IceCandidate) _then) = __$IceCandidateCopyWithImpl;
@override @useResult
$Res call({
 String candidate, String? sdpMid, int? sdpMineIndex
});




}
/// @nodoc
class __$IceCandidateCopyWithImpl<$Res>
    implements _$IceCandidateCopyWith<$Res> {
  __$IceCandidateCopyWithImpl(this._self, this._then);

  final _IceCandidate _self;
  final $Res Function(_IceCandidate) _then;

/// Create a copy of IceCandidate
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? candidate = null,Object? sdpMid = freezed,Object? sdpMineIndex = freezed,}) {
  return _then(_IceCandidate(
candidate: null == candidate ? _self.candidate : candidate // ignore: cast_nullable_to_non_nullable
as String,sdpMid: freezed == sdpMid ? _self.sdpMid : sdpMid // ignore: cast_nullable_to_non_nullable
as String?,sdpMineIndex: freezed == sdpMineIndex ? _self.sdpMineIndex : sdpMineIndex // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}

// dart format on
