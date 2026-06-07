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

 String get chatId; String get lastMessage;@TimestampConverter() DateTime get lastMessageSent; String get lastMessageSentBy; ChatConfig get config; List<String> get typingUsers; Map<String, ParticipantInfo> get participantInfo;/// Per-user block flags keyed by userId. A missing key means the user
/// has not blocked the chat (default false).
@JsonKey(fromJson: _blockedFromJson) Map<String, bool> get blocked;/// who access this chat
 List<String> get participants;@TimestampConverter() DateTime get createdAt; String get icon; List<String> get searchKeywords;
/// Create a copy of Chat
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ChatCopyWith<Chat> get copyWith => _$ChatCopyWithImpl<Chat>(this as Chat, _$identity);

  /// Serializes this Chat to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Chat&&(identical(other.chatId, chatId) || other.chatId == chatId)&&(identical(other.lastMessage, lastMessage) || other.lastMessage == lastMessage)&&(identical(other.lastMessageSent, lastMessageSent) || other.lastMessageSent == lastMessageSent)&&(identical(other.lastMessageSentBy, lastMessageSentBy) || other.lastMessageSentBy == lastMessageSentBy)&&(identical(other.config, config) || other.config == config)&&const DeepCollectionEquality().equals(other.typingUsers, typingUsers)&&const DeepCollectionEquality().equals(other.participantInfo, participantInfo)&&const DeepCollectionEquality().equals(other.blocked, blocked)&&const DeepCollectionEquality().equals(other.participants, participants)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.icon, icon) || other.icon == icon)&&const DeepCollectionEquality().equals(other.searchKeywords, searchKeywords));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,chatId,lastMessage,lastMessageSent,lastMessageSentBy,config,const DeepCollectionEquality().hash(typingUsers),const DeepCollectionEquality().hash(participantInfo),const DeepCollectionEquality().hash(blocked),const DeepCollectionEquality().hash(participants),createdAt,icon,const DeepCollectionEquality().hash(searchKeywords));

@override
String toString() {
  return 'Chat(chatId: $chatId, lastMessage: $lastMessage, lastMessageSent: $lastMessageSent, lastMessageSentBy: $lastMessageSentBy, config: $config, typingUsers: $typingUsers, participantInfo: $participantInfo, blocked: $blocked, participants: $participants, createdAt: $createdAt, icon: $icon, searchKeywords: $searchKeywords)';
}


}

