// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'liked_you_pg_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$LikedYouPgState {

 int get pageSize; bool get hasMore;/// Opaque backend cursor. Deviation from `UserDataPgState` /
/// `ChatPgState`'s `DocumentSnapshot? lastDocument`: this feed comes
/// from a callable, not a Firestore query the client runs itself, so
/// the cursor is whatever opaque string the server hands back.
 String? get cursor; List<LikedYouItem> get items; LikedYouQuota? get quota; int get totalCount;
/// Create a copy of LikedYouPgState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LikedYouPgStateCopyWith<LikedYouPgState> get copyWith => _$LikedYouPgStateCopyWithImpl<LikedYouPgState>(this as LikedYouPgState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LikedYouPgState&&(identical(other.pageSize, pageSize) || other.pageSize == pageSize)&&(identical(other.hasMore, hasMore) || other.hasMore == hasMore)&&(identical(other.cursor, cursor) || other.cursor == cursor)&&const DeepCollectionEquality().equals(other.items, items)&&(identical(other.quota, quota) || other.quota == quota)&&(identical(other.totalCount, totalCount) || other.totalCount == totalCount));
}


@override
int get hashCode => Object.hash(runtimeType,pageSize,hasMore,cursor,const DeepCollectionEquality().hash(items),quota,totalCount);

@override
String toString() {
  return 'LikedYouPgState(pageSize: $pageSize, hasMore: $hasMore, cursor: $cursor, items: $items, quota: $quota, totalCount: $totalCount)';
}


}

/// @nodoc
abstract mixin class $LikedYouPgStateCopyWith<$Res>  {
  factory $LikedYouPgStateCopyWith(LikedYouPgState value, $Res Function(LikedYouPgState) _then) = _$LikedYouPgStateCopyWithImpl;
@useResult
$Res call({
 int pageSize, bool hasMore, String? cursor, List<LikedYouItem> items, LikedYouQuota? quota, int totalCount
});


$LikedYouQuotaCopyWith<$Res>? get quota;

}
/// @nodoc
class _$LikedYouPgStateCopyWithImpl<$Res>
    implements $LikedYouPgStateCopyWith<$Res> {
  _$LikedYouPgStateCopyWithImpl(this._self, this._then);

  final LikedYouPgState _self;
  final $Res Function(LikedYouPgState) _then;

/// Create a copy of LikedYouPgState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? pageSize = null,Object? hasMore = null,Object? cursor = freezed,Object? items = null,Object? quota = freezed,Object? totalCount = null,}) {
  return _then(_self.copyWith(
pageSize: null == pageSize ? _self.pageSize : pageSize // ignore: cast_nullable_to_non_nullable
as int,hasMore: null == hasMore ? _self.hasMore : hasMore // ignore: cast_nullable_to_non_nullable
as bool,cursor: freezed == cursor ? _self.cursor : cursor // ignore: cast_nullable_to_non_nullable
as String?,items: null == items ? _self.items : items // ignore: cast_nullable_to_non_nullable
as List<LikedYouItem>,quota: freezed == quota ? _self.quota : quota // ignore: cast_nullable_to_non_nullable
as LikedYouQuota?,totalCount: null == totalCount ? _self.totalCount : totalCount // ignore: cast_nullable_to_non_nullable
as int,
  ));
}
/// Create a copy of LikedYouPgState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LikedYouQuotaCopyWith<$Res>? get quota {
    if (_self.quota == null) {
    return null;
  }

  return $LikedYouQuotaCopyWith<$Res>(_self.quota!, (value) {
    return _then(_self.copyWith(quota: value));
  });
}
}


/// Adds pattern-matching-related methods to [LikedYouPgState].
extension LikedYouPgStatePatterns on LikedYouPgState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _LikedYouPgState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LikedYouPgState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _LikedYouPgState value)  $default,){
final _that = this;
switch (_that) {
case _LikedYouPgState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _LikedYouPgState value)?  $default,){
final _that = this;
switch (_that) {
case _LikedYouPgState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int pageSize,  bool hasMore,  String? cursor,  List<LikedYouItem> items,  LikedYouQuota? quota,  int totalCount)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LikedYouPgState() when $default != null:
return $default(_that.pageSize,_that.hasMore,_that.cursor,_that.items,_that.quota,_that.totalCount);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int pageSize,  bool hasMore,  String? cursor,  List<LikedYouItem> items,  LikedYouQuota? quota,  int totalCount)  $default,) {final _that = this;
switch (_that) {
case _LikedYouPgState():
return $default(_that.pageSize,_that.hasMore,_that.cursor,_that.items,_that.quota,_that.totalCount);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int pageSize,  bool hasMore,  String? cursor,  List<LikedYouItem> items,  LikedYouQuota? quota,  int totalCount)?  $default,) {final _that = this;
switch (_that) {
case _LikedYouPgState() when $default != null:
return $default(_that.pageSize,_that.hasMore,_that.cursor,_that.items,_that.quota,_that.totalCount);case _:
  return null;

}
}

}

