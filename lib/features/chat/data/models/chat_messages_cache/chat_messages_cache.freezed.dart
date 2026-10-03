// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chat_messages_cache.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ChatMessagesCache {

 String get chatId; List<ChatMessage> get messages; bool get reachedStart;
/// Create a copy of ChatMessagesCache
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ChatMessagesCacheCopyWith<ChatMessagesCache> get copyWith => _$ChatMessagesCacheCopyWithImpl<ChatMessagesCache>(this as ChatMessagesCache, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChatMessagesCache&&(identical(other.chatId, chatId) || other.chatId == chatId)&&const DeepCollectionEquality().equals(other.messages, messages)&&(identical(other.reachedStart, reachedStart) || other.reachedStart == reachedStart));
}


@override
int get hashCode => Object.hash(runtimeType,chatId,const DeepCollectionEquality().hash(messages),reachedStart);

@override
String toString() {
  return 'ChatMessagesCache(chatId: $chatId, messages: $messages, reachedStart: $reachedStart)';
}


}

/// @nodoc
abstract mixin class $ChatMessagesCacheCopyWith<$Res>  {
  factory $ChatMessagesCacheCopyWith(ChatMessagesCache value, $Res Function(ChatMessagesCache) _then) = _$ChatMessagesCacheCopyWithImpl;
@useResult
$Res call({
 String chatId, List<ChatMessage> messages, bool reachedStart
});




}
/// @nodoc
class _$ChatMessagesCacheCopyWithImpl<$Res>
    implements $ChatMessagesCacheCopyWith<$Res> {
  _$ChatMessagesCacheCopyWithImpl(this._self, this._then);

  final ChatMessagesCache _self;
  final $Res Function(ChatMessagesCache) _then;

/// Create a copy of ChatMessagesCache
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? chatId = null,Object? messages = null,Object? reachedStart = null,}) {
  return _then(_self.copyWith(
chatId: null == chatId ? _self.chatId : chatId // ignore: cast_nullable_to_non_nullable
as String,messages: null == messages ? _self.messages : messages // ignore: cast_nullable_to_non_nullable
as List<ChatMessage>,reachedStart: null == reachedStart ? _self.reachedStart : reachedStart // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [ChatMessagesCache].
extension ChatMessagesCachePatterns on ChatMessagesCache {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ChatMessagesCache value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ChatMessagesCache() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ChatMessagesCache value)  $default,){
final _that = this;
switch (_that) {
case _ChatMessagesCache():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ChatMessagesCache value)?  $default,){
final _that = this;
switch (_that) {
case _ChatMessagesCache() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String chatId,  List<ChatMessage> messages,  bool reachedStart)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ChatMessagesCache() when $default != null:
return $default(_that.chatId,_that.messages,_that.reachedStart);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String chatId,  List<ChatMessage> messages,  bool reachedStart)  $default,) {final _that = this;
switch (_that) {
case _ChatMessagesCache():
return $default(_that.chatId,_that.messages,_that.reachedStart);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String chatId,  List<ChatMessage> messages,  bool reachedStart)?  $default,) {final _that = this;
switch (_that) {
case _ChatMessagesCache() when $default != null:
return $default(_that.chatId,_that.messages,_that.reachedStart);case _:
  return null;

}
}

}

/// @nodoc


class _ChatMessagesCache implements ChatMessagesCache {
  const _ChatMessagesCache({required this.chatId, final  List<ChatMessage> messages = const [], this.reachedStart = false}): _messages = messages;
  

@override final  String chatId;
 final  List<ChatMessage> _messages;
@override@JsonKey() List<ChatMessage> get messages {
  if (_messages is EqualUnmodifiableListView) return _messages;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_messages);
}

@override@JsonKey() final  bool reachedStart;

/// Create a copy of ChatMessagesCache
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ChatMessagesCacheCopyWith<_ChatMessagesCache> get copyWith => __$ChatMessagesCacheCopyWithImpl<_ChatMessagesCache>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ChatMessagesCache&&(identical(other.chatId, chatId) || other.chatId == chatId)&&const DeepCollectionEquality().equals(other._messages, _messages)&&(identical(other.reachedStart, reachedStart) || other.reachedStart == reachedStart));
}


@override
int get hashCode => Object.hash(runtimeType,chatId,const DeepCollectionEquality().hash(_messages),reachedStart);

@override
String toString() {
  return 'ChatMessagesCache(chatId: $chatId, messages: $messages, reachedStart: $reachedStart)';
}


}

/// @nodoc
abstract mixin class _$ChatMessagesCacheCopyWith<$Res> implements $ChatMessagesCacheCopyWith<$Res> {
  factory _$ChatMessagesCacheCopyWith(_ChatMessagesCache value, $Res Function(_ChatMessagesCache) _then) = __$ChatMessagesCacheCopyWithImpl;
@override @useResult
$Res call({
 String chatId, List<ChatMessage> messages, bool reachedStart
});




}
/// @nodoc
class __$ChatMessagesCacheCopyWithImpl<$Res>
    implements _$ChatMessagesCacheCopyWith<$Res> {
  __$ChatMessagesCacheCopyWithImpl(this._self, this._then);

  final _ChatMessagesCache _self;
  final $Res Function(_ChatMessagesCache) _then;

/// Create a copy of ChatMessagesCache
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? chatId = null,Object? messages = null,Object? reachedStart = null,}) {
  return _then(_ChatMessagesCache(
chatId: null == chatId ? _self.chatId : chatId // ignore: cast_nullable_to_non_nullable
as String,messages: null == messages ? _self._messages : messages // ignore: cast_nullable_to_non_nullable
as List<ChatMessage>,reachedStart: null == reachedStart ? _self.reachedStart : reachedStart // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
