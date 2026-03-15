// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chat_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ChatDto {

 String get chatId; String get lastMessage; List<String> get typingUsers;@TimestampConverter() DateTime get lastMessageSent; List<String> get searchKeywords; dynamic get hasRead; List<ParticipantsInfo> get participantsInfo; ChatConfigDto get config;/// who access this chat
 List<String> get participants;@TimestampConverter() DateTime get createdAt;
/// Create a copy of ChatDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ChatDtoCopyWith<ChatDto> get copyWith => _$ChatDtoCopyWithImpl<ChatDto>(this as ChatDto, _$identity);

  /// Serializes this ChatDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChatDto&&(identical(other.chatId, chatId) || other.chatId == chatId)&&(identical(other.lastMessage, lastMessage) || other.lastMessage == lastMessage)&&const DeepCollectionEquality().equals(other.typingUsers, typingUsers)&&(identical(other.lastMessageSent, lastMessageSent) || other.lastMessageSent == lastMessageSent)&&const DeepCollectionEquality().equals(other.searchKeywords, searchKeywords)&&const DeepCollectionEquality().equals(other.hasRead, hasRead)&&const DeepCollectionEquality().equals(other.participantsInfo, participantsInfo)&&(identical(other.config, config) || other.config == config)&&const DeepCollectionEquality().equals(other.participants, participants)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,chatId,lastMessage,const DeepCollectionEquality().hash(typingUsers),lastMessageSent,const DeepCollectionEquality().hash(searchKeywords),const DeepCollectionEquality().hash(hasRead),const DeepCollectionEquality().hash(participantsInfo),config,const DeepCollectionEquality().hash(participants),createdAt);

@override
String toString() {
  return 'ChatDto(chatId: $chatId, lastMessage: $lastMessage, typingUsers: $typingUsers, lastMessageSent: $lastMessageSent, searchKeywords: $searchKeywords, hasRead: $hasRead, participantsInfo: $participantsInfo, config: $config, participants: $participants, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class $ChatDtoCopyWith<$Res>  {
  factory $ChatDtoCopyWith(ChatDto value, $Res Function(ChatDto) _then) = _$ChatDtoCopyWithImpl;
@useResult
$Res call({
 String chatId, String lastMessage, List<String> typingUsers,@TimestampConverter() DateTime lastMessageSent, List<String> searchKeywords, dynamic hasRead, List<ParticipantsInfo> participantsInfo, ChatConfigDto config, List<String> participants,@TimestampConverter() DateTime createdAt
});


$ChatConfigDtoCopyWith<$Res> get config;

}
/// @nodoc
class _$ChatDtoCopyWithImpl<$Res>
    implements $ChatDtoCopyWith<$Res> {
  _$ChatDtoCopyWithImpl(this._self, this._then);

  final ChatDto _self;
  final $Res Function(ChatDto) _then;

/// Create a copy of ChatDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? chatId = null,Object? lastMessage = null,Object? typingUsers = null,Object? lastMessageSent = null,Object? searchKeywords = null,Object? hasRead = freezed,Object? participantsInfo = null,Object? config = null,Object? participants = null,Object? createdAt = null,}) {
  return _then(_self.copyWith(
chatId: null == chatId ? _self.chatId : chatId // ignore: cast_nullable_to_non_nullable
as String,lastMessage: null == lastMessage ? _self.lastMessage : lastMessage // ignore: cast_nullable_to_non_nullable
as String,typingUsers: null == typingUsers ? _self.typingUsers : typingUsers // ignore: cast_nullable_to_non_nullable
as List<String>,lastMessageSent: null == lastMessageSent ? _self.lastMessageSent : lastMessageSent // ignore: cast_nullable_to_non_nullable
as DateTime,searchKeywords: null == searchKeywords ? _self.searchKeywords : searchKeywords // ignore: cast_nullable_to_non_nullable
as List<String>,hasRead: freezed == hasRead ? _self.hasRead : hasRead // ignore: cast_nullable_to_non_nullable
as dynamic,participantsInfo: null == participantsInfo ? _self.participantsInfo : participantsInfo // ignore: cast_nullable_to_non_nullable
as List<ParticipantsInfo>,config: null == config ? _self.config : config // ignore: cast_nullable_to_non_nullable
as ChatConfigDto,participants: null == participants ? _self.participants : participants // ignore: cast_nullable_to_non_nullable
as List<String>,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}
/// Create a copy of ChatDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ChatConfigDtoCopyWith<$Res> get config {
  
  return $ChatConfigDtoCopyWith<$Res>(_self.config, (value) {
    return _then(_self.copyWith(config: value));
  });
}
}


