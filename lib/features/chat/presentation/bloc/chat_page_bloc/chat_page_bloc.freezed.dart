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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Subscribe value)?  subscribe,TResult Function( _Init value)?  init,TResult Function( _SendMessage value)?  sendMessage,TResult Function( _UpdateMessages value)?  updateMessages,TResult Function( _UpdateChat value)?  updateChat,TResult Function( _StartTyping value)?  startTyping,TResult Function( _EndTyping value)?  endTyping,TResult Function( _UpdateUserData value)?  updateUserData,TResult Function( _ToggleBlock value)?  toggleBlock,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Subscribe() when subscribe != null:
return subscribe(_that);case _Init() when init != null:
return init(_that);case _SendMessage() when sendMessage != null:
return sendMessage(_that);case _UpdateMessages() when updateMessages != null:
return updateMessages(_that);case _UpdateChat() when updateChat != null:
return updateChat(_that);case _StartTyping() when startTyping != null:
return startTyping(_that);case _EndTyping() when endTyping != null:
return endTyping(_that);case _UpdateUserData() when updateUserData != null:
return updateUserData(_that);case _ToggleBlock() when toggleBlock != null:
return toggleBlock(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Subscribe value)  subscribe,required TResult Function( _Init value)  init,required TResult Function( _SendMessage value)  sendMessage,required TResult Function( _UpdateMessages value)  updateMessages,required TResult Function( _UpdateChat value)  updateChat,required TResult Function( _StartTyping value)  startTyping,required TResult Function( _EndTyping value)  endTyping,required TResult Function( _UpdateUserData value)  updateUserData,required TResult Function( _ToggleBlock value)  toggleBlock,}){
final _that = this;
switch (_that) {
case _Subscribe():
return subscribe(_that);case _Init():
return init(_that);case _SendMessage():
return sendMessage(_that);case _UpdateMessages():
return updateMessages(_that);case _UpdateChat():
return updateChat(_that);case _StartTyping():
return startTyping(_that);case _EndTyping():
return endTyping(_that);case _UpdateUserData():
return updateUserData(_that);case _ToggleBlock():
return toggleBlock(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Subscribe value)?  subscribe,TResult? Function( _Init value)?  init,TResult? Function( _SendMessage value)?  sendMessage,TResult? Function( _UpdateMessages value)?  updateMessages,TResult? Function( _UpdateChat value)?  updateChat,TResult? Function( _StartTyping value)?  startTyping,TResult? Function( _EndTyping value)?  endTyping,TResult? Function( _UpdateUserData value)?  updateUserData,TResult? Function( _ToggleBlock value)?  toggleBlock,}){
final _that = this;
switch (_that) {
case _Subscribe() when subscribe != null:
return subscribe(_that);case _Init() when init != null:
return init(_that);case _SendMessage() when sendMessage != null:
return sendMessage(_that);case _UpdateMessages() when updateMessages != null:
return updateMessages(_that);case _UpdateChat() when updateChat != null:
return updateChat(_that);case _StartTyping() when startTyping != null:
return startTyping(_that);case _EndTyping() when endTyping != null:
return endTyping(_that);case _UpdateUserData() when updateUserData != null:
return updateUserData(_that);case _ToggleBlock() when toggleBlock != null:
return toggleBlock(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String uid)?  subscribe,TResult Function( String chatId)?  init,TResult Function( String message)?  sendMessage,TResult Function( List<ChatMessage> messages)?  updateMessages,TResult Function( Chat chat)?  updateChat,TResult Function()?  startTyping,TResult Function()?  endTyping,TResult Function( UserData user)?  updateUserData,TResult Function( String targetUid,  bool blocked)?  toggleBlock,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Subscribe() when subscribe != null:
return subscribe(_that.uid);case _Init() when init != null:
return init(_that.chatId);case _SendMessage() when sendMessage != null:
return sendMessage(_that.message);case _UpdateMessages() when updateMessages != null:
return updateMessages(_that.messages);case _UpdateChat() when updateChat != null:
return updateChat(_that.chat);case _StartTyping() when startTyping != null:
return startTyping();case _EndTyping() when endTyping != null:
return endTyping();case _UpdateUserData() when updateUserData != null:
return updateUserData(_that.user);case _ToggleBlock() when toggleBlock != null:
return toggleBlock(_that.targetUid,_that.blocked);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String uid)  subscribe,required TResult Function( String chatId)  init,required TResult Function( String message)  sendMessage,required TResult Function( List<ChatMessage> messages)  updateMessages,required TResult Function( Chat chat)  updateChat,required TResult Function()  startTyping,required TResult Function()  endTyping,required TResult Function( UserData user)  updateUserData,required TResult Function( String targetUid,  bool blocked)  toggleBlock,}) {final _that = this;
switch (_that) {
case _Subscribe():
return subscribe(_that.uid);case _Init():
return init(_that.chatId);case _SendMessage():
return sendMessage(_that.message);case _UpdateMessages():
return updateMessages(_that.messages);case _UpdateChat():
return updateChat(_that.chat);case _StartTyping():
return startTyping();case _EndTyping():
return endTyping();case _UpdateUserData():
return updateUserData(_that.user);case _ToggleBlock():
return toggleBlock(_that.targetUid,_that.blocked);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String uid)?  subscribe,TResult? Function( String chatId)?  init,TResult? Function( String message)?  sendMessage,TResult? Function( List<ChatMessage> messages)?  updateMessages,TResult? Function( Chat chat)?  updateChat,TResult? Function()?  startTyping,TResult? Function()?  endTyping,TResult? Function( UserData user)?  updateUserData,TResult? Function( String targetUid,  bool blocked)?  toggleBlock,}) {final _that = this;
switch (_that) {
case _Subscribe() when subscribe != null:
return subscribe(_that.uid);case _Init() when init != null:
return init(_that.chatId);case _SendMessage() when sendMessage != null:
return sendMessage(_that.message);case _UpdateMessages() when updateMessages != null:
return updateMessages(_that.messages);case _UpdateChat() when updateChat != null:
return updateChat(_that.chat);case _StartTyping() when startTyping != null:
return startTyping();case _EndTyping() when endTyping != null:
return endTyping();case _UpdateUserData() when updateUserData != null:
return updateUserData(_that.user);case _ToggleBlock() when toggleBlock != null:
return toggleBlock(_that.targetUid,_that.blocked);case _:
  return null;

}
}

}

