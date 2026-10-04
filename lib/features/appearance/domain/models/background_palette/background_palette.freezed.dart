// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'background_palette.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$BackgroundPalette {

@ColorSerializable() Color get primary;@ColorSerializable() Color get secondary;
/// Create a copy of BackgroundPalette
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BackgroundPaletteCopyWith<BackgroundPalette> get copyWith => _$BackgroundPaletteCopyWithImpl<BackgroundPalette>(this as BackgroundPalette, _$identity);

  /// Serializes this BackgroundPalette to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BackgroundPalette&&(identical(other.primary, primary) || other.primary == primary)&&(identical(other.secondary, secondary) || other.secondary == secondary));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,primary,secondary);

@override
String toString() {
  return 'BackgroundPalette(primary: $primary, secondary: $secondary)';
}


}

/// @nodoc
abstract mixin class $BackgroundPaletteCopyWith<$Res>  {
  factory $BackgroundPaletteCopyWith(BackgroundPalette value, $Res Function(BackgroundPalette) _then) = _$BackgroundPaletteCopyWithImpl;
@useResult
$Res call({
@ColorSerializable() Color primary,@ColorSerializable() Color secondary
});




}
/// @nodoc
class _$BackgroundPaletteCopyWithImpl<$Res>
    implements $BackgroundPaletteCopyWith<$Res> {
  _$BackgroundPaletteCopyWithImpl(this._self, this._then);

  final BackgroundPalette _self;
  final $Res Function(BackgroundPalette) _then;

/// Create a copy of BackgroundPalette
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? primary = null,Object? secondary = null,}) {
  return _then(_self.copyWith(
primary: null == primary ? _self.primary : primary // ignore: cast_nullable_to_non_nullable
as Color,secondary: null == secondary ? _self.secondary : secondary // ignore: cast_nullable_to_non_nullable
as Color,
  ));
}

}


/// Adds pattern-matching-related methods to [BackgroundPalette].
extension BackgroundPalettePatterns on BackgroundPalette {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BackgroundPalette value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BackgroundPalette() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BackgroundPalette value)  $default,){
final _that = this;
switch (_that) {
case _BackgroundPalette():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BackgroundPalette value)?  $default,){
final _that = this;
switch (_that) {
case _BackgroundPalette() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@ColorSerializable()  Color primary, @ColorSerializable()  Color secondary)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BackgroundPalette() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@ColorSerializable()  Color primary, @ColorSerializable()  Color secondary)  $default,) {final _that = this;
switch (_that) {
case _BackgroundPalette():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@ColorSerializable()  Color primary, @ColorSerializable()  Color secondary)?  $default,) {final _that = this;
switch (_that) {
case _BackgroundPalette() when $default != null:
return $default(_that.primary,_that.secondary);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _BackgroundPalette extends BackgroundPalette {
  const _BackgroundPalette({@ColorSerializable() required this.primary, @ColorSerializable() required this.secondary}): super._();
  factory _BackgroundPalette.fromJson(Map<String, dynamic> json) => _$BackgroundPaletteFromJson(json);

@override@ColorSerializable() final  Color primary;
@override@ColorSerializable() final  Color secondary;

/// Create a copy of BackgroundPalette
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BackgroundPaletteCopyWith<_BackgroundPalette> get copyWith => __$BackgroundPaletteCopyWithImpl<_BackgroundPalette>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$BackgroundPaletteToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BackgroundPalette&&(identical(other.primary, primary) || other.primary == primary)&&(identical(other.secondary, secondary) || other.secondary == secondary));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,primary,secondary);

@override
String toString() {
  return 'BackgroundPalette(primary: $primary, secondary: $secondary)';
}


}

/// @nodoc
abstract mixin class _$BackgroundPaletteCopyWith<$Res> implements $BackgroundPaletteCopyWith<$Res> {
  factory _$BackgroundPaletteCopyWith(_BackgroundPalette value, $Res Function(_BackgroundPalette) _then) = __$BackgroundPaletteCopyWithImpl;
@override @useResult
$Res call({
@ColorSerializable() Color primary,@ColorSerializable() Color secondary
});




}
/// @nodoc
class __$BackgroundPaletteCopyWithImpl<$Res>
    implements _$BackgroundPaletteCopyWith<$Res> {
  __$BackgroundPaletteCopyWithImpl(this._self, this._then);

  final _BackgroundPalette _self;
  final $Res Function(_BackgroundPalette) _then;

/// Create a copy of BackgroundPalette
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? primary = null,Object? secondary = null,}) {
  return _then(_BackgroundPalette(
primary: null == primary ? _self.primary : primary // ignore: cast_nullable_to_non_nullable
as Color,secondary: null == secondary ? _self.secondary : secondary // ignore: cast_nullable_to_non_nullable
as Color,
  ));
}


}

// dart format on
