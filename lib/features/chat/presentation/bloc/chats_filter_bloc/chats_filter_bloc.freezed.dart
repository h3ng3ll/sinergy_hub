// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chats_filter_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ChatsFilterEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChatsFilterEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ChatsFilterEvent()';
}


}

/// @nodoc
class $ChatsFilterEventCopyWith<$Res>  {
$ChatsFilterEventCopyWith(ChatsFilterEvent _, $Res Function(ChatsFilterEvent) __);
}


/// Adds pattern-matching-related methods to [ChatsFilterEvent].
extension ChatsFilterEventPatterns on ChatsFilterEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _ApplyFilter value)?  applyFilter,TResult Function( _Search value)?  search,TResult Function( _ToggleArchived value)?  toggleArchived,TResult Function( _ToggleFavorite value)?  toggleFavorite,TResult Function( _Init value)?  init,TResult Function( _UpdateUserOnline value)?  updateUserOnline,TResult Function( _SyncPeerSubs value)?  syncPeerSubs,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ApplyFilter() when applyFilter != null:
return applyFilter(_that);case _Search() when search != null:
return search(_that);case _ToggleArchived() when toggleArchived != null:
return toggleArchived(_that);case _ToggleFavorite() when toggleFavorite != null:
return toggleFavorite(_that);case _Init() when init != null:
return init(_that);case _UpdateUserOnline() when updateUserOnline != null:
return updateUserOnline(_that);case _SyncPeerSubs() when syncPeerSubs != null:
return syncPeerSubs(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _ApplyFilter value)  applyFilter,required TResult Function( _Search value)  search,required TResult Function( _ToggleArchived value)  toggleArchived,required TResult Function( _ToggleFavorite value)  toggleFavorite,required TResult Function( _Init value)  init,required TResult Function( _UpdateUserOnline value)  updateUserOnline,required TResult Function( _SyncPeerSubs value)  syncPeerSubs,}){
final _that = this;
switch (_that) {
case _ApplyFilter():
return applyFilter(_that);case _Search():
return search(_that);case _ToggleArchived():
return toggleArchived(_that);case _ToggleFavorite():
return toggleFavorite(_that);case _Init():
return init(_that);case _UpdateUserOnline():
return updateUserOnline(_that);case _SyncPeerSubs():
return syncPeerSubs(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _ApplyFilter value)?  applyFilter,TResult? Function( _Search value)?  search,TResult? Function( _ToggleArchived value)?  toggleArchived,TResult? Function( _ToggleFavorite value)?  toggleFavorite,TResult? Function( _Init value)?  init,TResult? Function( _UpdateUserOnline value)?  updateUserOnline,TResult? Function( _SyncPeerSubs value)?  syncPeerSubs,}){
final _that = this;
switch (_that) {
case _ApplyFilter() when applyFilter != null:
return applyFilter(_that);case _Search() when search != null:
return search(_that);case _ToggleArchived() when toggleArchived != null:
return toggleArchived(_that);case _ToggleFavorite() when toggleFavorite != null:
return toggleFavorite(_that);case _Init() when init != null:
return init(_that);case _UpdateUserOnline() when updateUserOnline != null:
return updateUserOnline(_that);case _SyncPeerSubs() when syncPeerSubs != null:
return syncPeerSubs(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( EChatFilter filter)?  applyFilter,TResult Function( String query)?  search,TResult Function( Chat chat)?  toggleArchived,TResult Function( Chat chat)?  toggleFavorite,TResult Function()?  init,TResult Function( UserData user)?  updateUserOnline,TResult Function()?  syncPeerSubs,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ApplyFilter() when applyFilter != null:
return applyFilter(_that.filter);case _Search() when search != null:
return search(_that.query);case _ToggleArchived() when toggleArchived != null:
return toggleArchived(_that.chat);case _ToggleFavorite() when toggleFavorite != null:
return toggleFavorite(_that.chat);case _Init() when init != null:
return init();case _UpdateUserOnline() when updateUserOnline != null:
return updateUserOnline(_that.user);case _SyncPeerSubs() when syncPeerSubs != null:
return syncPeerSubs();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( EChatFilter filter)  applyFilter,required TResult Function( String query)  search,required TResult Function( Chat chat)  toggleArchived,required TResult Function( Chat chat)  toggleFavorite,required TResult Function()  init,required TResult Function( UserData user)  updateUserOnline,required TResult Function()  syncPeerSubs,}) {final _that = this;
switch (_that) {
case _ApplyFilter():
return applyFilter(_that.filter);case _Search():
return search(_that.query);case _ToggleArchived():
return toggleArchived(_that.chat);case _ToggleFavorite():
return toggleFavorite(_that.chat);case _Init():
return init();case _UpdateUserOnline():
return updateUserOnline(_that.user);case _SyncPeerSubs():
return syncPeerSubs();}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( EChatFilter filter)?  applyFilter,TResult? Function( String query)?  search,TResult? Function( Chat chat)?  toggleArchived,TResult? Function( Chat chat)?  toggleFavorite,TResult? Function()?  init,TResult? Function( UserData user)?  updateUserOnline,TResult? Function()?  syncPeerSubs,}) {final _that = this;
switch (_that) {
case _ApplyFilter() when applyFilter != null:
return applyFilter(_that.filter);case _Search() when search != null:
return search(_that.query);case _ToggleArchived() when toggleArchived != null:
return toggleArchived(_that.chat);case _ToggleFavorite() when toggleFavorite != null:
return toggleFavorite(_that.chat);case _Init() when init != null:
return init();case _UpdateUserOnline() when updateUserOnline != null:
return updateUserOnline(_that.user);case _SyncPeerSubs() when syncPeerSubs != null:
return syncPeerSubs();case _:
  return null;

}
}

}

