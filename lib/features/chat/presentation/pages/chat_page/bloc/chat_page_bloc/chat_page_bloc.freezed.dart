// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chat_page_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ChatPageEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChatPageEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ChatPageEvent()';
}


}

/// @nodoc
class $ChatPageEventCopyWith<$Res>  {
$ChatPageEventCopyWith(ChatPageEvent _, $Res Function(ChatPageEvent) __);
}


/// Adds pattern-matching-related methods to [ChatPageEvent].
extension ChatPageEventPatterns on ChatPageEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Load value)?  load,TResult Function( _SendMessage value)?  sendMessage,TResult Function( _UpdateChat value)?  updateChat,TResult Function( _UpdateMessages value)?  updateMessages,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Load() when load != null:
return load(_that);case _SendMessage() when sendMessage != null:
return sendMessage(_that);case _UpdateChat() when updateChat != null:
return updateChat(_that);case _UpdateMessages() when updateMessages != null:
return updateMessages(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Load value)  load,required TResult Function( _SendMessage value)  sendMessage,required TResult Function( _UpdateChat value)  updateChat,required TResult Function( _UpdateMessages value)  updateMessages,}){
final _that = this;
switch (_that) {
case _Load():
return load(_that);case _SendMessage():
return sendMessage(_that);case _UpdateChat():
return updateChat(_that);case _UpdateMessages():
return updateMessages(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Load value)?  load,TResult? Function( _SendMessage value)?  sendMessage,TResult? Function( _UpdateChat value)?  updateChat,TResult? Function( _UpdateMessages value)?  updateMessages,}){
final _that = this;
switch (_that) {
case _Load() when load != null:
return load(_that);case _SendMessage() when sendMessage != null:
return sendMessage(_that);case _UpdateChat() when updateChat != null:
return updateChat(_that);case _UpdateMessages() when updateMessages != null:
return updateMessages(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  load,TResult Function( String message)?  sendMessage,TResult Function( Chat chat)?  updateChat,TResult Function( List<ChatMessage> messages)?  updateMessages,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Load() when load != null:
return load();case _SendMessage() when sendMessage != null:
return sendMessage(_that.message);case _UpdateChat() when updateChat != null:
return updateChat(_that.chat);case _UpdateMessages() when updateMessages != null:
return updateMessages(_that.messages);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  load,required TResult Function( String message)  sendMessage,required TResult Function( Chat chat)  updateChat,required TResult Function( List<ChatMessage> messages)  updateMessages,}) {final _that = this;
switch (_that) {
case _Load():
return load();case _SendMessage():
return sendMessage(_that.message);case _UpdateChat():
return updateChat(_that.chat);case _UpdateMessages():
return updateMessages(_that.messages);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  load,TResult? Function( String message)?  sendMessage,TResult? Function( Chat chat)?  updateChat,TResult? Function( List<ChatMessage> messages)?  updateMessages,}) {final _that = this;
switch (_that) {
case _Load() when load != null:
return load();case _SendMessage() when sendMessage != null:
return sendMessage(_that.message);case _UpdateChat() when updateChat != null:
return updateChat(_that.chat);case _UpdateMessages() when updateMessages != null:
return updateMessages(_that.messages);case _:
  return null;

}
}

}

/// @nodoc


class _Load implements ChatPageEvent {
  const _Load();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Load);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ChatPageEvent.load()';
}


}




/// @nodoc


class _SendMessage implements ChatPageEvent {
  const _SendMessage({required this.message});
  

 final  String message;

/// Create a copy of ChatPageEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SendMessageCopyWith<_SendMessage> get copyWith => __$SendMessageCopyWithImpl<_SendMessage>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SendMessage&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'ChatPageEvent.sendMessage(message: $message)';
}


}