/// @nodoc
abstract mixin class $ChatCopyWith<$Res>  {
  factory $ChatCopyWith(Chat value, $Res Function(Chat) _then) = _$ChatCopyWithImpl;
@useResult
$Res call({
 String chatId, String lastMessage,@TimestampConverter() DateTime lastMessageSent, String lastMessageSentBy, ChatConfig config, List<String> typingUsers, Map<String, ParticipantInfo> participantInfo,@JsonKey(fromJson: _blockedFromJson) Map<String, bool> blocked, List<String> participants,@TimestampConverter() DateTime createdAt, String icon, List<String> searchKeywords
});


$ChatConfigCopyWith<$Res> get config;

}
/// @nodoc
class _$ChatCopyWithImpl<$Res>
    implements $ChatCopyWith<$Res> {
  _$ChatCopyWithImpl(this._self, this._then);

  final Chat _self;
  final $Res Function(Chat) _then;

/// Create a copy of Chat
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? chatId = null,Object? lastMessage = null,Object? lastMessageSent = null,Object? lastMessageSentBy = null,Object? config = null,Object? typingUsers = null,Object? participantInfo = null,Object? blocked = null,Object? participants = null,Object? createdAt = null,Object? icon = null,Object? searchKeywords = null,}) {
  return _then(_self.copyWith(
chatId: null == chatId ? _self.chatId : chatId // ignore: cast_nullable_to_non_nullable
as String,lastMessage: null == lastMessage ? _self.lastMessage : lastMessage // ignore: cast_nullable_to_non_nullable
as String,lastMessageSent: null == lastMessageSent ? _self.lastMessageSent : lastMessageSent // ignore: cast_nullable_to_non_nullable
as DateTime,lastMessageSentBy: null == lastMessageSentBy ? _self.lastMessageSentBy : lastMessageSentBy // ignore: cast_nullable_to_non_nullable
as String,config: null == config ? _self.config : config // ignore: cast_nullable_to_non_nullable
as ChatConfig,typingUsers: null == typingUsers ? _self.typingUsers : typingUsers // ignore: cast_nullable_to_non_nullable
as List<String>,participantInfo: null == participantInfo ? _self.participantInfo : participantInfo // ignore: cast_nullable_to_non_nullable
as Map<String, ParticipantInfo>,blocked: null == blocked ? _self.blocked : blocked // ignore: cast_nullable_to_non_nullable
as Map<String, bool>,participants: null == participants ? _self.participants : participants // ignore: cast_nullable_to_non_nullable
as List<String>,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,icon: null == icon ? _self.icon : icon // ignore: cast_nullable_to_non_nullable
as String,searchKeywords: null == searchKeywords ? _self.searchKeywords : searchKeywords // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}
/// Create a copy of Chat
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ChatConfigCopyWith<$Res> get config {
  
  return $ChatConfigCopyWith<$Res>(_self.config, (value) {
    return _then(_self.copyWith(config: value));
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String chatId,  String lastMessage, @TimestampConverter()  DateTime lastMessageSent,  String lastMessageSentBy,  ChatConfig config,  List<String> typingUsers,  Map<String, ParticipantInfo> participantInfo, @JsonKey(fromJson: _blockedFromJson)  Map<String, bool> blocked,  List<String> participants, @TimestampConverter()  DateTime createdAt,  String icon,  List<String> searchKeywords)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Chat() when $default != null:
return $default(_that.chatId,_that.lastMessage,_that.lastMessageSent,_that.lastMessageSentBy,_that.config,_that.typingUsers,_that.participantInfo,_that.blocked,_that.participants,_that.createdAt,_that.icon,_that.searchKeywords);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String chatId,  String lastMessage, @TimestampConverter()  DateTime lastMessageSent,  String lastMessageSentBy,  ChatConfig config,  List<String> typingUsers,  Map<String, ParticipantInfo> participantInfo, @JsonKey(fromJson: _blockedFromJson)  Map<String, bool> blocked,  List<String> participants, @TimestampConverter()  DateTime createdAt,  String icon,  List<String> searchKeywords)  $default,) {final _that = this;
switch (_that) {
case _Chat():
return $default(_that.chatId,_that.lastMessage,_that.lastMessageSent,_that.lastMessageSentBy,_that.config,_that.typingUsers,_that.participantInfo,_that.blocked,_that.participants,_that.createdAt,_that.icon,_that.searchKeywords);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String chatId,  String lastMessage, @TimestampConverter()  DateTime lastMessageSent,  String lastMessageSentBy,  ChatConfig config,  List<String> typingUsers,  Map<String, ParticipantInfo> participantInfo, @JsonKey(fromJson: _blockedFromJson)  Map<String, bool> blocked,  List<String> participants, @TimestampConverter()  DateTime createdAt,  String icon,  List<String> searchKeywords)?  $default,) {final _that = this;
switch (_that) {
case _Chat() when $default != null:
return $default(_that.chatId,_that.lastMessage,_that.lastMessageSent,_that.lastMessageSentBy,_that.config,_that.typingUsers,_that.participantInfo,_that.blocked,_that.participants,_that.createdAt,_that.icon,_that.searchKeywords);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Chat implements Chat {
  const _Chat({this.chatId = '', this.lastMessage = '', @TimestampConverter() required this.lastMessageSent, this.lastMessageSentBy = '', required this.config, final  List<String> typingUsers = const [], final  Map<String, ParticipantInfo> participantInfo = const {}, @JsonKey(fromJson: _blockedFromJson) final  Map<String, bool> blocked = const {}, required final  List<String> participants, @TimestampConverter() required this.createdAt, this.icon = '', final  List<String> searchKeywords = const []}): _typingUsers = typingUsers,_participantInfo = participantInfo,_blocked = blocked,_participants = participants,_searchKeywords = searchKeywords;
  factory _Chat.fromJson(Map<String, dynamic> json) => _$ChatFromJson(json);

@override@JsonKey() final  String chatId;
@override@JsonKey() final  String lastMessage;
@override@TimestampConverter() final  DateTime lastMessageSent;
@override@JsonKey() final  String lastMessageSentBy;
@override final  ChatConfig config;
 final  List<String> _typingUsers;
@override@JsonKey() List<String> get typingUsers {
  if (_typingUsers is EqualUnmodifiableListView) return _typingUsers;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_typingUsers);
}

 final  Map<String, ParticipantInfo> _participantInfo;
@override@JsonKey() Map<String, ParticipantInfo> get participantInfo {
  if (_participantInfo is EqualUnmodifiableMapView) return _participantInfo;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_participantInfo);
}

/// Per-user block flags keyed by userId. A missing key means the user
/// has not blocked the chat (default false).
 final  Map<String, bool> _blocked;
/// Per-user block flags keyed by userId. A missing key means the user
/// has not blocked the chat (default false).
@override@JsonKey(fromJson: _blockedFromJson) Map<String, bool> get blocked {
  if (_blocked is EqualUnmodifiableMapView) return _blocked;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_blocked);
}

/// who access this chat
 final  List<String> _participants;
/// who access this chat
@override List<String> get participants {
  if (_participants is EqualUnmodifiableListView) return _participants;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_participants);
}

@override@TimestampConverter() final  DateTime createdAt;
@override@JsonKey() final  String icon;
 final  List<String> _searchKeywords;
@override@JsonKey() List<String> get searchKeywords {
  if (_searchKeywords is EqualUnmodifiableListView) return _searchKeywords;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_searchKeywords);
}


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
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Chat&&(identical(other.chatId, chatId) || other.chatId == chatId)&&(identical(other.lastMessage, lastMessage) || other.lastMessage == lastMessage)&&(identical(other.lastMessageSent, lastMessageSent) || other.lastMessageSent == lastMessageSent)&&(identical(other.lastMessageSentBy, lastMessageSentBy) || other.lastMessageSentBy == lastMessageSentBy)&&(identical(other.config, config) || other.config == config)&&const DeepCollectionEquality().equals(other._typingUsers, _typingUsers)&&const DeepCollectionEquality().equals(other._participantInfo, _participantInfo)&&const DeepCollectionEquality().equals(other._blocked, _blocked)&&const DeepCollectionEquality().equals(other._participants, _participants)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.icon, icon) || other.icon == icon)&&const DeepCollectionEquality().equals(other._searchKeywords, _searchKeywords));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,chatId,lastMessage,lastMessageSent,lastMessageSentBy,config,const DeepCollectionEquality().hash(_typingUsers),const DeepCollectionEquality().hash(_participantInfo),const DeepCollectionEquality().hash(_blocked),const DeepCollectionEquality().hash(_participants),createdAt,icon,const DeepCollectionEquality().hash(_searchKeywords));

