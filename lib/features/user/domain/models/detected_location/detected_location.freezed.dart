// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'detected_location.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$DetectedLocation {

 GeoPosition get position; GeoPlace? get place;
/// Create a copy of DetectedLocation
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DetectedLocationCopyWith<DetectedLocation> get copyWith => _$DetectedLocationCopyWithImpl<DetectedLocation>(this as DetectedLocation, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DetectedLocation&&(identical(other.position, position) || other.position == position)&&(identical(other.place, place) || other.place == place));
}


@override
int get hashCode => Object.hash(runtimeType,position,place);

@override
String toString() {
  return 'DetectedLocation(position: $position, place: $place)';
}


}

/// @nodoc
abstract mixin class $DetectedLocationCopyWith<$Res>  {
  factory $DetectedLocationCopyWith(DetectedLocation value, $Res Function(DetectedLocation) _then) = _$DetectedLocationCopyWithImpl;
@useResult
$Res call({
 GeoPosition position, GeoPlace? place
});


$GeoPositionCopyWith<$Res> get position;$GeoPlaceCopyWith<$Res>? get place;

}
/// @nodoc
class _$DetectedLocationCopyWithImpl<$Res>
    implements $DetectedLocationCopyWith<$Res> {
  _$DetectedLocationCopyWithImpl(this._self, this._then);

  final DetectedLocation _self;
  final $Res Function(DetectedLocation) _then;

/// Create a copy of DetectedLocation
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? position = null,Object? place = freezed,}) {
  return _then(_self.copyWith(
position: null == position ? _self.position : position // ignore: cast_nullable_to_non_nullable
as GeoPosition,place: freezed == place ? _self.place : place // ignore: cast_nullable_to_non_nullable
as GeoPlace?,
  ));
}
/// Create a copy of DetectedLocation
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$GeoPositionCopyWith<$Res> get position {
  
  return $GeoPositionCopyWith<$Res>(_self.position, (value) {
    return _then(_self.copyWith(position: value));
  });
}/// Create a copy of DetectedLocation
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$GeoPlaceCopyWith<$Res>? get place {
    if (_self.place == null) {
    return null;
  }

  return $GeoPlaceCopyWith<$Res>(_self.place!, (value) {
    return _then(_self.copyWith(place: value));
  });
}
}


/// Adds pattern-matching-related methods to [DetectedLocation].
extension DetectedLocationPatterns on DetectedLocation {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DetectedLocation value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DetectedLocation() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DetectedLocation value)  $default,){
final _that = this;
switch (_that) {
case _DetectedLocation():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DetectedLocation value)?  $default,){
final _that = this;
switch (_that) {
case _DetectedLocation() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( GeoPosition position,  GeoPlace? place)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DetectedLocation() when $default != null:
return $default(_that.position,_that.place);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( GeoPosition position,  GeoPlace? place)  $default,) {final _that = this;
switch (_that) {
case _DetectedLocation():
return $default(_that.position,_that.place);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( GeoPosition position,  GeoPlace? place)?  $default,) {final _that = this;
switch (_that) {
case _DetectedLocation() when $default != null:
return $default(_that.position,_that.place);case _:
  return null;

}
}

}

/// @nodoc


class _DetectedLocation implements DetectedLocation {
  const _DetectedLocation({required this.position, this.place});
  

@override final  GeoPosition position;
@override final  GeoPlace? place;

/// Create a copy of DetectedLocation
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DetectedLocationCopyWith<_DetectedLocation> get copyWith => __$DetectedLocationCopyWithImpl<_DetectedLocation>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DetectedLocation&&(identical(other.position, position) || other.position == position)&&(identical(other.place, place) || other.place == place));
}


@override
int get hashCode => Object.hash(runtimeType,position,place);

@override
String toString() {
  return 'DetectedLocation(position: $position, place: $place)';
}


}

/// @nodoc
abstract mixin class _$DetectedLocationCopyWith<$Res> implements $DetectedLocationCopyWith<$Res> {
  factory _$DetectedLocationCopyWith(_DetectedLocation value, $Res Function(_DetectedLocation) _then) = __$DetectedLocationCopyWithImpl;
@override @useResult
$Res call({
 GeoPosition position, GeoPlace? place
});


@override $GeoPositionCopyWith<$Res> get position;@override $GeoPlaceCopyWith<$Res>? get place;

}
/// @nodoc
class __$DetectedLocationCopyWithImpl<$Res>
    implements _$DetectedLocationCopyWith<$Res> {
  __$DetectedLocationCopyWithImpl(this._self, this._then);

  final _DetectedLocation _self;
  final $Res Function(_DetectedLocation) _then;

/// Create a copy of DetectedLocation
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? position = null,Object? place = freezed,}) {
  return _then(_DetectedLocation(
position: null == position ? _self.position : position // ignore: cast_nullable_to_non_nullable
as GeoPosition,place: freezed == place ? _self.place : place // ignore: cast_nullable_to_non_nullable
as GeoPlace?,
  ));
}

/// Create a copy of DetectedLocation
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$GeoPositionCopyWith<$Res> get position {
  
  return $GeoPositionCopyWith<$Res>(_self.position, (value) {
    return _then(_self.copyWith(position: value));
  });
}/// Create a copy of DetectedLocation
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$GeoPlaceCopyWith<$Res>? get place {
    if (_self.place == null) {
    return null;
  }

  return $GeoPlaceCopyWith<$Res>(_self.place!, (value) {
    return _then(_self.copyWith(place: value));
  });
}
}

// dart format on
