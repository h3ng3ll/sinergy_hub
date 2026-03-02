// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chat_payload.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ChatPayload {

 String get type; String get chatId; String get sentUid;
/// Create a copy of ChatPayload
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ChatPayloadCopyWith<ChatPayload> get copyWith => _$ChatPayloadCopyWithImpl<ChatPayload>(this as ChatPayload, _$identity);

  /// Serializes this ChatPayload to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChatPayload&&(identical(other.type, type) || other.type == type)&&(identical(other.chatId, chatId) || other.chatId == chatId)&&(identical(other.sentUid, sentUid) || other.sentUid == sentUid));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,type,chatId,sentUid);

@override
String toString() {
  return 'ChatPayload(type: $type, chatId: $chatId, sentUid: $sentUid)';
}


}

/// @nodoc
abstract mixin class $ChatPayloadCopyWith<$Res>  {
  factory $ChatPayloadCopyWith(ChatPayload value, $Res Function(ChatPayload) _then) = _$ChatPayloadCopyWithImpl;
@useResult
$Res call({
 String type, String chatId, String sentUid
});




}
/// @nodoc
class _$ChatPayloadCopyWithImpl<$Res>
    implements $ChatPayloadCopyWith<$Res> {
  _$ChatPayloadCopyWithImpl(this._self, this._then);

  final ChatPayload _self;
  final $Res Function(ChatPayload) _then;

/// Create a copy of ChatPayload
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? type = null,Object? chatId = null,Object? sentUid = null,}) {
  return _then(_self.copyWith(
type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,chatId: null == chatId ? _self.chatId : chatId // ignore: cast_nullable_to_non_nullable
as String,sentUid: null == sentUid ? _self.sentUid : sentUid // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [ChatPayload].
extension ChatPayloadPatterns on ChatPayload {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ChatPayload value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ChatPayload() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ChatPayload value)  $default,){
final _that = this;
switch (_that) {
case _ChatPayload():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ChatPayload value)?  $default,){
final _that = this;
switch (_that) {
case _ChatPayload() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String type,  String chatId,  String sentUid)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ChatPayload() when $default != null:
return $default(_that.type,_that.chatId,_that.sentUid);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String type,  String chatId,  String sentUid)  $default,) {final _that = this;
switch (_that) {
case _ChatPayload():
return $default(_that.type,_that.chatId,_that.sentUid);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String type,  String chatId,  String sentUid)?  $default,) {final _that = this;
switch (_that) {
case _ChatPayload() when $default != null:
return $default(_that.type,_that.chatId,_that.sentUid);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ChatPayload implements ChatPayload {
  const _ChatPayload({this.type = '', this.chatId = '', this.sentUid = ''});
  factory _ChatPayload.fromJson(Map<String, dynamic> json) => _$ChatPayloadFromJson(json);

@override@JsonKey() final  String type;
@override@JsonKey() final  String chatId;
@override@JsonKey() final  String sentUid;

/// Create a copy of ChatPayload
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ChatPayloadCopyWith<_ChatPayload> get copyWith => __$ChatPayloadCopyWithImpl<_ChatPayload>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ChatPayloadToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ChatPayload&&(identical(other.type, type) || other.type == type)&&(identical(other.chatId, chatId) || other.chatId == chatId)&&(identical(other.sentUid, sentUid) || other.sentUid == sentUid));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,type,chatId,sentUid);

@override
String toString() {
  return 'ChatPayload(type: $type, chatId: $chatId, sentUid: $sentUid)';
}


}

/// @nodoc
abstract mixin class _$ChatPayloadCopyWith<$Res> implements $ChatPayloadCopyWith<$Res> {
  factory _$ChatPayloadCopyWith(_ChatPayload value, $Res Function(_ChatPayload) _then) = __$ChatPayloadCopyWithImpl;
@override @useResult
$Res call({
 String type, String chatId, String sentUid
});




}
/// @nodoc
class __$ChatPayloadCopyWithImpl<$Res>
    implements _$ChatPayloadCopyWith<$Res> {
  __$ChatPayloadCopyWithImpl(this._self, this._then);

  final _ChatPayload _self;
  final $Res Function(_ChatPayload) _then;

/// Create a copy of ChatPayload
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? type = null,Object? chatId = null,Object? sentUid = null,}) {
  return _then(_ChatPayload(
type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,chatId: null == chatId ? _self.chatId : chatId // ignore: cast_nullable_to_non_nullable
as String,sentUid: null == sentUid ? _self.sentUid : sentUid // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
