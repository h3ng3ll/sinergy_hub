// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'nearby_candidates_page_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$NearbyCandidatesPageDto {

 List<UserData> get items; Map<String, double> get distancesKm; String? get nextCursor; bool get hasMore;
/// Create a copy of NearbyCandidatesPageDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NearbyCandidatesPageDtoCopyWith<NearbyCandidatesPageDto> get copyWith => _$NearbyCandidatesPageDtoCopyWithImpl<NearbyCandidatesPageDto>(this as NearbyCandidatesPageDto, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NearbyCandidatesPageDto&&const DeepCollectionEquality().equals(other.items, items)&&const DeepCollectionEquality().equals(other.distancesKm, distancesKm)&&(identical(other.nextCursor, nextCursor) || other.nextCursor == nextCursor)&&(identical(other.hasMore, hasMore) || other.hasMore == hasMore));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(items),const DeepCollectionEquality().hash(distancesKm),nextCursor,hasMore);

@override
String toString() {
  return 'NearbyCandidatesPageDto(items: $items, distancesKm: $distancesKm, nextCursor: $nextCursor, hasMore: $hasMore)';
}


}

/// @nodoc
abstract mixin class $NearbyCandidatesPageDtoCopyWith<$Res>  {
  factory $NearbyCandidatesPageDtoCopyWith(NearbyCandidatesPageDto value, $Res Function(NearbyCandidatesPageDto) _then) = _$NearbyCandidatesPageDtoCopyWithImpl;
@useResult
$Res call({
 List<UserData> items, Map<String, double> distancesKm, String? nextCursor, bool hasMore
});




}
/// @nodoc
class _$NearbyCandidatesPageDtoCopyWithImpl<$Res>
    implements $NearbyCandidatesPageDtoCopyWith<$Res> {
  _$NearbyCandidatesPageDtoCopyWithImpl(this._self, this._then);

  final NearbyCandidatesPageDto _self;
  final $Res Function(NearbyCandidatesPageDto) _then;

/// Create a copy of NearbyCandidatesPageDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? items = null,Object? distancesKm = null,Object? nextCursor = freezed,Object? hasMore = null,}) {
  return _then(_self.copyWith(
items: null == items ? _self.items : items // ignore: cast_nullable_to_non_nullable
as List<UserData>,distancesKm: null == distancesKm ? _self.distancesKm : distancesKm // ignore: cast_nullable_to_non_nullable
as Map<String, double>,nextCursor: freezed == nextCursor ? _self.nextCursor : nextCursor // ignore: cast_nullable_to_non_nullable
as String?,hasMore: null == hasMore ? _self.hasMore : hasMore // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [NearbyCandidatesPageDto].
extension NearbyCandidatesPageDtoPatterns on NearbyCandidatesPageDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _NearbyCandidatesPageDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _NearbyCandidatesPageDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _NearbyCandidatesPageDto value)  $default,){
final _that = this;
switch (_that) {
case _NearbyCandidatesPageDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _NearbyCandidatesPageDto value)?  $default,){
final _that = this;
switch (_that) {
case _NearbyCandidatesPageDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<UserData> items,  Map<String, double> distancesKm,  String? nextCursor,  bool hasMore)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _NearbyCandidatesPageDto() when $default != null:
return $default(_that.items,_that.distancesKm,_that.nextCursor,_that.hasMore);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<UserData> items,  Map<String, double> distancesKm,  String? nextCursor,  bool hasMore)  $default,) {final _that = this;
switch (_that) {
case _NearbyCandidatesPageDto():
return $default(_that.items,_that.distancesKm,_that.nextCursor,_that.hasMore);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<UserData> items,  Map<String, double> distancesKm,  String? nextCursor,  bool hasMore)?  $default,) {final _that = this;
switch (_that) {
case _NearbyCandidatesPageDto() when $default != null:
return $default(_that.items,_that.distancesKm,_that.nextCursor,_that.hasMore);case _:
  return null;

}
}

}

/// @nodoc


class _NearbyCandidatesPageDto extends NearbyCandidatesPageDto {
  const _NearbyCandidatesPageDto({final  List<UserData> items = const <UserData>[], final  Map<String, double> distancesKm = const {}, this.nextCursor, this.hasMore = false}): _items = items,_distancesKm = distancesKm,super._();
  

 final  List<UserData> _items;
@override@JsonKey() List<UserData> get items {
  if (_items is EqualUnmodifiableListView) return _items;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_items);
}

 final  Map<String, double> _distancesKm;
@override@JsonKey() Map<String, double> get distancesKm {
  if (_distancesKm is EqualUnmodifiableMapView) return _distancesKm;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_distancesKm);
}

@override final  String? nextCursor;
@override@JsonKey() final  bool hasMore;

/// Create a copy of NearbyCandidatesPageDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$NearbyCandidatesPageDtoCopyWith<_NearbyCandidatesPageDto> get copyWith => __$NearbyCandidatesPageDtoCopyWithImpl<_NearbyCandidatesPageDto>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _NearbyCandidatesPageDto&&const DeepCollectionEquality().equals(other._items, _items)&&const DeepCollectionEquality().equals(other._distancesKm, _distancesKm)&&(identical(other.nextCursor, nextCursor) || other.nextCursor == nextCursor)&&(identical(other.hasMore, hasMore) || other.hasMore == hasMore));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_items),const DeepCollectionEquality().hash(_distancesKm),nextCursor,hasMore);

@override
String toString() {
  return 'NearbyCandidatesPageDto(items: $items, distancesKm: $distancesKm, nextCursor: $nextCursor, hasMore: $hasMore)';
}


}

/// @nodoc
abstract mixin class _$NearbyCandidatesPageDtoCopyWith<$Res> implements $NearbyCandidatesPageDtoCopyWith<$Res> {
  factory _$NearbyCandidatesPageDtoCopyWith(_NearbyCandidatesPageDto value, $Res Function(_NearbyCandidatesPageDto) _then) = __$NearbyCandidatesPageDtoCopyWithImpl;
@override @useResult
$Res call({
 List<UserData> items, Map<String, double> distancesKm, String? nextCursor, bool hasMore
});




}
/// @nodoc
class __$NearbyCandidatesPageDtoCopyWithImpl<$Res>
    implements _$NearbyCandidatesPageDtoCopyWith<$Res> {
  __$NearbyCandidatesPageDtoCopyWithImpl(this._self, this._then);

  final _NearbyCandidatesPageDto _self;
  final $Res Function(_NearbyCandidatesPageDto) _then;

/// Create a copy of NearbyCandidatesPageDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? items = null,Object? distancesKm = null,Object? nextCursor = freezed,Object? hasMore = null,}) {
  return _then(_NearbyCandidatesPageDto(
items: null == items ? _self._items : items // ignore: cast_nullable_to_non_nullable
as List<UserData>,distancesKm: null == distancesKm ? _self._distancesKm : distancesKm // ignore: cast_nullable_to_non_nullable
as Map<String, double>,nextCursor: freezed == nextCursor ? _self.nextCursor : nextCursor // ignore: cast_nullable_to_non_nullable
as String?,hasMore: null == hasMore ? _self.hasMore : hasMore // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
