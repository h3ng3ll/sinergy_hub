// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'notification_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
NotificationData _$NotificationDataFromJson(
  Map<String, dynamic> json
) {
        switch (json['type']) {
                  case 'match':
          return MatchNotificationData.fromJson(
            json
          );
                case 'chat':
          return ChatNotificationData.fromJson(
            json
          );
        
          default:
            throw CheckedFromJsonException(
  json,
  'type',
  'NotificationData',
  'Invalid union type "${json['type']}"!'
);
        }
      
}

/// @nodoc
mixin _$NotificationData {



  /// Serializes this NotificationData to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NotificationData);
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'NotificationData()';
}


}

/// @nodoc
class $NotificationDataCopyWith<$Res>  {
$NotificationDataCopyWith(NotificationData _, $Res Function(NotificationData) __);
}


/// Adds pattern-matching-related methods to [NotificationData].
extension NotificationDataPatterns on NotificationData {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( MatchNotificationData value)?  match,TResult Function( ChatNotificationData value)?  chat,required TResult orElse(),}){
final _that = this;
switch (_that) {
case MatchNotificationData() when match != null:
return match(_that);case ChatNotificationData() when chat != null:
return chat(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( MatchNotificationData value)  match,required TResult Function( ChatNotificationData value)  chat,}){
final _that = this;
switch (_that) {
case MatchNotificationData():
return match(_that);case ChatNotificationData():
return chat(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( MatchNotificationData value)?  match,TResult? Function( ChatNotificationData value)?  chat,}){
final _that = this;
switch (_that) {
case MatchNotificationData() when match != null:
return match(_that);case ChatNotificationData() when chat != null:
return chat(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String matchId)?  match,TResult Function( String chatId,  String sentUid,  String? senderAvatar)?  chat,required TResult orElse(),}) {final _that = this;
switch (_that) {
case MatchNotificationData() when match != null:
return match(_that.matchId);case ChatNotificationData() when chat != null:
return chat(_that.chatId,_that.sentUid,_that.senderAvatar);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String matchId)  match,required TResult Function( String chatId,  String sentUid,  String? senderAvatar)  chat,}) {final _that = this;
switch (_that) {
case MatchNotificationData():
return match(_that.matchId);case ChatNotificationData():
return chat(_that.chatId,_that.sentUid,_that.senderAvatar);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String matchId)?  match,TResult? Function( String chatId,  String sentUid,  String? senderAvatar)?  chat,}) {final _that = this;
switch (_that) {
case MatchNotificationData() when match != null:
return match(_that.matchId);case ChatNotificationData() when chat != null:
return chat(_that.chatId,_that.sentUid,_that.senderAvatar);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class MatchNotificationData implements NotificationData {
  const MatchNotificationData({required this.matchId, final  String? $type}): $type = $type ?? 'match';
  factory MatchNotificationData.fromJson(Map<String, dynamic> json) => _$MatchNotificationDataFromJson(json);

 final  String matchId;

@JsonKey(name: 'type')
final String $type;


/// Create a copy of NotificationData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MatchNotificationDataCopyWith<MatchNotificationData> get copyWith => _$MatchNotificationDataCopyWithImpl<MatchNotificationData>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MatchNotificationDataToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MatchNotificationData&&(identical(other.matchId, matchId) || other.matchId == matchId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,matchId);

@override
String toString() {
  return 'NotificationData.match(matchId: $matchId)';
}


}

/// @nodoc
abstract mixin class $MatchNotificationDataCopyWith<$Res> implements $NotificationDataCopyWith<$Res> {
  factory $MatchNotificationDataCopyWith(MatchNotificationData value, $Res Function(MatchNotificationData) _then) = _$MatchNotificationDataCopyWithImpl;
@useResult
$Res call({
 String matchId
});




}
/// @nodoc
class _$MatchNotificationDataCopyWithImpl<$Res>
    implements $MatchNotificationDataCopyWith<$Res> {
  _$MatchNotificationDataCopyWithImpl(this._self, this._then);

  final MatchNotificationData _self;
  final $Res Function(MatchNotificationData) _then;

/// Create a copy of NotificationData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? matchId = null,}) {
  return _then(MatchNotificationData(
matchId: null == matchId ? _self.matchId : matchId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc
@JsonSerializable()

class ChatNotificationData implements NotificationData {
  const ChatNotificationData({required this.chatId, required this.sentUid, required this.senderAvatar, final  String? $type}): $type = $type ?? 'chat';
  factory ChatNotificationData.fromJson(Map<String, dynamic> json) => _$ChatNotificationDataFromJson(json);

 final  String chatId;
 final  String sentUid;
 final  String? senderAvatar;

@JsonKey(name: 'type')
final String $type;


/// Create a copy of NotificationData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ChatNotificationDataCopyWith<ChatNotificationData> get copyWith => _$ChatNotificationDataCopyWithImpl<ChatNotificationData>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ChatNotificationDataToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChatNotificationData&&(identical(other.chatId, chatId) || other.chatId == chatId)&&(identical(other.sentUid, sentUid) || other.sentUid == sentUid)&&(identical(other.senderAvatar, senderAvatar) || other.senderAvatar == senderAvatar));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,chatId,sentUid,senderAvatar);

@override
String toString() {
  return 'NotificationData.chat(chatId: $chatId, sentUid: $sentUid, senderAvatar: $senderAvatar)';
}


}

/// @nodoc
abstract mixin class $ChatNotificationDataCopyWith<$Res> implements $NotificationDataCopyWith<$Res> {
  factory $ChatNotificationDataCopyWith(ChatNotificationData value, $Res Function(ChatNotificationData) _then) = _$ChatNotificationDataCopyWithImpl;
@useResult
$Res call({
 String chatId, String sentUid, String? senderAvatar
});




}
/// @nodoc
class _$ChatNotificationDataCopyWithImpl<$Res>
    implements $ChatNotificationDataCopyWith<$Res> {
  _$ChatNotificationDataCopyWithImpl(this._self, this._then);

  final ChatNotificationData _self;
  final $Res Function(ChatNotificationData) _then;

/// Create a copy of NotificationData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? chatId = null,Object? sentUid = null,Object? senderAvatar = freezed,}) {
  return _then(ChatNotificationData(
chatId: null == chatId ? _self.chatId : chatId // ignore: cast_nullable_to_non_nullable
as String,sentUid: null == sentUid ? _self.sentUid : sentUid // ignore: cast_nullable_to_non_nullable
as String,senderAvatar: freezed == senderAvatar ? _self.senderAvatar : senderAvatar // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