/// @nodoc


class _ApplyFilter implements ChatsFilterEvent {
  const _ApplyFilter({required this.filter});
  

 final  EChatFilter filter;

/// Create a copy of ChatsFilterEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ApplyFilterCopyWith<_ApplyFilter> get copyWith => __$ApplyFilterCopyWithImpl<_ApplyFilter>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ApplyFilter&&(identical(other.filter, filter) || other.filter == filter));
}


@override
int get hashCode => Object.hash(runtimeType,filter);

@override
String toString() {
  return 'ChatsFilterEvent.applyFilter(filter: $filter)';
}


}

/// @nodoc
abstract mixin class _$ApplyFilterCopyWith<$Res> implements $ChatsFilterEventCopyWith<$Res> {
  factory _$ApplyFilterCopyWith(_ApplyFilter value, $Res Function(_ApplyFilter) _then) = __$ApplyFilterCopyWithImpl;
@useResult
$Res call({
 EChatFilter filter
});




}
/// @nodoc
class __$ApplyFilterCopyWithImpl<$Res>
    implements _$ApplyFilterCopyWith<$Res> {
  __$ApplyFilterCopyWithImpl(this._self, this._then);

  final _ApplyFilter _self;
  final $Res Function(_ApplyFilter) _then;

/// Create a copy of ChatsFilterEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? filter = null,}) {
  return _then(_ApplyFilter(
filter: null == filter ? _self.filter : filter // ignore: cast_nullable_to_non_nullable
as EChatFilter,
  ));
}


}

/// @nodoc


class _Search implements ChatsFilterEvent {
  const _Search({required this.query});
  

 final  String query;

/// Create a copy of ChatsFilterEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SearchCopyWith<_Search> get copyWith => __$SearchCopyWithImpl<_Search>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Search&&(identical(other.query, query) || other.query == query));
}


@override
int get hashCode => Object.hash(runtimeType,query);

@override
String toString() {
  return 'ChatsFilterEvent.search(query: $query)';
}


}