/// @nodoc


class _Subscribe implements ChatPageEvent {
  const _Subscribe({required this.uid});
  

 final  String uid;

/// Create a copy of ChatPageEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SubscribeCopyWith<_Subscribe> get copyWith => __$SubscribeCopyWithImpl<_Subscribe>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Subscribe&&(identical(other.uid, uid) || other.uid == uid));
}


@override
int get hashCode => Object.hash(runtimeType,uid);

@override
String toString() {
  return 'ChatPageEvent.subscribe(uid: $uid)';
}


}

/// @nodoc
abstract mixin class _$SubscribeCopyWith<$Res> implements $ChatPageEventCopyWith<$Res> {
  factory _$SubscribeCopyWith(_Subscribe value, $Res Function(_Subscribe) _then) = __$SubscribeCopyWithImpl;
@useResult
$Res call({
 String uid
});




}
/// @nodoc
class __$SubscribeCopyWithImpl<$Res>
    implements _$SubscribeCopyWith<$Res> {
  __$SubscribeCopyWithImpl(this._self, this._then);

  final _Subscribe _self;
  final $Res Function(_Subscribe) _then;

/// Create a copy of ChatPageEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? uid = null,}) {
  return _then(_Subscribe(
uid: null == uid ? _self.uid : uid // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _Init implements ChatPageEvent {
  const _Init({required this.chatId});
  

 final  String chatId;

/// Create a copy of ChatPageEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$InitCopyWith<_Init> get copyWith => __$InitCopyWithImpl<_Init>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Init&&(identical(other.chatId, chatId) || other.chatId == chatId));
}


@override
int get hashCode => Object.hash(runtimeType,chatId);

@override
String toString() {
  return 'ChatPageEvent.init(chatId: $chatId)';
}


}

/// @nodoc
abstract mixin class _$InitCopyWith<$Res> implements $ChatPageEventCopyWith<$Res> {
  factory _$InitCopyWith(_Init value, $Res Function(_Init) _then) = __$InitCopyWithImpl;
@useResult
$Res call({
 String chatId
});




}
/// @nodoc
class __$InitCopyWithImpl<$Res>
    implements _$InitCopyWith<$Res> {
  __$InitCopyWithImpl(this._self, this._then);

  final _Init _self;
  final $Res Function(_Init) _then;

/// Create a copy of ChatPageEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? chatId = null,}) {
  return _then(_Init(
chatId: null == chatId ? _self.chatId : chatId // ignore: cast_nullable_to_non_nullable
as String,
  ));
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


class _StartTyping implements ChatPageEvent {
  const _StartTyping();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _StartTyping);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ChatPageEvent.startTyping()';
}


}




