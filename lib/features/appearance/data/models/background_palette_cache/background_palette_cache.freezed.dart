// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'background_palette_cache.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$BackgroundPaletteCache {

 int? get primary; int? get secondary;
/// Create a copy of BackgroundPaletteCache
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BackgroundPaletteCacheCopyWith<BackgroundPaletteCache> get copyWith => _$BackgroundPaletteCacheCopyWithImpl<BackgroundPaletteCache>(this as BackgroundPaletteCache, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BackgroundPaletteCache&&(identical(other.primary, primary) || other.primary == primary)&&(identical(other.secondary, secondary) || other.secondary == secondary));
}


@override
int get hashCode => Object.hash(runtimeType,primary,secondary);

@override
String toString() {
  return 'BackgroundPaletteCache(primary: $primary, secondary: $secondary)';
}


}

/// @nodoc
abstract mixin class $BackgroundPaletteCacheCopyWith<$Res>  {
  factory $BackgroundPaletteCacheCopyWith(BackgroundPaletteCache value, $Res Function(BackgroundPaletteCache) _then) = _$BackgroundPaletteCacheCopyWithImpl;
@useResult
$Res call({
 int? primary, int? secondary
});




}
/// @nodoc
class _$BackgroundPaletteCacheCopyWithImpl<$Res>
    implements $BackgroundPaletteCacheCopyWith<$Res> {
  _$BackgroundPaletteCacheCopyWithImpl(this._self, this._then);

  final BackgroundPaletteCache _self;
  final $Res Function(BackgroundPaletteCache) _then;

/// Create a copy of BackgroundPaletteCache
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? primary = freezed,Object? secondary = freezed,}) {
  return _then(_self.copyWith(
primary: freezed == primary ? _self.primary : primary // ignore: cast_nullable_to_non_nullable
as int?,secondary: freezed == secondary ? _self.secondary : secondary // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// Adds pattern-matching-related methods to [BackgroundPaletteCache].
extension BackgroundPaletteCachePatterns on BackgroundPaletteCache {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BackgroundPaletteCache value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BackgroundPaletteCache() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BackgroundPaletteCache value)  $default,){
final _that = this;
switch (_that) {
case _BackgroundPaletteCache():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BackgroundPaletteCache value)?  $default,){
final _that = this;
switch (_that) {
case _BackgroundPaletteCache() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int? primary,  int? secondary)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BackgroundPaletteCache() when $default != null:
return $default(_that.primary,_that.secondary);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int? primary,  int? secondary)  $default,) {final _that = this;
switch (_that) {
case _BackgroundPaletteCache():
return $default(_that.primary,_that.secondary);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int? primary,  int? secondary)?  $default,) {final _that = this;
switch (_that) {
case _BackgroundPaletteCache() when $default != null:
return $default(_that.primary,_that.secondary);case _:
  return null;

}
}

}

/// @nodoc


class _BackgroundPaletteCache extends BackgroundPaletteCache {
  const _BackgroundPaletteCache({this.primary, this.secondary}): super._();
  

@override final  int? primary;
@override final  int? secondary;

/// Create a copy of BackgroundPaletteCache
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BackgroundPaletteCacheCopyWith<_BackgroundPaletteCache> get copyWith => __$BackgroundPaletteCacheCopyWithImpl<_BackgroundPaletteCache>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BackgroundPaletteCache&&(identical(other.primary, primary) || other.primary == primary)&&(identical(other.secondary, secondary) || other.secondary == secondary));
}


@override
int get hashCode => Object.hash(runtimeType,primary,secondary);

@override
String toString() {
  return 'BackgroundPaletteCache(primary: $primary, secondary: $secondary)';
}


}

/// @nodoc
abstract mixin class _$BackgroundPaletteCacheCopyWith<$Res> implements $BackgroundPaletteCacheCopyWith<$Res> {
  factory _$BackgroundPaletteCacheCopyWith(_BackgroundPaletteCache value, $Res Function(_BackgroundPaletteCache) _then) = __$BackgroundPaletteCacheCopyWithImpl;
@override @useResult
$Res call({
 int? primary, int? secondary
});




}
/// @nodoc
class __$BackgroundPaletteCacheCopyWithImpl<$Res>
    implements _$BackgroundPaletteCacheCopyWith<$Res> {
  __$BackgroundPaletteCacheCopyWithImpl(this._self, this._then);

  final _BackgroundPaletteCache _self;
  final $Res Function(_BackgroundPaletteCache) _then;

/// Create a copy of BackgroundPaletteCache
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? primary = freezed,Object? secondary = freezed,}) {
  return _then(_BackgroundPaletteCache(
primary: freezed == primary ? _self.primary : primary // ignore: cast_nullable_to_non_nullable
as int?,secondary: freezed == secondary ? _self.secondary : secondary // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}

// dart format on
