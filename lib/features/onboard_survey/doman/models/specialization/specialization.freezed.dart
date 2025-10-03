// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'specialization.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Specialization {

 String get name; List<String> get particulars;@ColorSerializable() List<Color> get colors; String get icon;
/// Create a copy of Specialization
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SpecializationCopyWith<Specialization> get copyWith => _$SpecializationCopyWithImpl<Specialization>(this as Specialization, _$identity);

  /// Serializes this Specialization to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Specialization&&(identical(other.name, name) || other.name == name)&&const DeepCollectionEquality().equals(other.particulars, particulars)&&const DeepCollectionEquality().equals(other.colors, colors)&&(identical(other.icon, icon) || other.icon == icon));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,const DeepCollectionEquality().hash(particulars),const DeepCollectionEquality().hash(colors),icon);

@override
String toString() {
  return 'Specialization(name: $name, particulars: $particulars, colors: $colors, icon: $icon)';
}


}

/// @nodoc
abstract mixin class $SpecializationCopyWith<$Res>  {
  factory $SpecializationCopyWith(Specialization value, $Res Function(Specialization) _then) = _$SpecializationCopyWithImpl;
@useResult
$Res call({
 String name, List<String> particulars,@ColorSerializable() List<Color> colors, String icon
});




}
/// @nodoc
class _$SpecializationCopyWithImpl<$Res>
    implements $SpecializationCopyWith<$Res> {
  _$SpecializationCopyWithImpl(this._self, this._then);

  final Specialization _self;
  final $Res Function(Specialization) _then;

/// Create a copy of Specialization
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = null,Object? particulars = null,Object? colors = null,Object? icon = null,}) {
  return _then(_self.copyWith(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,particulars: null == particulars ? _self.particulars : particulars // ignore: cast_nullable_to_non_nullable
as List<String>,colors: null == colors ? _self.colors : colors // ignore: cast_nullable_to_non_nullable
as List<Color>,icon: null == icon ? _self.icon : icon // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [Specialization].
extension SpecializationPatterns on Specialization {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Specialization value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Specialization() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Specialization value)  $default,){
final _that = this;
switch (_that) {
case _Specialization():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Specialization value)?  $default,){
final _that = this;
switch (_that) {
case _Specialization() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String name,  List<String> particulars, @ColorSerializable()  List<Color> colors,  String icon)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Specialization() when $default != null:
return $default(_that.name,_that.particulars,_that.colors,_that.icon);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String name,  List<String> particulars, @ColorSerializable()  List<Color> colors,  String icon)  $default,) {final _that = this;
switch (_that) {
case _Specialization():
return $default(_that.name,_that.particulars,_that.colors,_that.icon);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String name,  List<String> particulars, @ColorSerializable()  List<Color> colors,  String icon)?  $default,) {final _that = this;
switch (_that) {
case _Specialization() when $default != null:
return $default(_that.name,_that.particulars,_that.colors,_that.icon);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Specialization implements Specialization {
  const _Specialization({required this.name, required final  List<String> particulars, @ColorSerializable() final  List<Color> colors = const [], this.icon = ''}): _particulars = particulars,_colors = colors;
  factory _Specialization.fromJson(Map<String, dynamic> json) => _$SpecializationFromJson(json);

@override final  String name;
 final  List<String> _particulars;
@override List<String> get particulars {
  if (_particulars is EqualUnmodifiableListView) return _particulars;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_particulars);
}

 final  List<Color> _colors;
@override@JsonKey()@ColorSerializable() List<Color> get colors {
  if (_colors is EqualUnmodifiableListView) return _colors;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_colors);
}

@override@JsonKey() final  String icon;

/// Create a copy of Specialization
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SpecializationCopyWith<_Specialization> get copyWith => __$SpecializationCopyWithImpl<_Specialization>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SpecializationToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Specialization&&(identical(other.name, name) || other.name == name)&&const DeepCollectionEquality().equals(other._particulars, _particulars)&&const DeepCollectionEquality().equals(other._colors, _colors)&&(identical(other.icon, icon) || other.icon == icon));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,const DeepCollectionEquality().hash(_particulars),const DeepCollectionEquality().hash(_colors),icon);

@override
String toString() {
  return 'Specialization(name: $name, particulars: $particulars, colors: $colors, icon: $icon)';
}


}

/// @nodoc
abstract mixin class _$SpecializationCopyWith<$Res> implements $SpecializationCopyWith<$Res> {
  factory _$SpecializationCopyWith(_Specialization value, $Res Function(_Specialization) _then) = __$SpecializationCopyWithImpl;
@override @useResult
$Res call({
 String name, List<String> particulars,@ColorSerializable() List<Color> colors, String icon
});




}
/// @nodoc
class __$SpecializationCopyWithImpl<$Res>
    implements _$SpecializationCopyWith<$Res> {
  __$SpecializationCopyWithImpl(this._self, this._then);

  final _Specialization _self;
  final $Res Function(_Specialization) _then;

/// Create a copy of Specialization
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = null,Object? particulars = null,Object? colors = null,Object? icon = null,}) {
  return _then(_Specialization(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,particulars: null == particulars ? _self._particulars : particulars // ignore: cast_nullable_to_non_nullable
as List<String>,colors: null == colors ? _self._colors : colors // ignore: cast_nullable_to_non_nullable
as List<Color>,icon: null == icon ? _self.icon : icon // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