/// @nodoc
abstract mixin class _$SearchCopyWith<$Res> implements $ChatsFilterEventCopyWith<$Res> {
  factory _$SearchCopyWith(_Search value, $Res Function(_Search) _then) = __$SearchCopyWithImpl;
@useResult
$Res call({
 String query
});




}
/// @nodoc
class __$SearchCopyWithImpl<$Res>
    implements _$SearchCopyWith<$Res> {
  __$SearchCopyWithImpl(this._self, this._then);

  final _Search _self;
  final $Res Function(_Search) _then;

/// Create a copy of ChatsFilterEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? query = null,}) {
  return _then(_Search(
query: null == query ? _self.query : query // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _ToggleArchived implements ChatsFilterEvent {
  const _ToggleArchived({required this.chat});
  

 final  Chat chat;

/// Create a copy of ChatsFilterEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ToggleArchivedCopyWith<_ToggleArchived> get copyWith => __$ToggleArchivedCopyWithImpl<_ToggleArchived>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ToggleArchived&&(identical(other.chat, chat) || other.chat == chat));
}


@override
int get hashCode => Object.hash(runtimeType,chat);

@override
String toString() {
  return 'ChatsFilterEvent.toggleArchived(chat: $chat)';
}


}

/// @nodoc
abstract mixin class _$ToggleArchivedCopyWith<$Res> implements $ChatsFilterEventCopyWith<$Res> {
  factory _$ToggleArchivedCopyWith(_ToggleArchived value, $Res Function(_ToggleArchived) _then) = __$ToggleArchivedCopyWithImpl;
@useResult
$Res call({
 Chat chat
});


$ChatCopyWith<$Res> get chat;

}
/// @nodoc
class __$ToggleArchivedCopyWithImpl<$Res>
    implements _$ToggleArchivedCopyWith<$Res> {
  __$ToggleArchivedCopyWithImpl(this._self, this._then);

  final _ToggleArchived _self;
  final $Res Function(_ToggleArchived) _then;

/// Create a copy of ChatsFilterEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? chat = null,}) {
  return _then(_ToggleArchived(
chat: null == chat ? _self.chat : chat // ignore: cast_nullable_to_non_nullable
as Chat,
  ));
}

/// Create a copy of ChatsFilterEvent
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


class _ToggleFavorite implements ChatsFilterEvent {
  const _ToggleFavorite({required this.chat});
  

 final  Chat chat;

/// Create a copy of ChatsFilterEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ToggleFavoriteCopyWith<_ToggleFavorite> get copyWith => __$ToggleFavoriteCopyWithImpl<_ToggleFavorite>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ToggleFavorite&&(identical(other.chat, chat) || other.chat == chat));
}


@override
int get hashCode => Object.hash(runtimeType,chat);

@override
String toString() {
  return 'ChatsFilterEvent.toggleFavorite(chat: $chat)';
}


}

/// @nodoc
abstract mixin class _$ToggleFavoriteCopyWith<$Res> implements $ChatsFilterEventCopyWith<$Res> {
  factory _$ToggleFavoriteCopyWith(_ToggleFavorite value, $Res Function(_ToggleFavorite) _then) = __$ToggleFavoriteCopyWithImpl;
@useResult
$Res call({
 Chat chat
});


$ChatCopyWith<$Res> get chat;

}
/// @nodoc
class __$ToggleFavoriteCopyWithImpl<$Res>
    implements _$ToggleFavoriteCopyWith<$Res> {
  __$ToggleFavoriteCopyWithImpl(this._self, this._then);

  final _ToggleFavorite _self;
  final $Res Function(_ToggleFavorite) _then;

/// Create a copy of ChatsFilterEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? chat = null,}) {
  return _then(_ToggleFavorite(
chat: null == chat ? _self.chat : chat // ignore: cast_nullable_to_non_nullable
as Chat,
  ));
}

/// Create a copy of ChatsFilterEvent
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


class _Init implements ChatsFilterEvent {
  const _Init();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Init);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ChatsFilterEvent.init()';
}


}




/// @nodoc


class _UpdateUserOnline implements ChatsFilterEvent {
  const _UpdateUserOnline({required this.user});
  

 final  UserData user;

/// Create a copy of ChatsFilterEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UpdateUserOnlineCopyWith<_UpdateUserOnline> get copyWith => __$UpdateUserOnlineCopyWithImpl<_UpdateUserOnline>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UpdateUserOnline&&(identical(other.user, user) || other.user == user));
}


@override
int get hashCode => Object.hash(runtimeType,user);

@override
String toString() {
  return 'ChatsFilterEvent.updateUserOnline(user: $user)';
}


}