/// @nodoc


class _EndTyping implements ChatPageEvent {
  const _EndTyping();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _EndTyping);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ChatPageEvent.endTyping()';
}


}




/// @nodoc


class _UpdateUserData implements ChatPageEvent {
  const _UpdateUserData({required this.user});
  

 final  UserData user;

/// Create a copy of ChatPageEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UpdateUserDataCopyWith<_UpdateUserData> get copyWith => __$UpdateUserDataCopyWithImpl<_UpdateUserData>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UpdateUserData&&(identical(other.user, user) || other.user == user));
}


@override
int get hashCode => Object.hash(runtimeType,user);

@override
String toString() {
  return 'ChatPageEvent.updateUserData(user: $user)';
}


}

/// @nodoc
abstract mixin class _$UpdateUserDataCopyWith<$Res> implements $ChatPageEventCopyWith<$Res> {
  factory _$UpdateUserDataCopyWith(_UpdateUserData value, $Res Function(_UpdateUserData) _then) = __$UpdateUserDataCopyWithImpl;
@useResult
$Res call({
 UserData user
});


$UserDataCopyWith<$Res> get user;

}
/// @nodoc
class __$UpdateUserDataCopyWithImpl<$Res>
    implements _$UpdateUserDataCopyWith<$Res> {
  __$UpdateUserDataCopyWithImpl(this._self, this._then);

  final _UpdateUserData _self;
  final $Res Function(_UpdateUserData) _then;

/// Create a copy of ChatPageEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? user = null,}) {
  return _then(_UpdateUserData(
user: null == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as UserData,
  ));
}

/// Create a copy of ChatPageEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserDataCopyWith<$Res> get user {
  
  return $UserDataCopyWith<$Res>(_self.user, (value) {
    return _then(_self.copyWith(user: value));
  });
}
}

/// @nodoc


class _ToggleBlock implements ChatPageEvent {
  const _ToggleBlock({required this.targetUid, required this.blocked});
  

 final  String targetUid;
 final  bool blocked;

/// Create a copy of ChatPageEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ToggleBlockCopyWith<_ToggleBlock> get copyWith => __$ToggleBlockCopyWithImpl<_ToggleBlock>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ToggleBlock&&(identical(other.targetUid, targetUid) || other.targetUid == targetUid)&&(identical(other.blocked, blocked) || other.blocked == blocked));
}


@override
int get hashCode => Object.hash(runtimeType,targetUid,blocked);

@override
String toString() {
  return 'ChatPageEvent.toggleBlock(targetUid: $targetUid, blocked: $blocked)';
}


}

