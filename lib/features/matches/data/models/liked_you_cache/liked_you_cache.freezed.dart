// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'liked_you_cache.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$LikedYouCache {

 List<LikedYouItem> get items; String? get nextCursor; bool get hasMore; int get totalCount; LikedYouQuota? get quota;
/// Create a copy of LikedYouCache
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LikedYouCacheCopyWith<LikedYouCache> get copyWith => _$LikedYouCacheCopyWithImpl<LikedYouCache>(this as LikedYouCache, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LikedYouCache&&const DeepCollectionEquality().equals(other.items, items)&&(identical(other.nextCursor, nextCursor) || other.nextCursor == nextCursor)&&(identical(other.hasMore, hasMore) || other.hasMore == hasMore)&&(identical(other.totalCount, totalCount) || other.totalCount == totalCount)&&(identical(other.quota, quota) || other.quota == quota));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(items),nextCursor,hasMore,totalCount,quota);

@override
String toString() {
  return 'LikedYouCache(items: $items, nextCursor: $nextCursor, hasMore: $hasMore, totalCount: $totalCount, quota: $quota)';
}


}

/// @nodoc
abstract mixin class $LikedYouCacheCopyWith<$Res>  {
  factory $LikedYouCacheCopyWith(LikedYouCache value, $Res Function(LikedYouCache) _then) = _$LikedYouCacheCopyWithImpl;
@useResult
$Res call({
 List<LikedYouItem> items, String? nextCursor, bool hasMore, int totalCount, LikedYouQuota? quota
});


$LikedYouQuotaCopyWith<$Res>? get quota;

}
/// @nodoc
class _$LikedYouCacheCopyWithImpl<$Res>
    implements $LikedYouCacheCopyWith<$Res> {
  _$LikedYouCacheCopyWithImpl(this._self, this._then);

  final LikedYouCache _self;
  final $Res Function(LikedYouCache) _then;

/// Create a copy of LikedYouCache
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? items = null,Object? nextCursor = freezed,Object? hasMore = null,Object? totalCount = null,Object? quota = freezed,}) {
  return _then(_self.copyWith(
items: null == items ? _self.items : items // ignore: cast_nullable_to_non_nullable
as List<LikedYouItem>,nextCursor: freezed == nextCursor ? _self.nextCursor : nextCursor // ignore: cast_nullable_to_non_nullable
as String?,hasMore: null == hasMore ? _self.hasMore : hasMore // ignore: cast_nullable_to_non_nullable
as bool,totalCount: null == totalCount ? _self.totalCount : totalCount // ignore: cast_nullable_to_non_nullable
as int,quota: freezed == quota ? _self.quota : quota // ignore: cast_nullable_to_non_nullable
as LikedYouQuota?,
  ));
}
/// Create a copy of LikedYouCache
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


/// Adds pattern-matching-related methods to [LikedYouCache].
extension LikedYouCachePatterns on LikedYouCache {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _LikedYouCache value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LikedYouCache() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _LikedYouCache value)  $default,){
final _that = this;
switch (_that) {
case _LikedYouCache():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _LikedYouCache value)?  $default,){
final _that = this;
switch (_that) {
case _LikedYouCache() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<LikedYouItem> items,  String? nextCursor,  bool hasMore,  int totalCount,  LikedYouQuota? quota)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LikedYouCache() when $default != null:
return $default(_that.items,_that.nextCursor,_that.hasMore,_that.totalCount,_that.quota);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<LikedYouItem> items,  String? nextCursor,  bool hasMore,  int totalCount,  LikedYouQuota? quota)  $default,) {final _that = this;
switch (_that) {
case _LikedYouCache():
return $default(_that.items,_that.nextCursor,_that.hasMore,_that.totalCount,_that.quota);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<LikedYouItem> items,  String? nextCursor,  bool hasMore,  int totalCount,  LikedYouQuota? quota)?  $default,) {final _that = this;
switch (_that) {
case _LikedYouCache() when $default != null:
return $default(_that.items,_that.nextCursor,_that.hasMore,_that.totalCount,_that.quota);case _:
  return null;

}
}

}

/// @nodoc


class _LikedYouCache extends LikedYouCache {
  const _LikedYouCache({final  List<LikedYouItem> items = const <LikedYouItem>[], this.nextCursor, this.hasMore = true, this.totalCount = 0, this.quota}): _items = items,super._();
  

 final  List<LikedYouItem> _items;
@override@JsonKey() List<LikedYouItem> get items {
  if (_items is EqualUnmodifiableListView) return _items;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_items);
}

@override final  String? nextCursor;
@override@JsonKey() final  bool hasMore;
@override@JsonKey() final  int totalCount;
@override final  LikedYouQuota? quota;

/// Create a copy of LikedYouCache
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LikedYouCacheCopyWith<_LikedYouCache> get copyWith => __$LikedYouCacheCopyWithImpl<_LikedYouCache>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LikedYouCache&&const DeepCollectionEquality().equals(other._items, _items)&&(identical(other.nextCursor, nextCursor) || other.nextCursor == nextCursor)&&(identical(other.hasMore, hasMore) || other.hasMore == hasMore)&&(identical(other.totalCount, totalCount) || other.totalCount == totalCount)&&(identical(other.quota, quota) || other.quota == quota));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_items),nextCursor,hasMore,totalCount,quota);

@override
String toString() {
  return 'LikedYouCache(items: $items, nextCursor: $nextCursor, hasMore: $hasMore, totalCount: $totalCount, quota: $quota)';
}


}

/// @nodoc
abstract mixin class _$LikedYouCacheCopyWith<$Res> implements $LikedYouCacheCopyWith<$Res> {
  factory _$LikedYouCacheCopyWith(_LikedYouCache value, $Res Function(_LikedYouCache) _then) = __$LikedYouCacheCopyWithImpl;
@override @useResult
$Res call({
 List<LikedYouItem> items, String? nextCursor, bool hasMore, int totalCount, LikedYouQuota? quota
});


@override $LikedYouQuotaCopyWith<$Res>? get quota;

}
/// @nodoc
class __$LikedYouCacheCopyWithImpl<$Res>
    implements _$LikedYouCacheCopyWith<$Res> {
  __$LikedYouCacheCopyWithImpl(this._self, this._then);

  final _LikedYouCache _self;
  final $Res Function(_LikedYouCache) _then;

/// Create a copy of LikedYouCache
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? items = null,Object? nextCursor = freezed,Object? hasMore = null,Object? totalCount = null,Object? quota = freezed,}) {
  return _then(_LikedYouCache(
items: null == items ? _self._items : items // ignore: cast_nullable_to_non_nullable
as List<LikedYouItem>,nextCursor: freezed == nextCursor ? _self.nextCursor : nextCursor // ignore: cast_nullable_to_non_nullable
as String?,hasMore: null == hasMore ? _self.hasMore : hasMore // ignore: cast_nullable_to_non_nullable
as bool,totalCount: null == totalCount ? _self.totalCount : totalCount // ignore: cast_nullable_to_non_nullable
as int,quota: freezed == quota ? _self.quota : quota // ignore: cast_nullable_to_non_nullable
as LikedYouQuota?,
  ));
}

/// Create a copy of LikedYouCache
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