/// @nodoc
abstract mixin class _$UpdateUserOnlineCopyWith<$Res> implements $ChatsFilterEventCopyWith<$Res> {
  factory _$UpdateUserOnlineCopyWith(_UpdateUserOnline value, $Res Function(_UpdateUserOnline) _then) = __$UpdateUserOnlineCopyWithImpl;
@useResult
$Res call({
 UserData user
});


$UserDataCopyWith<$Res> get user;

}
/// @nodoc
class __$UpdateUserOnlineCopyWithImpl<$Res>
    implements _$UpdateUserOnlineCopyWith<$Res> {
  __$UpdateUserOnlineCopyWithImpl(this._self, this._then);

  final _UpdateUserOnline _self;
  final $Res Function(_UpdateUserOnline) _then;

/// Create a copy of ChatsFilterEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? user = null,}) {
  return _then(_UpdateUserOnline(
user: null == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as UserData,
  ));
}

/// Create a copy of ChatsFilterEvent
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


class _SyncPeerSubs implements ChatsFilterEvent {
  const _SyncPeerSubs();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SyncPeerSubs);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ChatsFilterEvent.syncPeerSubs()';
}


}




/// @nodoc
mixin _$ChatsFilterState {

 ChatsFilterStatus get status; ChatPgState get chatsState;/// Every cached chat of the user; [chatsState] is its filtered view.
 List<Chat> get allChats; Map<String, bool> get onlineStatuses; Map<String, StreamSubscription<UserData?>> get peerSubs; EChatFilter get filter; String get query; String get uid; dynamic get errorMessage;
/// Create a copy of ChatsFilterState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ChatsFilterStateCopyWith<ChatsFilterState> get copyWith => _$ChatsFilterStateCopyWithImpl<ChatsFilterState>(this as ChatsFilterState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChatsFilterState&&(identical(other.status, status) || other.status == status)&&(identical(other.chatsState, chatsState) || other.chatsState == chatsState)&&const DeepCollectionEquality().equals(other.allChats, allChats)&&const DeepCollectionEquality().equals(other.onlineStatuses, onlineStatuses)&&const DeepCollectionEquality().equals(other.peerSubs, peerSubs)&&(identical(other.filter, filter) || other.filter == filter)&&(identical(other.query, query) || other.query == query)&&(identical(other.uid, uid) || other.uid == uid)&&const DeepCollectionEquality().equals(other.errorMessage, errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,status,chatsState,const DeepCollectionEquality().hash(allChats),const DeepCollectionEquality().hash(onlineStatuses),const DeepCollectionEquality().hash(peerSubs),filter,query,uid,const DeepCollectionEquality().hash(errorMessage));

@override
String toString() {
  return 'ChatsFilterState(status: $status, chatsState: $chatsState, allChats: $allChats, onlineStatuses: $onlineStatuses, peerSubs: $peerSubs, filter: $filter, query: $query, uid: $uid, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class $ChatsFilterStateCopyWith<$Res>  {
  factory $ChatsFilterStateCopyWith(ChatsFilterState value, $Res Function(ChatsFilterState) _then) = _$ChatsFilterStateCopyWithImpl;
@useResult
$Res call({
 ChatsFilterStatus status, ChatPgState chatsState, List<Chat> allChats, Map<String, bool> onlineStatuses, Map<String, StreamSubscription<UserData?>> peerSubs, EChatFilter filter, String query, String uid, dynamic errorMessage
});


$ChatPgStateCopyWith<$Res> get chatsState;

}
/// @nodoc
class _$ChatsFilterStateCopyWithImpl<$Res>
    implements $ChatsFilterStateCopyWith<$Res> {
  _$ChatsFilterStateCopyWithImpl(this._self, this._then);

  final ChatsFilterState _self;
  final $Res Function(ChatsFilterState) _then;

/// Create a copy of ChatsFilterState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = null,Object? chatsState = null,Object? allChats = null,Object? onlineStatuses = null,Object? peerSubs = null,Object? filter = null,Object? query = null,Object? uid = null,Object? errorMessage = freezed,}) {
  return _then(_self.copyWith(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as ChatsFilterStatus,chatsState: null == chatsState ? _self.chatsState : chatsState // ignore: cast_nullable_to_non_nullable
as ChatPgState,allChats: null == allChats ? _self.allChats : allChats // ignore: cast_nullable_to_non_nullable
as List<Chat>,onlineStatuses: null == onlineStatuses ? _self.onlineStatuses : onlineStatuses // ignore: cast_nullable_to_non_nullable
as Map<String, bool>,peerSubs: null == peerSubs ? _self.peerSubs : peerSubs // ignore: cast_nullable_to_non_nullable
as Map<String, StreamSubscription<UserData?>>,filter: null == filter ? _self.filter : filter // ignore: cast_nullable_to_non_nullable
as EChatFilter,query: null == query ? _self.query : query // ignore: cast_nullable_to_non_nullable
as String,uid: null == uid ? _self.uid : uid // ignore: cast_nullable_to_non_nullable
as String,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as dynamic,
  ));
}
/// Create a copy of ChatsFilterState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ChatPgStateCopyWith<$Res> get chatsState {
  
  return $ChatPgStateCopyWith<$Res>(_self.chatsState, (value) {
    return _then(_self.copyWith(chatsState: value));
  });
}
}


