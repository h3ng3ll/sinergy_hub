// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'liked_you_page_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$LikedYouPageDto {

 List<LikedYouItem> get items; String? get nextCursor; bool get hasMore; int get totalCount; LikedYouQuota? get quota;
/// Create a copy of LikedYouPageDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LikedYouPageDtoCopyWith<LikedYouPageDto> get copyWith => _$LikedYouPageDtoCopyWithImpl<LikedYouPageDto>(this as LikedYouPageDto, _$identity);

  /// Serializes this LikedYouPageDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LikedYouPageDto&&const DeepCollectionEquality().equals(other.items, items)&&(identical(other.nextCursor, nextCursor) || other.nextCursor == nextCursor)&&(identical(other.hasMore, hasMore) || other.hasMore == hasMore)&&(identical(other.totalCount, totalCount) || other.totalCount == totalCount)&&(identical(other.quota, quota) || other.quota == quota));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(items),nextCursor,hasMore,totalCount,quota);

@override
String toString() {
  return 'LikedYouPageDto(items: $items, nextCursor: $nextCursor, hasMore: $hasMore, totalCount: $totalCount, quota: $quota)';
}


}

/// @nodoc
abstract mixin class $LikedYouPageDtoCopyWith<$Res>  {
  factory $LikedYouPageDtoCopyWith(LikedYouPageDto value, $Res Function(LikedYouPageDto) _then) = _$LikedYouPageDtoCopyWithImpl;
@useResult
$Res call({
 List<LikedYouItem> items, String? nextCursor, bool hasMore, int totalCount, LikedYouQuota? quota
});


$LikedYouQuotaCopyWith<$Res>? get quota;

}
/// @nodoc
class _$LikedYouPageDtoCopyWithImpl<$Res>
    implements $LikedYouPageDtoCopyWith<$Res> {
  _$LikedYouPageDtoCopyWithImpl(this._self, this._then);

  final LikedYouPageDto _self;
  final $Res Function(LikedYouPageDto) _then;

/// Create a copy of LikedYouPageDto
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
/// Create a copy of LikedYouPageDto
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


/// Adds pattern-matching-related methods to [LikedYouPageDto].
extension LikedYouPageDtoPatterns on LikedYouPageDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _LikedYouPageDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LikedYouPageDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _LikedYouPageDto value)  $default,){
final _that = this;
switch (_that) {
case _LikedYouPageDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _LikedYouPageDto value)?  $default,){
final _that = this;
switch (_that) {
case _LikedYouPageDto() when $default != null:
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
case _LikedYouPageDto() when $default != null:
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
case _LikedYouPageDto():
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
case _LikedYouPageDto() when $default != null:
return $default(_that.items,_that.nextCursor,_that.hasMore,_that.totalCount,_that.quota);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(anyMap: true)
class _LikedYouPageDto extends LikedYouPageDto {
  const _LikedYouPageDto({final  List<LikedYouItem> items = const <LikedYouItem>[], this.nextCursor, required this.hasMore, this.totalCount = 0, this.quota}): _items = items,super._();
  factory _LikedYouPageDto.fromJson(Map<String, dynamic> json) => _$LikedYouPageDtoFromJson(json);

 final  List<LikedYouItem> _items;
@override@JsonKey() List<LikedYouItem> get items {
  if (_items is EqualUnmodifiableListView) return _items;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_items);
}

@override final  String? nextCursor;
@override final  bool hasMore;
@override@JsonKey() final  int totalCount;
@override final  LikedYouQuota? quota;

/// Create a copy of LikedYouPageDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LikedYouPageDtoCopyWith<_LikedYouPageDto> get copyWith => __$LikedYouPageDtoCopyWithImpl<_LikedYouPageDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$LikedYouPageDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LikedYouPageDto&&const DeepCollectionEquality().equals(other._items, _items)&&(identical(other.nextCursor, nextCursor) || other.nextCursor == nextCursor)&&(identical(other.hasMore, hasMore) || other.hasMore == hasMore)&&(identical(other.totalCount, totalCount) || other.totalCount == totalCount)&&(identical(other.quota, quota) || other.quota == quota));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_items),nextCursor,hasMore,totalCount,quota);

@override
String toString() {
  return 'LikedYouPageDto(items: $items, nextCursor: $nextCursor, hasMore: $hasMore, totalCount: $totalCount, quota: $quota)';
}


}

/// @nodoc
abstract mixin class _$LikedYouPageDtoCopyWith<$Res> implements $LikedYouPageDtoCopyWith<$Res> {
  factory _$LikedYouPageDtoCopyWith(_LikedYouPageDto value, $Res Function(_LikedYouPageDto) _then) = __$LikedYouPageDtoCopyWithImpl;
@override @useResult
$Res call({
 List<LikedYouItem> items, String? nextCursor, bool hasMore, int totalCount, LikedYouQuota? quota
});


@override $LikedYouQuotaCopyWith<$Res>? get quota;

}
/// @nodoc
class __$LikedYouPageDtoCopyWithImpl<$Res>
    implements _$LikedYouPageDtoCopyWith<$Res> {
  __$LikedYouPageDtoCopyWithImpl(this._self, this._then);

  final _LikedYouPageDto _self;
  final $Res Function(_LikedYouPageDto) _then;

/// Create a copy of LikedYouPageDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? items = null,Object? nextCursor = freezed,Object? hasMore = null,Object? totalCount = null,Object? quota = freezed,}) {
  return _then(_LikedYouPageDto(
items: null == items ? _self._items : items // ignore: cast_nullable_to_non_nullable
as List<LikedYouItem>,nextCursor: freezed == nextCursor ? _self.nextCursor : nextCursor // ignore: cast_nullable_to_non_nullable
as String?,hasMore: null == hasMore ? _self.hasMore : hasMore // ignore: cast_nullable_to_non_nullable
as bool,totalCount: null == totalCount ? _self.totalCount : totalCount // ignore: cast_nullable_to_non_nullable
as int,quota: freezed == quota ? _self.quota : quota // ignore: cast_nullable_to_non_nullable
as LikedYouQuota?,
  ));
}

/// Create a copy of LikedYouPageDto
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