/// @nodoc


class _LikedYouPgState implements LikedYouPgState {
  const _LikedYouPgState({this.pageSize = 20, this.hasMore = true, this.cursor, final  List<LikedYouItem> items = const <LikedYouItem>[], this.quota, this.totalCount = 0}): _items = items;
  

@override@JsonKey() final  int pageSize;
@override@JsonKey() final  bool hasMore;
/// Opaque backend cursor. Deviation from `UserDataPgState` /
/// `ChatPgState`'s `DocumentSnapshot? lastDocument`: this feed comes
/// from a callable, not a Firestore query the client runs itself, so
/// the cursor is whatever opaque string the server hands back.
@override final  String? cursor;
 final  List<LikedYouItem> _items;
@override@JsonKey() List<LikedYouItem> get items {
  if (_items is EqualUnmodifiableListView) return _items;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_items);
}

@override final  LikedYouQuota? quota;
@override@JsonKey() final  int totalCount;

/// Create a copy of LikedYouPgState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LikedYouPgStateCopyWith<_LikedYouPgState> get copyWith => __$LikedYouPgStateCopyWithImpl<_LikedYouPgState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LikedYouPgState&&(identical(other.pageSize, pageSize) || other.pageSize == pageSize)&&(identical(other.hasMore, hasMore) || other.hasMore == hasMore)&&(identical(other.cursor, cursor) || other.cursor == cursor)&&const DeepCollectionEquality().equals(other._items, _items)&&(identical(other.quota, quota) || other.quota == quota)&&(identical(other.totalCount, totalCount) || other.totalCount == totalCount));
}


@override
int get hashCode => Object.hash(runtimeType,pageSize,hasMore,cursor,const DeepCollectionEquality().hash(_items),quota,totalCount);

@override
String toString() {
  return 'LikedYouPgState(pageSize: $pageSize, hasMore: $hasMore, cursor: $cursor, items: $items, quota: $quota, totalCount: $totalCount)';
}


}

/// @nodoc
abstract mixin class _$LikedYouPgStateCopyWith<$Res> implements $LikedYouPgStateCopyWith<$Res> {
  factory _$LikedYouPgStateCopyWith(_LikedYouPgState value, $Res Function(_LikedYouPgState) _then) = __$LikedYouPgStateCopyWithImpl;
@override @useResult
$Res call({
 int pageSize, bool hasMore, String? cursor, List<LikedYouItem> items, LikedYouQuota? quota, int totalCount
});


@override $LikedYouQuotaCopyWith<$Res>? get quota;

}
/// @nodoc
class __$LikedYouPgStateCopyWithImpl<$Res>
    implements _$LikedYouPgStateCopyWith<$Res> {
  __$LikedYouPgStateCopyWithImpl(this._self, this._then);

  final _LikedYouPgState _self;
  final $Res Function(_LikedYouPgState) _then;

/// Create a copy of LikedYouPgState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? pageSize = null,Object? hasMore = null,Object? cursor = freezed,Object? items = null,Object? quota = freezed,Object? totalCount = null,}) {
  return _then(_LikedYouPgState(
pageSize: null == pageSize ? _self.pageSize : pageSize // ignore: cast_nullable_to_non_nullable
as int,hasMore: null == hasMore ? _self.hasMore : hasMore // ignore: cast_nullable_to_non_nullable
as bool,cursor: freezed == cursor ? _self.cursor : cursor // ignore: cast_nullable_to_non_nullable
as String?,items: null == items ? _self._items : items // ignore: cast_nullable_to_non_nullable
as List<LikedYouItem>,quota: freezed == quota ? _self.quota : quota // ignore: cast_nullable_to_non_nullable
as LikedYouQuota?,totalCount: null == totalCount ? _self.totalCount : totalCount // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

/// Create a copy of LikedYouPgState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LikedYouQuotaCopyWith<$Res>? get quota {
    if (_self.quota == null) {
    return null;
  }

  return $LikedYouQuotaCopyWith<$Res>(_self.quota!, (value) {
    return _then(_self.copyWith(quota: value));
  });
}
}

// dart format on