/// Adds pattern-matching-related methods to [ChatsFilterState].
extension ChatsFilterStatePatterns on ChatsFilterState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ChatsFilterState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ChatsFilterState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ChatsFilterState value)  $default,){
final _that = this;
switch (_that) {
case _ChatsFilterState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ChatsFilterState value)?  $default,){
final _that = this;
switch (_that) {
case _ChatsFilterState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( ChatsFilterStatus status,  ChatPgState chatsState,  List<Chat> allChats,  Map<String, bool> onlineStatuses,  Map<String, StreamSubscription<UserData?>> peerSubs,  EChatFilter filter,  String query,  String uid,  dynamic errorMessage)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ChatsFilterState() when $default != null:
return $default(_that.status,_that.chatsState,_that.allChats,_that.onlineStatuses,_that.peerSubs,_that.filter,_that.query,_that.uid,_that.errorMessage);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( ChatsFilterStatus status,  ChatPgState chatsState,  List<Chat> allChats,  Map<String, bool> onlineStatuses,  Map<String, StreamSubscription<UserData?>> peerSubs,  EChatFilter filter,  String query,  String uid,  dynamic errorMessage)  $default,) {final _that = this;
switch (_that) {
case _ChatsFilterState():
return $default(_that.status,_that.chatsState,_that.allChats,_that.onlineStatuses,_that.peerSubs,_that.filter,_that.query,_that.uid,_that.errorMessage);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( ChatsFilterStatus status,  ChatPgState chatsState,  List<Chat> allChats,  Map<String, bool> onlineStatuses,  Map<String, StreamSubscription<UserData?>> peerSubs,  EChatFilter filter,  String query,  String uid,  dynamic errorMessage)?  $default,) {final _that = this;
switch (_that) {
case _ChatsFilterState() when $default != null:
return $default(_that.status,_that.chatsState,_that.allChats,_that.onlineStatuses,_that.peerSubs,_that.filter,_that.query,_that.uid,_that.errorMessage);case _:
  return null;

}
}

}

/// @nodoc


class _ChatsFilterState implements ChatsFilterState {
  const _ChatsFilterState({this.status = ChatsFilterStatus.loading, this.chatsState = const ChatPgState(), final  List<Chat> allChats = const [], final  Map<String, bool> onlineStatuses = const {}, final  Map<String, StreamSubscription<UserData?>> peerSubs = const <String, StreamSubscription<UserData?>>{}, this.filter = EChatFilter.all, this.query = '', this.uid = '', this.errorMessage = ''}): _allChats = allChats,_onlineStatuses = onlineStatuses,_peerSubs = peerSubs;
  

@override@JsonKey() final  ChatsFilterStatus status;
@override@JsonKey() final  ChatPgState chatsState;
/// Every cached chat of the user; [chatsState] is its filtered view.
 final  List<Chat> _allChats;
/// Every cached chat of the user; [chatsState] is its filtered view.
@override@JsonKey() List<Chat> get allChats {
  if (_allChats is EqualUnmodifiableListView) return _allChats;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_allChats);
}

 final  Map<String, bool> _onlineStatuses;
@override@JsonKey() Map<String, bool> get onlineStatuses {
  if (_onlineStatuses is EqualUnmodifiableMapView) return _onlineStatuses;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_onlineStatuses);
}

 final  Map<String, StreamSubscription<UserData?>> _peerSubs;
