// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chat_info.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ChatInfo {

 String get title; String? get cover; ESpecialization get specialization;
/// Create a copy of ChatInfo
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ChatInfoCopyWith<ChatInfo> get copyWith => _$ChatInfoCopyWithImpl<ChatInfo>(this as ChatInfo, _$identity);

  /// Serializes this ChatInfo to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChatInfo&&(identical(other.title, title) || other.title == title)&&(identical(other.cover, cover) || other.cover == cover)&&(identical(other.specialization, specialization) || other.specialization == specialization));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,title,cover,specialization);

@override
String toString() {
  return 'ChatInfo(title: $title, cover: $cover, specialization: $specialization)';
}


}

/// @nodoc
abstract mixin class $ChatInfoCopyWith<$Res>  {
  factory $ChatInfoCopyWith(ChatInfo value, $Res Function(ChatInfo) _then) = _$ChatInfoCopyWithImpl;
@useResult
$Res call({
 String title, String? cover, ESpecialization specialization
});




}
/// @nodoc
class _$ChatInfoCopyWithImpl<$Res>
    implements $ChatInfoCopyWith<$Res> {
  _$ChatInfoCopyWithImpl(this._self, this._then);

  final ChatInfo _self;
  final $Res Function(ChatInfo) _then;

/// Create a copy of ChatInfo
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? title = null,Object? cover = freezed,Object? specialization = null,}) {
  return _then(_self.copyWith(
title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,cover: freezed == cover ? _self.cover : cover // ignore: cast_nullable_to_non_nullable
as String?,specialization: null == specialization ? _self.specialization : specialization // ignore: cast_nullable_to_non_nullable
as ESpecialization,
  ));
}

}


/// Adds pattern-matching-related methods to [ChatInfo].
extension ChatInfoPatterns on ChatInfo {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ChatInfo value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ChatInfo() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ChatInfo value)  $default,){
final _that = this;
switch (_that) {
case _ChatInfo():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ChatInfo value)?  $default,){
final _that = this;
switch (_that) {
case _ChatInfo() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String title,  String? cover,  ESpecialization specialization)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ChatInfo() when $default != null:
return $default(_that.title,_that.cover,_that.specialization);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String title,  String? cover,  ESpecialization specialization)  $default,) {final _that = this;
switch (_that) {
case _ChatInfo():
return $default(_that.title,_that.cover,_that.specialization);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String title,  String? cover,  ESpecialization specialization)?  $default,) {final _that = this;
switch (_that) {
case _ChatInfo() when $default != null:
return $default(_that.title,_that.cover,_that.specialization);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ChatInfo implements ChatInfo {
  const _ChatInfo({this.title = '', this.cover, required this.specialization});
  factory _ChatInfo.fromJson(Map<String, dynamic> json) => _$ChatInfoFromJson(json);

@override@JsonKey() final  String title;
@override final  String? cover;
@override final  ESpecialization specialization;

/// Create a copy of ChatInfo
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ChatInfoCopyWith<_ChatInfo> get copyWith => __$ChatInfoCopyWithImpl<_ChatInfo>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ChatInfoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ChatInfo&&(identical(other.title, title) || other.title == title)&&(identical(other.cover, cover) || other.cover == cover)&&(identical(other.specialization, specialization) || other.specialization == specialization));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,title,cover,specialization);

@override
String toString() {
  return 'ChatInfo(title: $title, cover: $cover, specialization: $specialization)';
}


}

/// @nodoc
abstract mixin class _$ChatInfoCopyWith<$Res> implements $ChatInfoCopyWith<$Res> {
  factory _$ChatInfoCopyWith(_ChatInfo value, $Res Function(_ChatInfo) _then) = __$ChatInfoCopyWithImpl;
@override @useResult
$Res call({
 String title, String? cover, ESpecialization specialization
});




}
/// @nodoc
class __$ChatInfoCopyWithImpl<$Res>
    implements _$ChatInfoCopyWith<$Res> {
  __$ChatInfoCopyWithImpl(this._self, this._then);

  final _ChatInfo _self;
  final $Res Function(_ChatInfo) _then;

/// Create a copy of ChatInfo
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? title = null,Object? cover = freezed,Object? specialization = null,}) {
  return _then(_ChatInfo(
title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,cover: freezed == cover ? _self.cover : cover // ignore: cast_nullable_to_non_nullable
as String?,specialization: null == specialization ? _self.specialization : specialization // ignore: cast_nullable_to_non_nullable
as ESpecialization,
  ));
}


}

// dart format on