/// @nodoc
abstract mixin class _$SendMessageCopyWith<$Res> implements $ChatPageEventCopyWith<$Res> {
  factory _$SendMessageCopyWith(_SendMessage value, $Res Function(_SendMessage) _then) = __$SendMessageCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class __$SendMessageCopyWithImpl<$Res>
    implements _$SendMessageCopyWith<$Res> {
  __$SendMessageCopyWithImpl(this._self, this._then);

  final _SendMessage _self;
  final $Res Function(_SendMessage) _then;

/// Create a copy of ChatPageEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(_SendMessage(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _UpdateChat implements ChatPageEvent {
  const _UpdateChat({required this.chat});
  

 final  Chat chat;

/// Create a copy of ChatPageEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UpdateChatCopyWith<_UpdateChat> get copyWith => __$UpdateChatCopyWithImpl<_UpdateChat>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UpdateChat&&(identical(other.chat, chat) || other.chat == chat));
}


@override
int get hashCode => Object.hash(runtimeType,chat);

@override
String toString() {
  return 'ChatPageEvent.updateChat(chat: $chat)';
}


}

/// @nodoc
abstract mixin class _$UpdateChatCopyWith<$Res> implements $ChatPageEventCopyWith<$Res> {
  factory _$UpdateChatCopyWith(_UpdateChat value, $Res Function(_UpdateChat) _then) = __$UpdateChatCopyWithImpl;
@useResult
$Res call({
 Chat chat
});


$ChatCopyWith<$Res> get chat;

}
/// @nodoc
class __$UpdateChatCopyWithImpl<$Res>
    implements _$UpdateChatCopyWith<$Res> {
  __$UpdateChatCopyWithImpl(this._self, this._then);

  final _UpdateChat _self;
  final $Res Function(_UpdateChat) _then;

/// Create a copy of ChatPageEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? chat = null,}) {
  return _then(_UpdateChat(
chat: null == chat ? _self.chat : chat // ignore: cast_nullable_to_non_nullable
as Chat,
  ));
}

/// Create a copy of ChatPageEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ChatCopyWith<$Res> get chat {
  
  return $ChatCopyWith<$Res>(_self.chat, (value) {
    return _then(_self.copyWith(chat: value));
  });
}
}

/// @nodoc


class _UpdateMessages implements ChatPageEvent {
  const _UpdateMessages({required final  List<ChatMessage> messages}): _messages = messages;
  

 final  List<ChatMessage> _messages;
 List<ChatMessage> get messages {
  if (_messages is EqualUnmodifiableListView) return _messages;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_messages);
}


/// Create a copy of ChatPageEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UpdateMessagesCopyWith<_UpdateMessages> get copyWith => __$UpdateMessagesCopyWithImpl<_UpdateMessages>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UpdateMessages&&const DeepCollectionEquality().equals(other._messages, _messages));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_messages));

@override
String toString() {
  return 'ChatPageEvent.updateMessages(messages: $messages)';
}


}

/// @nodoc
abstract mixin class _$UpdateMessagesCopyWith<$Res> implements $ChatPageEventCopyWith<$Res> {
  factory _$UpdateMessagesCopyWith(_UpdateMessages value, $Res Function(_UpdateMessages) _then) = __$UpdateMessagesCopyWithImpl;
@useResult
$Res call({
 List<ChatMessage> messages
});




}
/// @nodoc
class __$UpdateMessagesCopyWithImpl<$Res>
    implements _$UpdateMessagesCopyWith<$Res> {
  __$UpdateMessagesCopyWithImpl(this._self, this._then);

  final _UpdateMessages _self;
  final $Res Function(_UpdateMessages) _then;

/// Create a copy of ChatPageEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? messages = null,}) {
  return _then(_UpdateMessages(
messages: null == messages ? _self._messages : messages // ignore: cast_nullable_to_non_nullable
as List<ChatMessage>,
  ));
}


}

