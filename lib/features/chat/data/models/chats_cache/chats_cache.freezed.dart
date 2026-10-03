// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chats_cache.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ChatsCache {

 List<Chat> get chats;
/// Create a copy of ChatsCache
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ChatsCacheCopyWith<ChatsCache> get copyWith => _$ChatsCacheCopyWithImpl<ChatsCache>(this as ChatsCache, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChatsCache&&const DeepCollectionEquality().equals(other.chats, chats));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(chats));

@override
String toString() {
  return 'ChatsCache(chats: $chats)';
}


}

/// @nodoc
abstract mixin class $ChatsCacheCopyWith<$Res>  {
  factory $ChatsCacheCopyWith(ChatsCache value, $Res Function(ChatsCache) _then) = _$ChatsCacheCopyWithImpl;
@useResult
$Res call({
 List<Chat> chats
});




}
/// @nodoc
class _$ChatsCacheCopyWithImpl<$Res>
    implements $ChatsCacheCopyWith<$Res> {
  _$ChatsCacheCopyWithImpl(this._self, this._then);

  final ChatsCache _self;
  final $Res Function(ChatsCache) _then;

/// Create a copy of ChatsCache
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? chats = null,}) {
  return _then(_self.copyWith(
chats: null == chats ? _self.chats : chats // ignore: cast_nullable_to_non_nullable
as List<Chat>,
  ));
}

}


/// Adds pattern-matching-related methods to [ChatsCache].
extension ChatsCachePatterns on ChatsCache {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ChatsCache value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ChatsCache() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ChatsCache value)  $default,){
final _that = this;
switch (_that) {
case _ChatsCache():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ChatsCache value)?  $default,){
final _that = this;
switch (_that) {
case _ChatsCache() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<Chat> chats)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ChatsCache() when $default != null:
return $default(_that.chats);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<Chat> chats)  $default,) {final _that = this;
switch (_that) {
case _ChatsCache():
return $default(_that.chats);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<Chat> chats)?  $default,) {final _that = this;
switch (_that) {
case _ChatsCache() when $default != null:
return $default(_that.chats);case _:
  return null;

}
}

}

/// @nodoc


class _ChatsCache implements ChatsCache {
  const _ChatsCache({final  List<Chat> chats = const []}): _chats = chats;
  

 final  List<Chat> _chats;
@override@JsonKey() List<Chat> get chats {
  if (_chats is EqualUnmodifiableListView) return _chats;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_chats);
}


/// Create a copy of ChatsCache
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ChatsCacheCopyWith<_ChatsCache> get copyWith => __$ChatsCacheCopyWithImpl<_ChatsCache>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ChatsCache&&const DeepCollectionEquality().equals(other._chats, _chats));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_chats));

@override
String toString() {
  return 'ChatsCache(chats: $chats)';
}


}

/// @nodoc
abstract mixin class _$ChatsCacheCopyWith<$Res> implements $ChatsCacheCopyWith<$Res> {
  factory _$ChatsCacheCopyWith(_ChatsCache value, $Res Function(_ChatsCache) _then) = __$ChatsCacheCopyWithImpl;
@override @useResult
$Res call({
 List<Chat> chats
});




}
/// @nodoc
class __$ChatsCacheCopyWithImpl<$Res>
    implements _$ChatsCacheCopyWith<$Res> {
  __$ChatsCacheCopyWithImpl(this._self, this._then);

  final _ChatsCache _self;
  final $Res Function(_ChatsCache) _then;

/// Create a copy of ChatsCache
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? chats = null,}) {
  return _then(_ChatsCache(
chats: null == chats ? _self._chats : chats // ignore: cast_nullable_to_non_nullable
as List<Chat>,
  ));
}


}

// dart format on
