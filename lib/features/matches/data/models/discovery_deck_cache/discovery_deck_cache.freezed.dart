// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'discovery_deck_cache.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$DiscoveryDeckCache {

 List<UserData> get items; bool get hasMore; String? get lastDocumentId; String? get cursor; Map<String, double> get distancesKm;
/// Create a copy of DiscoveryDeckCache
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DiscoveryDeckCacheCopyWith<DiscoveryDeckCache> get copyWith => _$DiscoveryDeckCacheCopyWithImpl<DiscoveryDeckCache>(this as DiscoveryDeckCache, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DiscoveryDeckCache&&const DeepCollectionEquality().equals(other.items, items)&&(identical(other.hasMore, hasMore) || other.hasMore == hasMore)&&(identical(other.lastDocumentId, lastDocumentId) || other.lastDocumentId == lastDocumentId)&&(identical(other.cursor, cursor) || other.cursor == cursor)&&const DeepCollectionEquality().equals(other.distancesKm, distancesKm));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(items),hasMore,lastDocumentId,cursor,const DeepCollectionEquality().hash(distancesKm));

@override
String toString() {
  return 'DiscoveryDeckCache(items: $items, hasMore: $hasMore, lastDocumentId: $lastDocumentId, cursor: $cursor, distancesKm: $distancesKm)';
}


}

/// @nodoc
abstract mixin class $DiscoveryDeckCacheCopyWith<$Res>  {
  factory $DiscoveryDeckCacheCopyWith(DiscoveryDeckCache value, $Res Function(DiscoveryDeckCache) _then) = _$DiscoveryDeckCacheCopyWithImpl;
@useResult
$Res call({
 List<UserData> items, bool hasMore, String? lastDocumentId, String? cursor, Map<String, double> distancesKm
});




}
/// @nodoc
class _$DiscoveryDeckCacheCopyWithImpl<$Res>
    implements $DiscoveryDeckCacheCopyWith<$Res> {
  _$DiscoveryDeckCacheCopyWithImpl(this._self, this._then);

  final DiscoveryDeckCache _self;
  final $Res Function(DiscoveryDeckCache) _then;

/// Create a copy of DiscoveryDeckCache
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? items = null,Object? hasMore = null,Object? lastDocumentId = freezed,Object? cursor = freezed,Object? distancesKm = null,}) {
  return _then(_self.copyWith(
items: null == items ? _self.items : items // ignore: cast_nullable_to_non_nullable
as List<UserData>,hasMore: null == hasMore ? _self.hasMore : hasMore // ignore: cast_nullable_to_non_nullable
as bool,lastDocumentId: freezed == lastDocumentId ? _self.lastDocumentId : lastDocumentId // ignore: cast_nullable_to_non_nullable
as String?,cursor: freezed == cursor ? _self.cursor : cursor // ignore: cast_nullable_to_non_nullable
as String?,distancesKm: null == distancesKm ? _self.distancesKm : distancesKm // ignore: cast_nullable_to_non_nullable
as Map<String, double>,
  ));
}

}


/// Adds pattern-matching-related methods to [DiscoveryDeckCache].
extension DiscoveryDeckCachePatterns on DiscoveryDeckCache {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DiscoveryDeckCache value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DiscoveryDeckCache() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DiscoveryDeckCache value)  $default,){
final _that = this;
switch (_that) {
case _DiscoveryDeckCache():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DiscoveryDeckCache value)?  $default,){
final _that = this;
switch (_that) {
case _DiscoveryDeckCache() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<UserData> items,  bool hasMore,  String? lastDocumentId,  String? cursor,  Map<String, double> distancesKm)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DiscoveryDeckCache() when $default != null:
return $default(_that.items,_that.hasMore,_that.lastDocumentId,_that.cursor,_that.distancesKm);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<UserData> items,  bool hasMore,  String? lastDocumentId,  String? cursor,  Map<String, double> distancesKm)  $default,) {final _that = this;
switch (_that) {
case _DiscoveryDeckCache():
return $default(_that.items,_that.hasMore,_that.lastDocumentId,_that.cursor,_that.distancesKm);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<UserData> items,  bool hasMore,  String? lastDocumentId,  String? cursor,  Map<String, double> distancesKm)?  $default,) {final _that = this;
switch (_that) {
case _DiscoveryDeckCache() when $default != null:
return $default(_that.items,_that.hasMore,_that.lastDocumentId,_that.cursor,_that.distancesKm);case _:
  return null;

}
}

}