/// @nodoc
mixin _$ChatPageState {

 Chat? get chat; List<ChatMessage> get messages; List<UserData> get users; ChatPageStatus get status; bool get isOnlineUser; dynamic get errorMessage;
/// Create a copy of ChatPageState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ChatPageStateCopyWith<ChatPageState> get copyWith => _$ChatPageStateCopyWithImpl<ChatPageState>(this as ChatPageState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChatPageState&&(identical(other.chat, chat) || other.chat == chat)&&const DeepCollectionEquality().equals(other.messages, messages)&&const DeepCollectionEquality().equals(other.users, users)&&(identical(other.status, status) || other.status == status)&&(identical(other.isOnlineUser, isOnlineUser) || other.isOnlineUser == isOnlineUser)&&const DeepCollectionEquality().equals(other.errorMessage, errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,chat,const DeepCollectionEquality().hash(messages),const DeepCollectionEquality().hash(users),status,isOnlineUser,const DeepCollectionEquality().hash(errorMessage));

@override
String toString() {
  return 'ChatPageState(chat: $chat, messages: $messages, users: $users, status: $status, isOnlineUser: $isOnlineUser, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class $ChatPageStateCopyWith<$Res>  {
  factory $ChatPageStateCopyWith(ChatPageState value, $Res Function(ChatPageState) _then) = _$ChatPageStateCopyWithImpl;
@useResult
$Res call({
 Chat? chat, List<ChatMessage> messages, List<UserData> users, ChatPageStatus status, bool isOnlineUser, dynamic errorMessage
});


$ChatCopyWith<$Res>? get chat;

}
/// @nodoc
class _$ChatPageStateCopyWithImpl<$Res>
    implements $ChatPageStateCopyWith<$Res> {
  _$ChatPageStateCopyWithImpl(this._self, this._then);

  final ChatPageState _self;
  final $Res Function(ChatPageState) _then;

/// Create a copy of ChatPageState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? chat = freezed,Object? messages = null,Object? users = null,Object? status = null,Object? isOnlineUser = null,Object? errorMessage = freezed,}) {
  return _then(_self.copyWith(
chat: freezed == chat ? _self.chat : chat // ignore: cast_nullable_to_non_nullable
as Chat?,messages: null == messages ? _self.messages : messages // ignore: cast_nullable_to_non_nullable
as List<ChatMessage>,users: null == users ? _self.users : users // ignore: cast_nullable_to_non_nullable
as List<UserData>,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as ChatPageStatus,isOnlineUser: null == isOnlineUser ? _self.isOnlineUser : isOnlineUser // ignore: cast_nullable_to_non_nullable
as bool,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as dynamic,
  ));
}
/// Create a copy of ChatPageState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ChatCopyWith<$Res>? get chat {
    if (_self.chat == null) {
    return null;
  }

  return $ChatCopyWith<$Res>(_self.chat!, (value) {
    return _then(_self.copyWith(chat: value));
  });
}
}


/// Adds pattern-matching-related methods to [ChatPageState].
extension ChatPageStatePatterns on ChatPageState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ChatPageState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ChatPageState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ChatPageState value)  $default,){
final _that = this;
switch (_that) {
case _ChatPageState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ChatPageState value)?  $default,){
final _that = this;
switch (_that) {
case _ChatPageState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( Chat? chat,  List<ChatMessage> messages,  List<UserData> users,  ChatPageStatus status,  bool isOnlineUser,  dynamic errorMessage)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ChatPageState() when $default != null:
return $default(_that.chat,_that.messages,_that.users,_that.status,_that.isOnlineUser,_that.errorMessage);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( Chat? chat,  List<ChatMessage> messages,  List<UserData> users,  ChatPageStatus status,  bool isOnlineUser,  dynamic errorMessage)  $default,) {final _that = this;
switch (_that) {
case _ChatPageState():
return $default(_that.chat,_that.messages,_that.users,_that.status,_that.isOnlineUser,_that.errorMessage);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( Chat? chat,  List<ChatMessage> messages,  List<UserData> users,  ChatPageStatus status,  bool isOnlineUser,  dynamic errorMessage)?  $default,) {final _that = this;
switch (_that) {
case _ChatPageState() when $default != null:
return $default(_that.chat,_that.messages,_that.users,_that.status,_that.isOnlineUser,_that.errorMessage);case _:
  return null;

}
}

}

/// @nodoc


class _ChatPageState implements ChatPageState {
   _ChatPageState({this.chat, final  List<ChatMessage> messages = const [], final  List<UserData> users = const [], this.status = ChatPageStatus.loading, this.isOnlineUser = true, this.errorMessage = ''}): _messages = messages,_users = users;
  

@override final  Chat? chat;
 final  List<ChatMessage> _messages;
@override@JsonKey() List<ChatMessage> get messages {
  if (_messages is EqualUnmodifiableListView) return _messages;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_messages);
}

 final  List<UserData> _users;
@override@JsonKey() List<UserData> get users {
  if (_users is EqualUnmodifiableListView) return _users;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_users);
}

