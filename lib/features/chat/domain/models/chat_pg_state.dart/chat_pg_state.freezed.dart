// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chat_pg_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ChatPgState {

 int get startIndex; int get pageSize; bool get hasMore;/// Firebase field
 DocumentSnapshot? get lastDocument; Set<String> get excludedUids; List<Chat> get chats;
/// Create a copy of ChatPgState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ChatPgStateCopyWith<ChatPgState> get copyWith => _$ChatPgStateCopyWithImpl<ChatPgState>(this as ChatPgState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChatPgState&&(identical(other.startIndex, startIndex) || other.startIndex == startIndex)&&(identical(other.pageSize, pageSize) || other.pageSize == pageSize)&&(identical(other.hasMore, hasMore) || other.hasMore == hasMore)&&(identical(other.lastDocument, lastDocument) || other.lastDocument == lastDocument)&&const DeepCollectionEquality().equals(other.excludedUids, excludedUids)&&const DeepCollectionEquality().equals(other.chats, chats));
}


@override
int get hashCode => Object.hash(runtimeType,startIndex,pageSize,hasMore,lastDocument,const DeepCollectionEquality().hash(excludedUids),const DeepCollectionEquality().hash(chats));

@override
String toString() {
  return 'ChatPgState(startIndex: $startIndex, pageSize: $pageSize, hasMore: $hasMore, lastDocument: $lastDocument, excludedUids: $excludedUids, chats: $chats)';
}


}

/// @nodoc
abstract mixin class $ChatPgStateCopyWith<$Res>  {
  factory $ChatPgStateCopyWith(ChatPgState value, $Res Function(ChatPgState) _then) = _$ChatPgStateCopyWithImpl;
@useResult
$Res call({
 int startIndex, int pageSize, bool hasMore, DocumentSnapshot? lastDocument, Set<String> excludedUids, List<Chat> chats
});




}
/// @nodoc
class _$ChatPgStateCopyWithImpl<$Res>
    implements $ChatPgStateCopyWith<$Res> {
  _$ChatPgStateCopyWithImpl(this._self, this._then);

  final ChatPgState _self;
  final $Res Function(ChatPgState) _then;

/// Create a copy of ChatPgState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? startIndex = null,Object? pageSize = null,Object? hasMore = null,Object? lastDocument = freezed,Object? excludedUids = null,Object? chats = null,}) {
  return _then(_self.copyWith(
startIndex: null == startIndex ? _self.startIndex : startIndex // ignore: cast_nullable_to_non_nullable
as int,pageSize: null == pageSize ? _self.pageSize : pageSize // ignore: cast_nullable_to_non_nullable
as int,hasMore: null == hasMore ? _self.hasMore : hasMore // ignore: cast_nullable_to_non_nullable
as bool,lastDocument: freezed == lastDocument ? _self.lastDocument : lastDocument // ignore: cast_nullable_to_non_nullable
as DocumentSnapshot?,excludedUids: null == excludedUids ? _self.excludedUids : excludedUids // ignore: cast_nullable_to_non_nullable
as Set<String>,chats: null == chats ? _self.chats : chats // ignore: cast_nullable_to_non_nullable
as List<Chat>,
  ));
}

}


/// Adds pattern-matching-related methods to [ChatPgState].
extension ChatPgStatePatterns on ChatPgState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ChatPgState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ChatPgState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ChatPgState value)  $default,){
final _that = this;
switch (_that) {
case _ChatPgState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ChatPgState value)?  $default,){
final _that = this;
switch (_that) {
case _ChatPgState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int startIndex,  int pageSize,  bool hasMore,  DocumentSnapshot? lastDocument,  Set<String> excludedUids,  List<Chat> chats)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ChatPgState() when $default != null:
return $default(_that.startIndex,_that.pageSize,_that.hasMore,_that.lastDocument,_that.excludedUids,_that.chats);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int startIndex,  int pageSize,  bool hasMore,  DocumentSnapshot? lastDocument,  Set<String> excludedUids,  List<Chat> chats)  $default,) {final _that = this;
switch (_that) {
case _ChatPgState():
return $default(_that.startIndex,_that.pageSize,_that.hasMore,_that.lastDocument,_that.excludedUids,_that.chats);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int startIndex,  int pageSize,  bool hasMore,  DocumentSnapshot? lastDocument,  Set<String> excludedUids,  List<Chat> chats)?  $default,) {final _that = this;
switch (_that) {
case _ChatPgState() when $default != null:
return $default(_that.startIndex,_that.pageSize,_that.hasMore,_that.lastDocument,_that.excludedUids,_that.chats);case _:
  return null;

}
}

}

