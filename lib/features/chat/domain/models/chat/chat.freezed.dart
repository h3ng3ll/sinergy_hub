// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chat.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Chat {

 String get chatId; ChatInfo get info; String get lastMessage; DateTime get lastMessageSent; List<String> get typingUsers;/// who access this chat
 List<String> get participants; bool get isArchived; bool get isFavorite; DateTime get createdAt; String get icon;
/// Create a copy of Chat
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ChatCopyWith<Chat> get copyWith => _$ChatCopyWithImpl<Chat>(this as Chat, _$identity);

  /// Serializes this Chat to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Chat&&(identical(other.chatId, chatId) || other.chatId == chatId)&&(identical(other.info, info) || other.info == info)&&(identical(other.lastMessage, lastMessage) || other.lastMessage == lastMessage)&&(identical(other.lastMessageSent, lastMessageSent) || other.lastMessageSent == lastMessageSent)&&const DeepCollectionEquality().equals(other.typingUsers, typingUsers)&&const DeepCollectionEquality().equals(other.participants, participants)&&(identical(other.isArchived, isArchived) || other.isArchived == isArchived)&&(identical(other.isFavorite, isFavorite) || other.isFavorite == isFavorite)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.icon, icon) || other.icon == icon));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,chatId,info,lastMessage,lastMessageSent,const DeepCollectionEquality().hash(typingUsers),const DeepCollectionEquality().hash(participants),isArchived,isFavorite,createdAt,icon);

@override
String toString() {
  return 'Chat(chatId: $chatId, info: $info, lastMessage: $lastMessage, lastMessageSent: $lastMessageSent, typingUsers: $typingUsers, participants: $participants, isArchived: $isArchived, isFavorite: $isFavorite, createdAt: $createdAt, icon: $icon)';
}


}

/// @nodoc
abstract mixin class $ChatCopyWith<$Res>  {
  factory $ChatCopyWith(Chat value, $Res Function(Chat) _then) = _$ChatCopyWithImpl;
@useResult
$Res call({
 String chatId, ChatInfo info, String lastMessage, DateTime lastMessageSent, List<String> typingUsers, List<String> participants, bool isArchived, bool isFavorite, DateTime createdAt, String icon
});


$ChatInfoCopyWith<$Res> get info;

}
/// @nodoc
class _$ChatCopyWithImpl<$Res>
    implements $ChatCopyWith<$Res> {
  _$ChatCopyWithImpl(this._self, this._then);

  final Chat _self;
  final $Res Function(Chat) _then;

/// Create a copy of Chat
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? chatId = null,Object? info = null,Object? lastMessage = null,Object? lastMessageSent = null,Object? typingUsers = null,Object? participants = null,Object? isArchived = null,Object? isFavorite = null,Object? createdAt = null,Object? icon = null,}) {
  return _then(_self.copyWith(
chatId: null == chatId ? _self.chatId : chatId // ignore: cast_nullable_to_non_nullable
as String,info: null == info ? _self.info : info // ignore: cast_nullable_to_non_nullable
as ChatInfo,lastMessage: null == lastMessage ? _self.lastMessage : lastMessage // ignore: cast_nullable_to_non_nullable
as String,lastMessageSent: null == lastMessageSent ? _self.lastMessageSent : lastMessageSent // ignore: cast_nullable_to_non_nullable
as DateTime,typingUsers: null == typingUsers ? _self.typingUsers : typingUsers // ignore: cast_nullable_to_non_nullable
as List<String>,participants: null == participants ? _self.participants : participants // ignore: cast_nullable_to_non_nullable
as List<String>,isArchived: null == isArchived ? _self.isArchived : isArchived // ignore: cast_nullable_to_non_nullable
as bool,isFavorite: null == isFavorite ? _self.isFavorite : isFavorite // ignore: cast_nullable_to_non_nullable
as bool,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,icon: null == icon ? _self.icon : icon // ignore: cast_nullable_to_non_nullable
as String,
  ));
}
/// Create a copy of Chat
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ChatInfoCopyWith<$Res> get info {
  
  return $ChatInfoCopyWith<$Res>(_self.info, (value) {
    return _then(_self.copyWith(info: value));
  });
}
}