/// @nodoc
abstract mixin class _$ToggleBlockCopyWith<$Res> implements $ChatPageEventCopyWith<$Res> {
  factory _$ToggleBlockCopyWith(_ToggleBlock value, $Res Function(_ToggleBlock) _then) = __$ToggleBlockCopyWithImpl;
@useResult
$Res call({
 String targetUid, bool blocked
});




}
/// @nodoc
class __$ToggleBlockCopyWithImpl<$Res>
    implements _$ToggleBlockCopyWith<$Res> {
  __$ToggleBlockCopyWithImpl(this._self, this._then);

  final _ToggleBlock _self;
  final $Res Function(_ToggleBlock) _then;

/// Create a copy of ChatPageEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? targetUid = null,Object? blocked = null,}) {
  return _then(_ToggleBlock(
targetUid: null == targetUid ? _self.targetUid : targetUid // ignore: cast_nullable_to_non_nullable
as String,blocked: null == blocked ? _self.blocked : blocked // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

/// @nodoc
mixin _$ChatPageState {

 String get chatId; List<ChatMessage> get messages; List<UserData> get users; UserData? get userData; Chat? get chat; ChatPageStatus get status;// @Default(true) bool isOnlineUser,
 dynamic get errorMessage;
/// Create a copy of ChatPageState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ChatPageStateCopyWith<ChatPageState> get copyWith => _$ChatPageStateCopyWithImpl<ChatPageState>(this as ChatPageState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChatPageState&&(identical(other.chatId, chatId) || other.chatId == chatId)&&const DeepCollectionEquality().equals(other.messages, messages)&&const DeepCollectionEquality().equals(other.users, users)&&(identical(other.userData, userData) || other.userData == userData)&&(identical(other.chat, chat) || other.chat == chat)&&(identical(other.status, status) || other.status == status)&&const DeepCollectionEquality().equals(other.errorMessage, errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,chatId,const DeepCollectionEquality().hash(messages),const DeepCollectionEquality().hash(users),userData,chat,status,const DeepCollectionEquality().hash(errorMessage));

@override
String toString() {
  return 'ChatPageState(chatId: $chatId, messages: $messages, users: $users, userData: $userData, chat: $chat, status: $status, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class $ChatPageStateCopyWith<$Res>  {
  factory $ChatPageStateCopyWith(ChatPageState value, $Res Function(ChatPageState) _then) = _$ChatPageStateCopyWithImpl;
@useResult
$Res call({
 String chatId, List<ChatMessage> messages, List<UserData> users, UserData? userData, Chat? chat, ChatPageStatus status, dynamic errorMessage
});


$UserDataCopyWith<$Res>? get userData;$ChatCopyWith<$Res>? get chat;

}
/// @nodoc
class _$ChatPageStateCopyWithImpl<$Res>
    implements $ChatPageStateCopyWith<$Res> {
  _$ChatPageStateCopyWithImpl(this._self, this._then);

  final ChatPageState _self;
  final $Res Function(ChatPageState) _then;

/// Create a copy of ChatPageState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? chatId = null,Object? messages = null,Object? users = null,Object? userData = freezed,Object? chat = freezed,Object? status = null,Object? errorMessage = freezed,}) {
  return _then(_self.copyWith(
chatId: null == chatId ? _self.chatId : chatId // ignore: cast_nullable_to_non_nullable
as String,messages: null == messages ? _self.messages : messages // ignore: cast_nullable_to_non_nullable
as List<ChatMessage>,users: null == users ? _self.users : users // ignore: cast_nullable_to_non_nullable
as List<UserData>,userData: freezed == userData ? _self.userData : userData // ignore: cast_nullable_to_non_nullable
as UserData?,chat: freezed == chat ? _self.chat : chat // ignore: cast_nullable_to_non_nullable
as Chat?,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as ChatPageStatus,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as dynamic,
  ));
}
/// Create a copy of ChatPageState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserDataCopyWith<$Res>? get userData {
    if (_self.userData == null) {
    return null;
  }

  return $UserDataCopyWith<$Res>(_self.userData!, (value) {
    return _then(_self.copyWith(userData: value));
  });
}/// Create a copy of ChatPageState
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String chatId,  List<ChatMessage> messages,  List<UserData> users,  UserData? userData,  Chat? chat,  ChatPageStatus status,  dynamic errorMessage)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ChatPageState() when $default != null:
return $default(_that.chatId,_that.messages,_that.users,_that.userData,_that.chat,_that.status,_that.errorMessage);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String chatId,  List<ChatMessage> messages,  List<UserData> users,  UserData? userData,  Chat? chat,  ChatPageStatus status,  dynamic errorMessage)  $default,) {final _that = this;
switch (_that) {
case _ChatPageState():
return $default(_that.chatId,_that.messages,_that.users,_that.userData,_that.chat,_that.status,_that.errorMessage);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String chatId,  List<ChatMessage> messages,  List<UserData> users,  UserData? userData,  Chat? chat,  ChatPageStatus status,  dynamic errorMessage)?  $default,) {final _that = this;
switch (_that) {
case _ChatPageState() when $default != null:
return $default(_that.chatId,_that.messages,_that.users,_that.userData,_that.chat,_that.status,_that.errorMessage);case _:
  return null;

}
}

}