@override@JsonKey() Map<String, StreamSubscription<UserData?>> get peerSubs {
  if (_peerSubs is EqualUnmodifiableMapView) return _peerSubs;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_peerSubs);
}

@override@JsonKey() final  EChatFilter filter;
@override@JsonKey() final  String query;
@override@JsonKey() final  String uid;
@override@JsonKey() final  dynamic errorMessage;

/// Create a copy of ChatsFilterState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ChatsFilterStateCopyWith<_ChatsFilterState> get copyWith => __$ChatsFilterStateCopyWithImpl<_ChatsFilterState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ChatsFilterState&&(identical(other.status, status) || other.status == status)&&(identical(other.chatsState, chatsState) || other.chatsState == chatsState)&&const DeepCollectionEquality().equals(other._allChats, _allChats)&&const DeepCollectionEquality().equals(other._onlineStatuses, _onlineStatuses)&&const DeepCollectionEquality().equals(other._peerSubs, _peerSubs)&&(identical(other.filter, filter) || other.filter == filter)&&(identical(other.query, query) || other.query == query)&&(identical(other.uid, uid) || other.uid == uid)&&const DeepCollectionEquality().equals(other.errorMessage, errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,status,chatsState,const DeepCollectionEquality().hash(_allChats),const DeepCollectionEquality().hash(_onlineStatuses),const DeepCollectionEquality().hash(_peerSubs),filter,query,uid,const DeepCollectionEquality().hash(errorMessage));

@override
String toString() {
  return 'ChatsFilterState(status: $status, chatsState: $chatsState, allChats: $allChats, onlineStatuses: $onlineStatuses, peerSubs: $peerSubs, filter: $filter, query: $query, uid: $uid, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class _$ChatsFilterStateCopyWith<$Res> implements $ChatsFilterStateCopyWith<$Res> {
  factory _$ChatsFilterStateCopyWith(_ChatsFilterState value, $Res Function(_ChatsFilterState) _then) = __$ChatsFilterStateCopyWithImpl;
@override @useResult
$Res call({
 ChatsFilterStatus status, ChatPgState chatsState, List<Chat> allChats, Map<String, bool> onlineStatuses, Map<String, StreamSubscription<UserData?>> peerSubs, EChatFilter filter, String query, String uid, dynamic errorMessage
});


@override $ChatPgStateCopyWith<$Res> get chatsState;

}
/// @nodoc
class __$ChatsFilterStateCopyWithImpl<$Res>
    implements _$ChatsFilterStateCopyWith<$Res> {
  __$ChatsFilterStateCopyWithImpl(this._self, this._then);

  final _ChatsFilterState _self;
  final $Res Function(_ChatsFilterState) _then;

/// Create a copy of ChatsFilterState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = null,Object? chatsState = null,Object? allChats = null,Object? onlineStatuses = null,Object? peerSubs = null,Object? filter = null,Object? query = null,Object? uid = null,Object? errorMessage = freezed,}) {
  return _then(_ChatsFilterState(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as ChatsFilterStatus,chatsState: null == chatsState ? _self.chatsState : chatsState // ignore: cast_nullable_to_non_nullable
as ChatPgState,allChats: null == allChats ? _self._allChats : allChats // ignore: cast_nullable_to_non_nullable
as List<Chat>,onlineStatuses: null == onlineStatuses ? _self._onlineStatuses : onlineStatuses // ignore: cast_nullable_to_non_nullable
as Map<String, bool>,peerSubs: null == peerSubs ? _self._peerSubs : peerSubs // ignore: cast_nullable_to_non_nullable
as Map<String, StreamSubscription<UserData?>>,filter: null == filter ? _self.filter : filter // ignore: cast_nullable_to_non_nullable
as EChatFilter,query: null == query ? _self.query : query // ignore: cast_nullable_to_non_nullable
as String,uid: null == uid ? _self.uid : uid // ignore: cast_nullable_to_non_nullable
as String,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as dynamic,
  ));
}

/// Create a copy of ChatsFilterState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ChatPgStateCopyWith<$Res> get chatsState {
  
  return $ChatPgStateCopyWith<$Res>(_self.chatsState, (value) {
    return _then(_self.copyWith(chatsState: value));
  });
}
}

// dart format on
