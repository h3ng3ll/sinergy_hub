// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chat_config.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ChatConfig {

 String get chatId; bool get archived; bool get favorite;
/// Create a copy of ChatConfig
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ChatConfigCopyWith<ChatConfig> get copyWith => _$ChatConfigCopyWithImpl<ChatConfig>(this as ChatConfig, _$identity);

  /// Serializes this ChatConfig to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChatConfig&&(identical(other.chatId, chatId) || other.chatId == chatId)&&(identical(other.archived, archived) || other.archived == archived)&&(identical(other.favorite, favorite) || other.favorite == favorite));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,chatId,archived,favorite);

@override
String toString() {
  return 'ChatConfig(chatId: $chatId, archived: $archived, favorite: $favorite)';
}


}

/// @nodoc
abstract mixin class $ChatConfigCopyWith<$Res>  {
  factory $ChatConfigCopyWith(ChatConfig value, $Res Function(ChatConfig) _then) = _$ChatConfigCopyWithImpl;
@useResult
$Res call({
 String chatId, bool archived, bool favorite
});




}
/// @nodoc
class _$ChatConfigCopyWithImpl<$Res>
    implements $ChatConfigCopyWith<$Res> {
  _$ChatConfigCopyWithImpl(this._self, this._then);

  final ChatConfig _self;
  final $Res Function(ChatConfig) _then;

/// Create a copy of ChatConfig
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? chatId = null,Object? archived = null,Object? favorite = null,}) {
  return _then(_self.copyWith(
chatId: null == chatId ? _self.chatId : chatId // ignore: cast_nullable_to_non_nullable
as String,archived: null == archived ? _self.archived : archived // ignore: cast_nullable_to_non_nullable
as bool,favorite: null == favorite ? _self.favorite : favorite // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [ChatConfig].
extension ChatConfigPatterns on ChatConfig {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ChatConfig value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ChatConfig() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ChatConfig value)  $default,){
final _that = this;
switch (_that) {
case _ChatConfig():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ChatConfig value)?  $default,){
final _that = this;
switch (_that) {
case _ChatConfig() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String chatId,  bool archived,  bool favorite)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ChatConfig() when $default != null:
return $default(_that.chatId,_that.archived,_that.favorite);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String chatId,  bool archived,  bool favorite)  $default,) {final _that = this;
switch (_that) {
case _ChatConfig():
return $default(_that.chatId,_that.archived,_that.favorite);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String chatId,  bool archived,  bool favorite)?  $default,) {final _that = this;
switch (_that) {
case _ChatConfig() when $default != null:
return $default(_that.chatId,_that.archived,_that.favorite);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ChatConfig implements ChatConfig {
  const _ChatConfig({required this.chatId, this.archived = false, this.favorite = false});
  factory _ChatConfig.fromJson(Map<String, dynamic> json) => _$ChatConfigFromJson(json);

@override final  String chatId;
@override@JsonKey() final  bool archived;
@override@JsonKey() final  bool favorite;

/// Create a copy of ChatConfig
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ChatConfigCopyWith<_ChatConfig> get copyWith => __$ChatConfigCopyWithImpl<_ChatConfig>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ChatConfigToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ChatConfig&&(identical(other.chatId, chatId) || other.chatId == chatId)&&(identical(other.archived, archived) || other.archived == archived)&&(identical(other.favorite, favorite) || other.favorite == favorite));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,chatId,archived,favorite);

@override
String toString() {
  return 'ChatConfig(chatId: $chatId, archived: $archived, favorite: $favorite)';
}


}

/// @nodoc
abstract mixin class _$ChatConfigCopyWith<$Res> implements $ChatConfigCopyWith<$Res> {
  factory _$ChatConfigCopyWith(_ChatConfig value, $Res Function(_ChatConfig) _then) = __$ChatConfigCopyWithImpl;
@override @useResult
$Res call({
 String chatId, bool archived, bool favorite
});




}
/// @nodoc
class __$ChatConfigCopyWithImpl<$Res>
    implements _$ChatConfigCopyWith<$Res> {
  __$ChatConfigCopyWithImpl(this._self, this._then);

  final _ChatConfig _self;
  final $Res Function(_ChatConfig) _then;

/// Create a copy of ChatConfig
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? chatId = null,Object? archived = null,Object? favorite = null,}) {
  return _then(_ChatConfig(
chatId: null == chatId ? _self.chatId : chatId // ignore: cast_nullable_to_non_nullable
as String,archived: null == archived ? _self.archived : archived // ignore: cast_nullable_to_non_nullable
as bool,favorite: null == favorite ? _self.favorite : favorite // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
