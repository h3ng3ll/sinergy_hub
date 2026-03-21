// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'participant_info.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
ParticipantInfo _$ParticipantInfoFromJson(
  Map<String, dynamic> json
) {
    return _ParticipantsInfo.fromJson(
      json
    );
}

/// @nodoc
mixin _$ParticipantInfo {

 String get id; String get name; String? get avatarUrl; String get specialization;
/// Create a copy of ParticipantInfo
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ParticipantInfoCopyWith<ParticipantInfo> get copyWith => _$ParticipantInfoCopyWithImpl<ParticipantInfo>(this as ParticipantInfo, _$identity);

  /// Serializes this ParticipantInfo to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ParticipantInfo&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.avatarUrl, avatarUrl) || other.avatarUrl == avatarUrl)&&(identical(other.specialization, specialization) || other.specialization == specialization));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,avatarUrl,specialization);

@override
String toString() {
  return 'ParticipantInfo(id: $id, name: $name, avatarUrl: $avatarUrl, specialization: $specialization)';
}


}

/// @nodoc
abstract mixin class $ParticipantInfoCopyWith<$Res>  {
  factory $ParticipantInfoCopyWith(ParticipantInfo value, $Res Function(ParticipantInfo) _then) = _$ParticipantInfoCopyWithImpl;
@useResult
$Res call({
 String id, String name, String? avatarUrl, String specialization
});




}
/// @nodoc
class _$ParticipantInfoCopyWithImpl<$Res>
    implements $ParticipantInfoCopyWith<$Res> {
  _$ParticipantInfoCopyWithImpl(this._self, this._then);

  final ParticipantInfo _self;
  final $Res Function(ParticipantInfo) _then;

/// Create a copy of ParticipantInfo
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? avatarUrl = freezed,Object? specialization = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,avatarUrl: freezed == avatarUrl ? _self.avatarUrl : avatarUrl // ignore: cast_nullable_to_non_nullable
as String?,specialization: null == specialization ? _self.specialization : specialization // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [ParticipantInfo].
extension ParticipantInfoPatterns on ParticipantInfo {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ParticipantsInfo value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ParticipantsInfo() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ParticipantsInfo value)  $default,){
final _that = this;
switch (_that) {
case _ParticipantsInfo():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ParticipantsInfo value)?  $default,){
final _that = this;
switch (_that) {
case _ParticipantsInfo() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  String? avatarUrl,  String specialization)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ParticipantsInfo() when $default != null:
return $default(_that.id,_that.name,_that.avatarUrl,_that.specialization);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  String? avatarUrl,  String specialization)  $default,) {final _that = this;
switch (_that) {
case _ParticipantsInfo():
return $default(_that.id,_that.name,_that.avatarUrl,_that.specialization);case _:
  throw StateError('Unexpected subclass');

}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  String? avatarUrl,  String specialization)?  $default,) {final _that = this;
switch (_that) {
case _ParticipantsInfo() when $default != null:
return $default(_that.id,_that.name,_that.avatarUrl,_that.specialization);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ParticipantsInfo implements ParticipantInfo {
  const _ParticipantsInfo({this.id = '', this.name = '', this.avatarUrl, this.specialization = ''});
  factory _ParticipantsInfo.fromJson(Map<String, dynamic> json) => _$ParticipantsInfoFromJson(json);

@override@JsonKey() final  String id;
@override@JsonKey() final  String name;
@override final  String? avatarUrl;
@override@JsonKey() final  String specialization;

/// Create a copy of ParticipantInfo
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ParticipantsInfoCopyWith<_ParticipantsInfo> get copyWith => __$ParticipantsInfoCopyWithImpl<_ParticipantsInfo>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ParticipantsInfoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ParticipantsInfo&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.avatarUrl, avatarUrl) || other.avatarUrl == avatarUrl)&&(identical(other.specialization, specialization) || other.specialization == specialization));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,avatarUrl,specialization);

@override
String toString() {
  return 'ParticipantInfo(id: $id, name: $name, avatarUrl: $avatarUrl, specialization: $specialization)';
}


}

/// @nodoc
abstract mixin class _$ParticipantsInfoCopyWith<$Res> implements $ParticipantInfoCopyWith<$Res> {
  factory _$ParticipantsInfoCopyWith(_ParticipantsInfo value, $Res Function(_ParticipantsInfo) _then) = __$ParticipantsInfoCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, String? avatarUrl, String specialization
});




}
/// @nodoc
class __$ParticipantsInfoCopyWithImpl<$Res>
    implements _$ParticipantsInfoCopyWith<$Res> {
  __$ParticipantsInfoCopyWithImpl(this._self, this._then);

  final _ParticipantsInfo _self;
  final $Res Function(_ParticipantsInfo) _then;

/// Create a copy of ParticipantInfo
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? avatarUrl = freezed,Object? specialization = null,}) {
  return _then(_ParticipantsInfo(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,avatarUrl: freezed == avatarUrl ? _self.avatarUrl : avatarUrl // ignore: cast_nullable_to_non_nullable
as String?,specialization: null == specialization ? _self.specialization : specialization // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
