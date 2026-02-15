// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'call.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Call {

 String get id; String get callerId; String get calleeId; ECallStatus get status; String? get offerSdp; String? get answerSdp; DateTime get createdAt; DateTime? get endedAt;
/// Create a copy of Call
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CallCopyWith<Call> get copyWith => _$CallCopyWithImpl<Call>(this as Call, _$identity);

  /// Serializes this Call to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Call&&(identical(other.id, id) || other.id == id)&&(identical(other.callerId, callerId) || other.callerId == callerId)&&(identical(other.calleeId, calleeId) || other.calleeId == calleeId)&&(identical(other.status, status) || other.status == status)&&(identical(other.offerSdp, offerSdp) || other.offerSdp == offerSdp)&&(identical(other.answerSdp, answerSdp) || other.answerSdp == answerSdp)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.endedAt, endedAt) || other.endedAt == endedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,callerId,calleeId,status,offerSdp,answerSdp,createdAt,endedAt);

@override
String toString() {
  return 'Call(id: $id, callerId: $callerId, calleeId: $calleeId, status: $status, offerSdp: $offerSdp, answerSdp: $answerSdp, createdAt: $createdAt, endedAt: $endedAt)';
}


}

/// @nodoc
abstract mixin class $CallCopyWith<$Res>  {
  factory $CallCopyWith(Call value, $Res Function(Call) _then) = _$CallCopyWithImpl;
@useResult
$Res call({
 String id, String callerId, String calleeId, ECallStatus status, String? offerSdp, String? answerSdp, DateTime createdAt, DateTime? endedAt
});




}
/// @nodoc
class _$CallCopyWithImpl<$Res>
    implements $CallCopyWith<$Res> {
  _$CallCopyWithImpl(this._self, this._then);

  final Call _self;
  final $Res Function(Call) _then;

/// Create a copy of Call
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? callerId = null,Object? calleeId = null,Object? status = null,Object? offerSdp = freezed,Object? answerSdp = freezed,Object? createdAt = null,Object? endedAt = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,callerId: null == callerId ? _self.callerId : callerId // ignore: cast_nullable_to_non_nullable
as String,calleeId: null == calleeId ? _self.calleeId : calleeId // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as ECallStatus,offerSdp: freezed == offerSdp ? _self.offerSdp : offerSdp // ignore: cast_nullable_to_non_nullable
as String?,answerSdp: freezed == answerSdp ? _self.answerSdp : answerSdp // ignore: cast_nullable_to_non_nullable
as String?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,endedAt: freezed == endedAt ? _self.endedAt : endedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [Call].
extension CallPatterns on Call {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Call value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Call() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Call value)  $default,){
final _that = this;
switch (_that) {
case _Call():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Call value)?  $default,){
final _that = this;
switch (_that) {
case _Call() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String callerId,  String calleeId,  ECallStatus status,  String? offerSdp,  String? answerSdp,  DateTime createdAt,  DateTime? endedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Call() when $default != null:
return $default(_that.id,_that.callerId,_that.calleeId,_that.status,_that.offerSdp,_that.answerSdp,_that.createdAt,_that.endedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String callerId,  String calleeId,  ECallStatus status,  String? offerSdp,  String? answerSdp,  DateTime createdAt,  DateTime? endedAt)  $default,) {final _that = this;
switch (_that) {
case _Call():
return $default(_that.id,_that.callerId,_that.calleeId,_that.status,_that.offerSdp,_that.answerSdp,_that.createdAt,_that.endedAt);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String callerId,  String calleeId,  ECallStatus status,  String? offerSdp,  String? answerSdp,  DateTime createdAt,  DateTime? endedAt)?  $default,) {final _that = this;
switch (_that) {
case _Call() when $default != null:
return $default(_that.id,_that.callerId,_that.calleeId,_that.status,_that.offerSdp,_that.answerSdp,_that.createdAt,_that.endedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Call implements Call {
  const _Call({this.id = '', this.callerId = '', this.calleeId = '', this.status = ECallStatus.idle, this.offerSdp, this.answerSdp, required this.createdAt, this.endedAt});
  factory _Call.fromJson(Map<String, dynamic> json) => _$CallFromJson(json);

@override@JsonKey() final  String id;
@override@JsonKey() final  String callerId;
@override@JsonKey() final  String calleeId;
@override@JsonKey() final  ECallStatus status;
@override final  String? offerSdp;
@override final  String? answerSdp;
@override final  DateTime createdAt;
@override final  DateTime? endedAt;

/// Create a copy of Call
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CallCopyWith<_Call> get copyWith => __$CallCopyWithImpl<_Call>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CallToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Call&&(identical(other.id, id) || other.id == id)&&(identical(other.callerId, callerId) || other.callerId == callerId)&&(identical(other.calleeId, calleeId) || other.calleeId == calleeId)&&(identical(other.status, status) || other.status == status)&&(identical(other.offerSdp, offerSdp) || other.offerSdp == offerSdp)&&(identical(other.answerSdp, answerSdp) || other.answerSdp == answerSdp)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.endedAt, endedAt) || other.endedAt == endedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,callerId,calleeId,status,offerSdp,answerSdp,createdAt,endedAt);

@override
String toString() {
  return 'Call(id: $id, callerId: $callerId, calleeId: $calleeId, status: $status, offerSdp: $offerSdp, answerSdp: $answerSdp, createdAt: $createdAt, endedAt: $endedAt)';
}


}

/// @nodoc
abstract mixin class _$CallCopyWith<$Res> implements $CallCopyWith<$Res> {
  factory _$CallCopyWith(_Call value, $Res Function(_Call) _then) = __$CallCopyWithImpl;
@override @useResult
$Res call({
 String id, String callerId, String calleeId, ECallStatus status, String? offerSdp, String? answerSdp, DateTime createdAt, DateTime? endedAt
});




}
/// @nodoc
class __$CallCopyWithImpl<$Res>
    implements _$CallCopyWith<$Res> {
  __$CallCopyWithImpl(this._self, this._then);

  final _Call _self;
  final $Res Function(_Call) _then;

/// Create a copy of Call
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? callerId = null,Object? calleeId = null,Object? status = null,Object? offerSdp = freezed,Object? answerSdp = freezed,Object? createdAt = null,Object? endedAt = freezed,}) {
  return _then(_Call(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,callerId: null == callerId ? _self.callerId : callerId // ignore: cast_nullable_to_non_nullable
as String,calleeId: null == calleeId ? _self.calleeId : calleeId // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as ECallStatus,offerSdp: freezed == offerSdp ? _self.offerSdp : offerSdp // ignore: cast_nullable_to_non_nullable
as String?,answerSdp: freezed == answerSdp ? _self.answerSdp : answerSdp // ignore: cast_nullable_to_non_nullable
as String?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,endedAt: freezed == endedAt ? _self.endedAt : endedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

// dart format on