/// @nodoc


class _ChatPgState implements ChatPgState {
  const _ChatPgState({this.startIndex = 0, this.pageSize = 10, this.hasMore = true, this.lastDocument, final  Set<String> excludedUids = const {}, final  List<Chat> chats = const []}): _excludedUids = excludedUids,_chats = chats;
  

@override@JsonKey() final  int startIndex;
@override@JsonKey() final  int pageSize;
@override@JsonKey() final  bool hasMore;
/// Firebase field
@override final  DocumentSnapshot? lastDocument;
 final  Set<String> _excludedUids;
@override@JsonKey() Set<String> get excludedUids {
  if (_excludedUids is EqualUnmodifiableSetView) return _excludedUids;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableSetView(_excludedUids);
}

 final  List<Chat> _chats;
@override@JsonKey() List<Chat> get chats {
  if (_chats is EqualUnmodifiableListView) return _chats;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_chats);
}


/// Create a copy of ChatPgState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ChatPgStateCopyWith<_ChatPgState> get copyWith => __$ChatPgStateCopyWithImpl<_ChatPgState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ChatPgState&&(identical(other.startIndex, startIndex) || other.startIndex == startIndex)&&(identical(other.pageSize, pageSize) || other.pageSize == pageSize)&&(identical(other.hasMore, hasMore) || other.hasMore == hasMore)&&(identical(other.lastDocument, lastDocument) || other.lastDocument == lastDocument)&&const DeepCollectionEquality().equals(other._excludedUids, _excludedUids)&&const DeepCollectionEquality().equals(other._chats, _chats));
}


@override
int get hashCode => Object.hash(runtimeType,startIndex,pageSize,hasMore,lastDocument,const DeepCollectionEquality().hash(_excludedUids),const DeepCollectionEquality().hash(_chats));

@override
String toString() {
  return 'ChatPgState(startIndex: $startIndex, pageSize: $pageSize, hasMore: $hasMore, lastDocument: $lastDocument, excludedUids: $excludedUids, chats: $chats)';
}


}

/// @nodoc
abstract mixin class _$ChatPgStateCopyWith<$Res> implements $ChatPgStateCopyWith<$Res> {
  factory _$ChatPgStateCopyWith(_ChatPgState value, $Res Function(_ChatPgState) _then) = __$ChatPgStateCopyWithImpl;
@override @useResult
$Res call({
 int startIndex, int pageSize, bool hasMore, DocumentSnapshot? lastDocument, Set<String> excludedUids, List<Chat> chats
});




}
/// @nodoc
class __$ChatPgStateCopyWithImpl<$Res>
    implements _$ChatPgStateCopyWith<$Res> {
  __$ChatPgStateCopyWithImpl(this._self, this._then);

  final _ChatPgState _self;
  final $Res Function(_ChatPgState) _then;

/// Create a copy of ChatPgState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? startIndex = null,Object? pageSize = null,Object? hasMore = null,Object? lastDocument = freezed,Object? excludedUids = null,Object? chats = null,}) {
  return _then(_ChatPgState(
startIndex: null == startIndex ? _self.startIndex : startIndex // ignore: cast_nullable_to_non_nullable
as int,pageSize: null == pageSize ? _self.pageSize : pageSize // ignore: cast_nullable_to_non_nullable
as int,hasMore: null == hasMore ? _self.hasMore : hasMore // ignore: cast_nullable_to_non_nullable
as bool,lastDocument: freezed == lastDocument ? _self.lastDocument : lastDocument // ignore: cast_nullable_to_non_nullable
as DocumentSnapshot?,excludedUids: null == excludedUids ? _self._excludedUids : excludedUids // ignore: cast_nullable_to_non_nullable
as Set<String>,chats: null == chats ? _self._chats : chats // ignore: cast_nullable_to_non_nullable
as List<Chat>,
  ));
}


}

// dart format on