/// Adds pattern-matching-related methods to [ChatDto].
extension ChatDtoPatterns on ChatDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ChatDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ChatDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ChatDto value)  $default,){
final _that = this;
switch (_that) {
case _ChatDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ChatDto value)?  $default,){
final _that = this;
switch (_that) {
case _ChatDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String chatId,  String lastMessage,  List<String> typingUsers, @TimestampConverter()  DateTime lastMessageSent,  List<String> searchKeywords,  dynamic hasRead,  List<ParticipantsInfo> participantsInfo,  ChatConfigDto config,  List<String> participants, @TimestampConverter()  DateTime createdAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ChatDto() when $default != null:
return $default(_that.chatId,_that.lastMessage,_that.typingUsers,_that.lastMessageSent,_that.searchKeywords,_that.hasRead,_that.participantsInfo,_that.config,_that.participants,_that.createdAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String chatId,  String lastMessage,  List<String> typingUsers, @TimestampConverter()  DateTime lastMessageSent,  List<String> searchKeywords,  dynamic hasRead,  List<ParticipantsInfo> participantsInfo,  ChatConfigDto config,  List<String> participants, @TimestampConverter()  DateTime createdAt)  $default,) {final _that = this;
switch (_that) {
case _ChatDto():
return $default(_that.chatId,_that.lastMessage,_that.typingUsers,_that.lastMessageSent,_that.searchKeywords,_that.hasRead,_that.participantsInfo,_that.config,_that.participants,_that.createdAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String chatId,  String lastMessage,  List<String> typingUsers, @TimestampConverter()  DateTime lastMessageSent,  List<String> searchKeywords,  dynamic hasRead,  List<ParticipantsInfo> participantsInfo,  ChatConfigDto config,  List<String> participants, @TimestampConverter()  DateTime createdAt)?  $default,) {final _that = this;
switch (_that) {
case _ChatDto() when $default != null:
return $default(_that.chatId,_that.lastMessage,_that.typingUsers,_that.lastMessageSent,_that.searchKeywords,_that.hasRead,_that.participantsInfo,_that.config,_that.participants,_that.createdAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ChatDto extends ChatDto {
  const _ChatDto({this.chatId = '', this.lastMessage = '', final  List<String> typingUsers = const [], @TimestampConverter() required this.lastMessageSent, final  List<String> searchKeywords = const [], this.hasRead = false, final  List<ParticipantsInfo> participantsInfo = const [], this.config = const ChatConfigDto(), required final  List<String> participants, @TimestampConverter() required this.createdAt}): _typingUsers = typingUsers,_searchKeywords = searchKeywords,_participantsInfo = participantsInfo,_participants = participants,super._();
  factory _ChatDto.fromJson(Map<String, dynamic> json) => _$ChatDtoFromJson(json);

@override@JsonKey() final  String chatId;
@override@JsonKey() final  String lastMessage;
 final  List<String> _typingUsers;
@override@JsonKey() List<String> get typingUsers {
  if (_typingUsers is EqualUnmodifiableListView) return _typingUsers;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_typingUsers);
}

@override@TimestampConverter() final  DateTime lastMessageSent;
 final  List<String> _searchKeywords;
@override@JsonKey() List<String> get searchKeywords {
  if (_searchKeywords is EqualUnmodifiableListView) return _searchKeywords;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_searchKeywords);
}

@override@JsonKey() final  dynamic hasRead;
 final  List<ParticipantsInfo> _participantsInfo;
@override@JsonKey() List<ParticipantsInfo> get participantsInfo {
  if (_participantsInfo is EqualUnmodifiableListView) return _participantsInfo;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_participantsInfo);
}

@override@JsonKey() final  ChatConfigDto config;
/// who access this chat
 final  List<String> _participants;
/// who access this chat
@override List<String> get participants {
  if (_participants is EqualUnmodifiableListView) return _participants;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_participants);
}

@override@TimestampConverter() final  DateTime createdAt;

/// Create a copy of ChatDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ChatDtoCopyWith<_ChatDto> get copyWith => __$ChatDtoCopyWithImpl<_ChatDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ChatDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ChatDto&&(identical(other.chatId, chatId) || other.chatId == chatId)&&(identical(other.lastMessage, lastMessage) || other.lastMessage == lastMessage)&&const DeepCollectionEquality().equals(other._typingUsers, _typingUsers)&&(identical(other.lastMessageSent, lastMessageSent) || other.lastMessageSent == lastMessageSent)&&const DeepCollectionEquality().equals(other._searchKeywords, _searchKeywords)&&const DeepCollectionEquality().equals(other.hasRead, hasRead)&&const DeepCollectionEquality().equals(other._participantsInfo, _participantsInfo)&&(identical(other.config, config) || other.config == config)&&const DeepCollectionEquality().equals(other._participants, _participants)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,chatId,lastMessage,const DeepCollectionEquality().hash(_typingUsers),lastMessageSent,const DeepCollectionEquality().hash(_searchKeywords),const DeepCollectionEquality().hash(hasRead),const DeepCollectionEquality().hash(_participantsInfo),config,const DeepCollectionEquality().hash(_participants),createdAt);

@override
String toString() {
  return 'ChatDto(chatId: $chatId, lastMessage: $lastMessage, typingUsers: $typingUsers, lastMessageSent: $lastMessageSent, searchKeywords: $searchKeywords, hasRead: $hasRead, participantsInfo: $participantsInfo, config: $config, participants: $participants, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class _$ChatDtoCopyWith<$Res> implements $ChatDtoCopyWith<$Res> {
  factory _$ChatDtoCopyWith(_ChatDto value, $Res Function(_ChatDto) _then) = __$ChatDtoCopyWithImpl;
@override @useResult
$Res call({
 String chatId, String lastMessage, List<String> typingUsers,@TimestampConverter() DateTime lastMessageSent, List<String> searchKeywords, dynamic hasRead, List<ParticipantsInfo> participantsInfo, ChatConfigDto config, List<String> participants,@TimestampConverter() DateTime createdAt
});


@override $ChatConfigDtoCopyWith<$Res> get config;

}
/// @nodoc
class __$ChatDtoCopyWithImpl<$Res>
    implements _$ChatDtoCopyWith<$Res> {
  __$ChatDtoCopyWithImpl(this._self, this._then);

  final _ChatDto _self;
  final $Res Function(_ChatDto) _then;

/// Create a copy of ChatDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? chatId = null,Object? lastMessage = null,Object? typingUsers = null,Object? lastMessageSent = null,Object? searchKeywords = null,Object? hasRead = freezed,Object? participantsInfo = null,Object? config = null,Object? participants = null,Object? createdAt = null,}) {
  return _then(_ChatDto(
chatId: null == chatId ? _self.chatId : chatId // ignore: cast_nullable_to_non_nullable
as String,lastMessage: null == lastMessage ? _self.lastMessage : lastMessage // ignore: cast_nullable_to_non_nullable
as String,typingUsers: null == typingUsers ? _self._typingUsers : typingUsers // ignore: cast_nullable_to_non_nullable
as List<String>,lastMessageSent: null == lastMessageSent ? _self.lastMessageSent : lastMessageSent // ignore: cast_nullable_to_non_nullable
as DateTime,searchKeywords: null == searchKeywords ? _self._searchKeywords : searchKeywords // ignore: cast_nullable_to_non_nullable
as List<String>,hasRead: freezed == hasRead ? _self.hasRead : hasRead // ignore: cast_nullable_to_non_nullable
as dynamic,participantsInfo: null == participantsInfo ? _self._participantsInfo : participantsInfo // ignore: cast_nullable_to_non_nullable
as List<ParticipantsInfo>,config: null == config ? _self.config : config // ignore: cast_nullable_to_non_nullable
as ChatConfigDto,participants: null == participants ? _self._participants : participants // ignore: cast_nullable_to_non_nullable
as List<String>,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

/// Create a copy of ChatDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ChatConfigDtoCopyWith<$Res> get config {
  
  return $ChatConfigDtoCopyWith<$Res>(_self.config, (value) {
    return _then(_self.copyWith(config: value));
  });
}
}

// dart format on