@override@JsonKey() final  ChatPageStatus status;
@override@JsonKey() final  bool isOnlineUser;
@override@JsonKey() final  dynamic errorMessage;

/// Create a copy of ChatPageState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ChatPageStateCopyWith<_ChatPageState> get copyWith => __$ChatPageStateCopyWithImpl<_ChatPageState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ChatPageState&&(identical(other.chat, chat) || other.chat == chat)&&const DeepCollectionEquality().equals(other._messages, _messages)&&const DeepCollectionEquality().equals(other._users, _users)&&(identical(other.status, status) || other.status == status)&&(identical(other.isOnlineUser, isOnlineUser) || other.isOnlineUser == isOnlineUser)&&const DeepCollectionEquality().equals(other.errorMessage, errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,chat,const DeepCollectionEquality().hash(_messages),const DeepCollectionEquality().hash(_users),status,isOnlineUser,const DeepCollectionEquality().hash(errorMessage));

@override
String toString() {
  return 'ChatPageState(chat: $chat, messages: $messages, users: $users, status: $status, isOnlineUser: $isOnlineUser, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class _$ChatPageStateCopyWith<$Res> implements $ChatPageStateCopyWith<$Res> {
  factory _$ChatPageStateCopyWith(_ChatPageState value, $Res Function(_ChatPageState) _then) = __$ChatPageStateCopyWithImpl;
@override @useResult
$Res call({
 Chat? chat, List<ChatMessage> messages, List<UserData> users, ChatPageStatus status, bool isOnlineUser, dynamic errorMessage
});


@override $ChatCopyWith<$Res>? get chat;

}
/// @nodoc
class __$ChatPageStateCopyWithImpl<$Res>
    implements _$ChatPageStateCopyWith<$Res> {
  __$ChatPageStateCopyWithImpl(this._self, this._then);

  final _ChatPageState _self;
  final $Res Function(_ChatPageState) _then;

/// Create a copy of ChatPageState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? chat = freezed,Object? messages = null,Object? users = null,Object? status = null,Object? isOnlineUser = null,Object? errorMessage = freezed,}) {
  return _then(_ChatPageState(
chat: freezed == chat ? _self.chat : chat // ignore: cast_nullable_to_non_nullable
as Chat?,messages: null == messages ? _self._messages : messages // ignore: cast_nullable_to_non_nullable
as List<ChatMessage>,users: null == users ? _self._users : users // ignore: cast_nullable_to_non_nullable
as List<UserData>,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as ChatPageStatus,isOnlineUser: null == isOnlineUser ? _self.isOnlineUser : isOnlineUser // ignore: cast_nullable_to_non_nullable
as bool,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as dynamic,
  ));
}

/// Create a copy of ChatPageState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ChatCopyWith<$Res>? get chat {
    if (_self.chat == null) {
    return null;
  }

  return $ChatCopyWith<$Res>(_self.chat!, (value) {
    return _then(_self.copyWith(chat: value));
  });
}
}

// dart format on