@override
String toString() {
  return 'Chat(chatId: $chatId, lastMessage: $lastMessage, lastMessageSent: $lastMessageSent, lastMessageSentBy: $lastMessageSentBy, config: $config, typingUsers: $typingUsers, participantInfo: $participantInfo, blocked: $blocked, participants: $participants, createdAt: $createdAt, icon: $icon, searchKeywords: $searchKeywords)';
}


}

/// @nodoc
abstract mixin class _$ChatCopyWith<$Res> implements $ChatCopyWith<$Res> {
  factory _$ChatCopyWith(_Chat value, $Res Function(_Chat) _then) = __$ChatCopyWithImpl;
@override @useResult
$Res call({
 String chatId, String lastMessage,@TimestampConverter() DateTime lastMessageSent, String lastMessageSentBy, ChatConfig config, List<String> typingUsers, Map<String, ParticipantInfo> participantInfo,@JsonKey(fromJson: _blockedFromJson) Map<String, bool> blocked, List<String> participants,@TimestampConverter() DateTime createdAt, String icon, List<String> searchKeywords
});


@override $ChatConfigCopyWith<$Res> get config;

}
/// @nodoc
class __$ChatCopyWithImpl<$Res>
    implements _$ChatCopyWith<$Res> {
  __$ChatCopyWithImpl(this._self, this._then);

  final _Chat _self;
  final $Res Function(_Chat) _then;

/// Create a copy of Chat
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? chatId = null,Object? lastMessage = null,Object? lastMessageSent = null,Object? lastMessageSentBy = null,Object? config = null,Object? typingUsers = null,Object? participantInfo = null,Object? blocked = null,Object? participants = null,Object? createdAt = null,Object? icon = null,Object? searchKeywords = null,}) {
  return _then(_Chat(
chatId: null == chatId ? _self.chatId : chatId // ignore: cast_nullable_to_non_nullable
as String,lastMessage: null == lastMessage ? _self.lastMessage : lastMessage // ignore: cast_nullable_to_non_nullable
as String,lastMessageSent: null == lastMessageSent ? _self.lastMessageSent : lastMessageSent // ignore: cast_nullable_to_non_nullable
as DateTime,lastMessageSentBy: null == lastMessageSentBy ? _self.lastMessageSentBy : lastMessageSentBy // ignore: cast_nullable_to_non_nullable
as String,config: null == config ? _self.config : config // ignore: cast_nullable_to_non_nullable
as ChatConfig,typingUsers: null == typingUsers ? _self._typingUsers : typingUsers // ignore: cast_nullable_to_non_nullable
as List<String>,participantInfo: null == participantInfo ? _self._participantInfo : participantInfo // ignore: cast_nullable_to_non_nullable
as Map<String, ParticipantInfo>,blocked: null == blocked ? _self._blocked : blocked // ignore: cast_nullable_to_non_nullable
as Map<String, bool>,participants: null == participants ? _self._participants : participants // ignore: cast_nullable_to_non_nullable
as List<String>,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,icon: null == icon ? _self.icon : icon // ignore: cast_nullable_to_non_nullable
as String,searchKeywords: null == searchKeywords ? _self._searchKeywords : searchKeywords // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}

/// Create a copy of Chat
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ChatConfigCopyWith<$Res> get config {
  
  return $ChatConfigCopyWith<$Res>(_self.config, (value) {
    return _then(_self.copyWith(config: value));
  });
}
}

// dart format on
