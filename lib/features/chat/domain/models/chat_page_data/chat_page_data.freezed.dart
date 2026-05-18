// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chat_page_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ChatPageData {

 Chat get chat; List<UserData> get users; UserData get currentUser; String get peerUid;
/// Create a copy of ChatPageData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ChatPageDataCopyWith<ChatPageData> get copyWith => _$ChatPageDataCopyWithImpl<ChatPageData>(this as ChatPageData, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChatPageData&&(identical(other.chat, chat) || other.chat == chat)&&const DeepCollectionEquality().equals(other.users, users)&&(identical(other.currentUser, currentUser) || other.currentUser == currentUser)&&(identical(other.peerUid, peerUid) || other.peerUid == peerUid));
}


@override
int get hashCode => Object.hash(runtimeType,chat,const DeepCollectionEquality().hash(users),currentUser,peerUid);

@override
String toString() {
  return 'ChatPageData(chat: $chat, users: $users, currentUser: $currentUser, peerUid: $peerUid)';
}


}

/// @nodoc
abstract mixin class $ChatPageDataCopyWith<$Res>  {
  factory $ChatPageDataCopyWith(ChatPageData value, $Res Function(ChatPageData) _then) = _$ChatPageDataCopyWithImpl;
@useResult
$Res call({
 Chat chat, List<UserData> users, UserData currentUser, String peerUid
});


$ChatCopyWith<$Res> get chat;$UserDataCopyWith<$Res> get currentUser;

}
/// @nodoc
class _$ChatPageDataCopyWithImpl<$Res>
    implements $ChatPageDataCopyWith<$Res> {
  _$ChatPageDataCopyWithImpl(this._self, this._then);

  final ChatPageData _self;
  final $Res Function(ChatPageData) _then;

/// Create a copy of ChatPageData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? chat = null,Object? users = null,Object? currentUser = null,Object? peerUid = null,}) {
  return _then(_self.copyWith(
chat: null == chat ? _self.chat : chat // ignore: cast_nullable_to_non_nullable
as Chat,users: null == users ? _self.users : users // ignore: cast_nullable_to_non_nullable
as List<UserData>,currentUser: null == currentUser ? _self.currentUser : currentUser // ignore: cast_nullable_to_non_nullable
as UserData,peerUid: null == peerUid ? _self.peerUid : peerUid // ignore: cast_nullable_to_non_nullable
as String,
  ));
}
/// Create a copy of ChatPageData
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ChatCopyWith<$Res> get chat {
  
  return $ChatCopyWith<$Res>(_self.chat, (value) {
    return _then(_self.copyWith(chat: value));
  });
}/// Create a copy of ChatPageData
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserDataCopyWith<$Res> get currentUser {
  
  return $UserDataCopyWith<$Res>(_self.currentUser, (value) {
    return _then(_self.copyWith(currentUser: value));
  });
}
}


/// Adds pattern-matching-related methods to [ChatPageData].
extension ChatPageDataPatterns on ChatPageData {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ChatPageData value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ChatPageData() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ChatPageData value)  $default,){
final _that = this;
switch (_that) {
case _ChatPageData():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ChatPageData value)?  $default,){
final _that = this;
switch (_that) {
case _ChatPageData() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( Chat chat,  List<UserData> users,  UserData currentUser,  String peerUid)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ChatPageData() when $default != null:
return $default(_that.chat,_that.users,_that.currentUser,_that.peerUid);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( Chat chat,  List<UserData> users,  UserData currentUser,  String peerUid)  $default,) {final _that = this;
switch (_that) {
case _ChatPageData():
return $default(_that.chat,_that.users,_that.currentUser,_that.peerUid);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( Chat chat,  List<UserData> users,  UserData currentUser,  String peerUid)?  $default,) {final _that = this;
switch (_that) {
case _ChatPageData() when $default != null:
return $default(_that.chat,_that.users,_that.currentUser,_that.peerUid);case _:
  return null;

}
}

}

/// @nodoc


class _ChatPageData implements ChatPageData {
  const _ChatPageData({required this.chat, required final  List<UserData> users, required this.currentUser, required this.peerUid}): _users = users;
  

@override final  Chat chat;
 final  List<UserData> _users;
@override List<UserData> get users {
  if (_users is EqualUnmodifiableListView) return _users;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_users);
}

@override final  UserData currentUser;
@override final  String peerUid;

/// Create a copy of ChatPageData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ChatPageDataCopyWith<_ChatPageData> get copyWith => __$ChatPageDataCopyWithImpl<_ChatPageData>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ChatPageData&&(identical(other.chat, chat) || other.chat == chat)&&const DeepCollectionEquality().equals(other._users, _users)&&(identical(other.currentUser, currentUser) || other.currentUser == currentUser)&&(identical(other.peerUid, peerUid) || other.peerUid == peerUid));
}


@override
int get hashCode => Object.hash(runtimeType,chat,const DeepCollectionEquality().hash(_users),currentUser,peerUid);

@override
String toString() {
  return 'ChatPageData(chat: $chat, users: $users, currentUser: $currentUser, peerUid: $peerUid)';
}


}

/// @nodoc
abstract mixin class _$ChatPageDataCopyWith<$Res> implements $ChatPageDataCopyWith<$Res> {
  factory _$ChatPageDataCopyWith(_ChatPageData value, $Res Function(_ChatPageData) _then) = __$ChatPageDataCopyWithImpl;
@override @useResult
$Res call({
 Chat chat, List<UserData> users, UserData currentUser, String peerUid
});


@override $ChatCopyWith<$Res> get chat;@override $UserDataCopyWith<$Res> get currentUser;

}
/// @nodoc
class __$ChatPageDataCopyWithImpl<$Res>
    implements _$ChatPageDataCopyWith<$Res> {
  __$ChatPageDataCopyWithImpl(this._self, this._then);

  final _ChatPageData _self;
  final $Res Function(_ChatPageData) _then;

/// Create a copy of ChatPageData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? chat = null,Object? users = null,Object? currentUser = null,Object? peerUid = null,}) {
  return _then(_ChatPageData(
chat: null == chat ? _self.chat : chat // ignore: cast_nullable_to_non_nullable
as Chat,users: null == users ? _self._users : users // ignore: cast_nullable_to_non_nullable
as List<UserData>,currentUser: null == currentUser ? _self.currentUser : currentUser // ignore: cast_nullable_to_non_nullable
as UserData,peerUid: null == peerUid ? _self.peerUid : peerUid // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

/// Create a copy of ChatPageData
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ChatCopyWith<$Res> get chat {
  
  return $ChatCopyWith<$Res>(_self.chat, (value) {
    return _then(_self.copyWith(chat: value));
  });
}/// Create a copy of ChatPageData
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserDataCopyWith<$Res> get currentUser {
  
  return $UserDataCopyWith<$Res>(_self.currentUser, (value) {
    return _then(_self.copyWith(currentUser: value));
  });
}
}

// dart format on