/// Adds pattern-matching-related methods to [Chat].
extension ChatPatterns on Chat {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Chat value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Chat() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Chat value)  $default,){
final _that = this;
switch (_that) {
case _Chat():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Chat value)?  $default,){
final _that = this;
switch (_that) {
case _Chat() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String chatId,  ChatInfo info,  String lastMessage,  DateTime lastMessageSent,  List<String> typingUsers,  List<String> participants,  bool isArchived,  bool isFavorite,  DateTime createdAt,  String icon)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Chat() when $default != null:
return $default(_that.chatId,_that.info,_that.lastMessage,_that.lastMessageSent,_that.typingUsers,_that.participants,_that.isArchived,_that.isFavorite,_that.createdAt,_that.icon);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String chatId,  ChatInfo info,  String lastMessage,  DateTime lastMessageSent,  List<String> typingUsers,  List<String> participants,  bool isArchived,  bool isFavorite,  DateTime createdAt,  String icon)  $default,) {final _that = this;
switch (_that) {
case _Chat():
return $default(_that.chatId,_that.info,_that.lastMessage,_that.lastMessageSent,_that.typingUsers,_that.participants,_that.isArchived,_that.isFavorite,_that.createdAt,_that.icon);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String chatId,  ChatInfo info,  String lastMessage,  DateTime lastMessageSent,  List<String> typingUsers,  List<String> participants,  bool isArchived,  bool isFavorite,  DateTime createdAt,  String icon)?  $default,) {final _that = this;
switch (_that) {
case _Chat() when $default != null:
return $default(_that.chatId,_that.info,_that.lastMessage,_that.lastMessageSent,_that.typingUsers,_that.participants,_that.isArchived,_that.isFavorite,_that.createdAt,_that.icon);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Chat implements Chat {
  const _Chat({this.chatId = '', required this.info, this.lastMessage = '', required this.lastMessageSent, final  List<String> typingUsers = const [], required final  List<String> participants, this.isArchived = false, this.isFavorite = false, required this.createdAt, this.icon = ''}): _typingUsers = typingUsers,_participants = participants;
  factory _Chat.fromJson(Map<String, dynamic> json) => _$ChatFromJson(json);

@override@JsonKey() final  String chatId;
@override final  ChatInfo info;
@override@JsonKey() final  String lastMessage;
@override final  DateTime lastMessageSent;
 final  List<String> _typingUsers;
@override@JsonKey() List<String> get typingUsers {
  if (_typingUsers is EqualUnmodifiableListView) return _typingUsers;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_typingUsers);
}

/// who access this chat
 final  List<String> _participants;
/// who access this chat
@override List<String> get participants {
  if (_participants is EqualUnmodifiableListView) return _participants;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_participants);
}

@override@JsonKey() final  bool isArchived;
@override@JsonKey() final  bool isFavorite;
@override final  DateTime createdAt;
@override@JsonKey() final  String icon;

/// Create a copy of Chat
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ChatCopyWith<_Chat> get copyWith => __$ChatCopyWithImpl<_Chat>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ChatToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Chat&&(identical(other.chatId, chatId) || other.chatId == chatId)&&(identical(other.info, info) || other.info == info)&&(identical(other.lastMessage, lastMessage) || other.lastMessage == lastMessage)&&(identical(other.lastMessageSent, lastMessageSent) || other.lastMessageSent == lastMessageSent)&&const DeepCollectionEquality().equals(other._typingUsers, _typingUsers)&&const DeepCollectionEquality().equals(other._participants, _participants)&&(identical(other.isArchived, isArchived) || other.isArchived == isArchived)&&(identical(other.isFavorite, isFavorite) || other.isFavorite == isFavorite)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.icon, icon) || other.icon == icon));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,chatId,info,lastMessage,lastMessageSent,const DeepCollectionEquality().hash(_typingUsers),const DeepCollectionEquality().hash(_participants),isArchived,isFavorite,createdAt,icon);

@override
String toString() {
  return 'Chat(chatId: $chatId, info: $info, lastMessage: $lastMessage, lastMessageSent: $lastMessageSent, typingUsers: $typingUsers, participants: $participants, isArchived: $isArchived, isFavorite: $isFavorite, createdAt: $createdAt, icon: $icon)';
}


}

/// @nodoc
abstract mixin class _$ChatCopyWith<$Res> implements $ChatCopyWith<$Res> {
  factory _$ChatCopyWith(_Chat value, $Res Function(_Chat) _then) = __$ChatCopyWithImpl;
@override @useResult
$Res call({
 String chatId, ChatInfo info, String lastMessage, DateTime lastMessageSent, List<String> typingUsers, List<String> participants, bool isArchived, bool isFavorite, DateTime createdAt, String icon
});


@override $ChatInfoCopyWith<$Res> get info;

}
/// @nodoc
class __$ChatCopyWithImpl<$Res>
    implements _$ChatCopyWith<$Res> {
  __$ChatCopyWithImpl(this._self, this._then);

  final _Chat _self;
  final $Res Function(_Chat) _then;

/// Create a copy of Chat
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? chatId = null,Object? info = null,Object? lastMessage = null,Object? lastMessageSent = null,Object? typingUsers = null,Object? participants = null,Object? isArchived = null,Object? isFavorite = null,Object? createdAt = null,Object? icon = null,}) {
  return _then(_Chat(
chatId: null == chatId ? _self.chatId : chatId // ignore: cast_nullable_to_non_nullable
as String,info: null == info ? _self.info : info // ignore: cast_nullable_to_non_nullable
as ChatInfo,lastMessage: null == lastMessage ? _self.lastMessage : lastMessage // ignore: cast_nullable_to_non_nullable
as String,lastMessageSent: null == lastMessageSent ? _self.lastMessageSent : lastMessageSent // ignore: cast_nullable_to_non_nullable
as DateTime,typingUsers: null == typingUsers ? _self._typingUsers : typingUsers // ignore: cast_nullable_to_non_nullable
as List<String>,participants: null == participants ? _self._participants : participants // ignore: cast_nullable_to_non_nullable
as List<String>,isArchived: null == isArchived ? _self.isArchived : isArchived // ignore: cast_nullable_to_non_nullable
as bool,isFavorite: null == isFavorite ? _self.isFavorite : isFavorite // ignore: cast_nullable_to_non_nullable
as bool,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,icon: null == icon ? _self.icon : icon // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

/// Create a copy of Chat
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ChatInfoCopyWith<$Res> get info {
  
  return $ChatInfoCopyWith<$Res>(_self.info, (value) {
    return _then(_self.copyWith(info: value));
  });
}
}

// dart format on
