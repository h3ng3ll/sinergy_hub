// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'geo_place.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$GeoPlace {

 String? get country; String? get countryCode; String? get city;
/// Create a copy of GeoPlace
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GeoPlaceCopyWith<GeoPlace> get copyWith => _$GeoPlaceCopyWithImpl<GeoPlace>(this as GeoPlace, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GeoPlace&&(identical(other.country, country) || other.country == country)&&(identical(other.countryCode, countryCode) || other.countryCode == countryCode)&&(identical(other.city, city) || other.city == city));
}


@override
int get hashCode => Object.hash(runtimeType,country,countryCode,city);

@override
String toString() {
  return 'GeoPlace(country: $country, countryCode: $countryCode, city: $city)';
}


}

/// @nodoc
abstract mixin class $GeoPlaceCopyWith<$Res>  {
  factory $GeoPlaceCopyWith(GeoPlace value, $Res Function(GeoPlace) _then) = _$GeoPlaceCopyWithImpl;
@useResult
$Res call({
 String? country, String? countryCode, String? city
});




}
/// @nodoc
class _$GeoPlaceCopyWithImpl<$Res>
    implements $GeoPlaceCopyWith<$Res> {
  _$GeoPlaceCopyWithImpl(this._self, this._then);

  final GeoPlace _self;
  final $Res Function(GeoPlace) _then;

/// Create a copy of GeoPlace
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? country = freezed,Object? countryCode = freezed,Object? city = freezed,}) {
  return _then(_self.copyWith(
country: freezed == country ? _self.country : country // ignore: cast_nullable_to_non_nullable
as String?,countryCode: freezed == countryCode ? _self.countryCode : countryCode // ignore: cast_nullable_to_non_nullable
as String?,city: freezed == city ? _self.city : city // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [GeoPlace].
extension GeoPlacePatterns on GeoPlace {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _GeoPlace value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _GeoPlace() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _GeoPlace value)  $default,){
final _that = this;
switch (_that) {
case _GeoPlace():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _GeoPlace value)?  $default,){
final _that = this;
switch (_that) {
case _GeoPlace() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? country,  String? countryCode,  String? city)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _GeoPlace() when $default != null:
return $default(_that.country,_that.countryCode,_that.city);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? country,  String? countryCode,  String? city)  $default,) {final _that = this;
switch (_that) {
case _GeoPlace():
return $default(_that.country,_that.countryCode,_that.city);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? country,  String? countryCode,  String? city)?  $default,) {final _that = this;
switch (_that) {
case _GeoPlace() when $default != null:
return $default(_that.country,_that.countryCode,_that.city);case _:
  return null;

}
}

}

/// @nodoc


class _GeoPlace implements GeoPlace {
  const _GeoPlace({this.country, this.countryCode, this.city});
  

@override final  String? country;
@override final  String? countryCode;
@override final  String? city;

/// Create a copy of GeoPlace
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GeoPlaceCopyWith<_GeoPlace> get copyWith => __$GeoPlaceCopyWithImpl<_GeoPlace>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GeoPlace&&(identical(other.country, country) || other.country == country)&&(identical(other.countryCode, countryCode) || other.countryCode == countryCode)&&(identical(other.city, city) || other.city == city));
}


@override
int get hashCode => Object.hash(runtimeType,country,countryCode,city);

@override
String toString() {
  return 'GeoPlace(country: $country, countryCode: $countryCode, city: $city)';
}


}

/// @nodoc
abstract mixin class _$GeoPlaceCopyWith<$Res> implements $GeoPlaceCopyWith<$Res> {
  factory _$GeoPlaceCopyWith(_GeoPlace value, $Res Function(_GeoPlace) _then) = __$GeoPlaceCopyWithImpl;
@override @useResult
$Res call({
 String? country, String? countryCode, String? city
});




}
/// @nodoc
class __$GeoPlaceCopyWithImpl<$Res>
    implements _$GeoPlaceCopyWith<$Res> {
  __$GeoPlaceCopyWithImpl(this._self, this._then);

  final _GeoPlace _self;
  final $Res Function(_GeoPlace) _then;

/// Create a copy of GeoPlace
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? country = freezed,Object? countryCode = freezed,Object? city = freezed,}) {
  return _then(_GeoPlace(
country: freezed == country ? _self.country : country // ignore: cast_nullable_to_non_nullable
as String?,countryCode: freezed == countryCode ? _self.countryCode : countryCode // ignore: cast_nullable_to_non_nullable
as String?,city: freezed == city ? _self.city : city // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