/// @nodoc


class _DiscoveryDeckCache extends DiscoveryDeckCache {
  const _DiscoveryDeckCache({final  List<UserData> items = const <UserData>[], this.hasMore = true, this.lastDocumentId, this.cursor, final  Map<String, double> distancesKm = const <String, double>{}}): _items = items,_distancesKm = distancesKm,super._();
  

 final  List<UserData> _items;
@override@JsonKey() List<UserData> get items {
  if (_items is EqualUnmodifiableListView) return _items;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_items);
}

@override@JsonKey() final  bool hasMore;
@override final  String? lastDocumentId;
@override final  String? cursor;
 final  Map<String, double> _distancesKm;
@override@JsonKey() Map<String, double> get distancesKm {
  if (_distancesKm is EqualUnmodifiableMapView) return _distancesKm;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_distancesKm);
}


/// Create a copy of DiscoveryDeckCache
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DiscoveryDeckCacheCopyWith<_DiscoveryDeckCache> get copyWith => __$DiscoveryDeckCacheCopyWithImpl<_DiscoveryDeckCache>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DiscoveryDeckCache&&const DeepCollectionEquality().equals(other._items, _items)&&(identical(other.hasMore, hasMore) || other.hasMore == hasMore)&&(identical(other.lastDocumentId, lastDocumentId) || other.lastDocumentId == lastDocumentId)&&(identical(other.cursor, cursor) || other.cursor == cursor)&&const DeepCollectionEquality().equals(other._distancesKm, _distancesKm));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_items),hasMore,lastDocumentId,cursor,const DeepCollectionEquality().hash(_distancesKm));

@override
String toString() {
  return 'DiscoveryDeckCache(items: $items, hasMore: $hasMore, lastDocumentId: $lastDocumentId, cursor: $cursor, distancesKm: $distancesKm)';
}


}

/// @nodoc
abstract mixin class _$DiscoveryDeckCacheCopyWith<$Res> implements $DiscoveryDeckCacheCopyWith<$Res> {
  factory _$DiscoveryDeckCacheCopyWith(_DiscoveryDeckCache value, $Res Function(_DiscoveryDeckCache) _then) = __$DiscoveryDeckCacheCopyWithImpl;
@override @useResult
$Res call({
 List<UserData> items, bool hasMore, String? lastDocumentId, String? cursor, Map<String, double> distancesKm
});




}
/// @nodoc
class __$DiscoveryDeckCacheCopyWithImpl<$Res>
    implements _$DiscoveryDeckCacheCopyWith<$Res> {
  __$DiscoveryDeckCacheCopyWithImpl(this._self, this._then);

  final _DiscoveryDeckCache _self;
  final $Res Function(_DiscoveryDeckCache) _then;

/// Create a copy of DiscoveryDeckCache
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? items = null,Object? hasMore = null,Object? lastDocumentId = freezed,Object? cursor = freezed,Object? distancesKm = null,}) {
  return _then(_DiscoveryDeckCache(
items: null == items ? _self._items : items // ignore: cast_nullable_to_non_nullable
as List<UserData>,hasMore: null == hasMore ? _self.hasMore : hasMore // ignore: cast_nullable_to_non_nullable
as bool,lastDocumentId: freezed == lastDocumentId ? _self.lastDocumentId : lastDocumentId // ignore: cast_nullable_to_non_nullable
as String?,cursor: freezed == cursor ? _self.cursor : cursor // ignore: cast_nullable_to_non_nullable
as String?,distancesKm: null == distancesKm ? _self._distancesKm : distancesKm // ignore: cast_nullable_to_non_nullable
as Map<String, double>,
  ));
}


}

// dart format on