/// @nodoc


class _ChatPageState implements ChatPageState {
   _ChatPageState({this.chatId = '', final  List<ChatMessage> messages = const [], final  List<UserData> users = const [], this.userData, this.chat, this.status = ChatPageStatus.loading, this.errorMessage = ''}): _messages = messages,_users = users;
  

@override@JsonKey() final  String chatId;
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

@override final  UserData? userData;
@override final  Chat? chat;
@override@JsonKey() final  ChatPageStatus status;
// @Default(true) bool isOnlineUser,
@override@JsonKey() final  dynamic errorMessage;

/// Create a copy of ChatPageState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ChatPageStateCopyWith<_ChatPageState> get copyWith => __$ChatPageStateCopyWithImpl<_ChatPageState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ChatPageState&&(identical(other.chatId, chatId) || other.chatId == chatId)&&const DeepCollectionEquality().equals(other._messages, _messages)&&const DeepCollectionEquality().equals(other._users, _users)&&(identical(other.userData, userData) || other.userData == userData)&&(identical(other.chat, chat) || other.chat == chat)&&(identical(other.status, status) || other.status == status)&&const DeepCollectionEquality().equals(other.errorMessage, errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,chatId,const DeepCollectionEquality().hash(_messages),const DeepCollectionEquality().hash(_users),userData,chat,status,const DeepCollectionEquality().hash(errorMessage));

@override
String toString() {
  return 'ChatPageState(chatId: $chatId, messages: $messages, users: $users, userData: $userData, chat: $chat, status: $status, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class _$ChatPageStateCopyWith<$Res> implements $ChatPageStateCopyWith<$Res> {
  factory _$ChatPageStateCopyWith(_ChatPageState value, $Res Function(_ChatPageState) _then) = __$ChatPageStateCopyWithImpl;
@override @useResult
$Res call({
 String chatId, List<ChatMessage> messages, List<UserData> users, UserData? userData, Chat? chat, ChatPageStatus status, dynamic errorMessage
});


@override $UserDataCopyWith<$Res>? get userData;@override $ChatCopyWith<$Res>? get chat;

}
/// @nodoc
class __$ChatPageStateCopyWithImpl<$Res>
    implements _$ChatPageStateCopyWith<$Res> {
  __$ChatPageStateCopyWithImpl(this._self, this._then);

  final _ChatPageState _self;
  final $Res Function(_ChatPageState) _then;

/// Create a copy of ChatPageState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? chatId = null,Object? messages = null,Object? users = null,Object? userData = freezed,Object? chat = freezed,Object? status = null,Object? errorMessage = freezed,}) {
  return _then(_ChatPageState(
chatId: null == chatId ? _self.chatId : chatId // ignore: cast_nullable_to_non_nullable
as String,messages: null == messages ? _self._messages : messages // ignore: cast_nullable_to_non_nullable
as List<ChatMessage>,users: null == users ? _self._users : users // ignore: cast_nullable_to_non_nullable
as List<UserData>,userData: freezed == userData ? _self.userData : userData // ignore: cast_nullable_to_non_nullable
as UserData?,chat: freezed == chat ? _self.chat : chat // ignore: cast_nullable_to_non_nullable
as Chat?,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as ChatPageStatus,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as dynamic,
  ));
}

/// Create a copy of ChatPageState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserDataCopyWith<$Res>? get userData {
    if (_self.userData == null) {
    return null;
  }

  return $UserDataCopyWith<$Res>(_self.userData!, (value) {
    return _then(_self.copyWith(userData: value));
  });
}/// Create a copy of ChatPageState
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
