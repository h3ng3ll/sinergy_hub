// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'matches_filter.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$MatchesFilter {

 EExperience? get experience; ESpecialization? get specialization; List<Skill> get skills; ELocationFilterMode? get locationMode; String? get country; String? get city; int? get radiusKm;
/// Create a copy of MatchesFilter
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MatchesFilterCopyWith<MatchesFilter> get copyWith => _$MatchesFilterCopyWithImpl<MatchesFilter>(this as MatchesFilter, _$identity);

  /// Serializes this MatchesFilter to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MatchesFilter&&(identical(other.experience, experience) || other.experience == experience)&&(identical(other.specialization, specialization) || other.specialization == specialization)&&const DeepCollectionEquality().equals(other.skills, skills)&&(identical(other.locationMode, locationMode) || other.locationMode == locationMode)&&(identical(other.country, country) || other.country == country)&&(identical(other.city, city) || other.city == city)&&(identical(other.radiusKm, radiusKm) || other.radiusKm == radiusKm));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,experience,specialization,const DeepCollectionEquality().hash(skills),locationMode,country,city,radiusKm);

@override
String toString() {
  return 'MatchesFilter(experience: $experience, specialization: $specialization, skills: $skills, locationMode: $locationMode, country: $country, city: $city, radiusKm: $radiusKm)';
}


}

/// @nodoc
abstract mixin class $MatchesFilterCopyWith<$Res>  {
  factory $MatchesFilterCopyWith(MatchesFilter value, $Res Function(MatchesFilter) _then) = _$MatchesFilterCopyWithImpl;
@useResult
$Res call({
 EExperience? experience, ESpecialization? specialization, List<Skill> skills, ELocationFilterMode? locationMode, String? country, String? city, int? radiusKm
});




}
/// @nodoc
class _$MatchesFilterCopyWithImpl<$Res>
    implements $MatchesFilterCopyWith<$Res> {
  _$MatchesFilterCopyWithImpl(this._self, this._then);

  final MatchesFilter _self;
  final $Res Function(MatchesFilter) _then;

/// Create a copy of MatchesFilter
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? experience = freezed,Object? specialization = freezed,Object? skills = null,Object? locationMode = freezed,Object? country = freezed,Object? city = freezed,Object? radiusKm = freezed,}) {
  return _then(_self.copyWith(
experience: freezed == experience ? _self.experience : experience // ignore: cast_nullable_to_non_nullable
as EExperience?,specialization: freezed == specialization ? _self.specialization : specialization // ignore: cast_nullable_to_non_nullable
as ESpecialization?,skills: null == skills ? _self.skills : skills // ignore: cast_nullable_to_non_nullable
as List<Skill>,locationMode: freezed == locationMode ? _self.locationMode : locationMode // ignore: cast_nullable_to_non_nullable
as ELocationFilterMode?,country: freezed == country ? _self.country : country // ignore: cast_nullable_to_non_nullable
as String?,city: freezed == city ? _self.city : city // ignore: cast_nullable_to_non_nullable
as String?,radiusKm: freezed == radiusKm ? _self.radiusKm : radiusKm // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// Adds pattern-matching-related methods to [MatchesFilter].
extension MatchesFilterPatterns on MatchesFilter {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MatchesFilter value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MatchesFilter() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MatchesFilter value)  $default,){
final _that = this;
switch (_that) {
case _MatchesFilter():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MatchesFilter value)?  $default,){
final _that = this;
switch (_that) {
case _MatchesFilter() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( EExperience? experience,  ESpecialization? specialization,  List<Skill> skills,  ELocationFilterMode? locationMode,  String? country,  String? city,  int? radiusKm)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MatchesFilter() when $default != null:
return $default(_that.experience,_that.specialization,_that.skills,_that.locationMode,_that.country,_that.city,_that.radiusKm);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( EExperience? experience,  ESpecialization? specialization,  List<Skill> skills,  ELocationFilterMode? locationMode,  String? country,  String? city,  int? radiusKm)  $default,) {final _that = this;
switch (_that) {
case _MatchesFilter():
return $default(_that.experience,_that.specialization,_that.skills,_that.locationMode,_that.country,_that.city,_that.radiusKm);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( EExperience? experience,  ESpecialization? specialization,  List<Skill> skills,  ELocationFilterMode? locationMode,  String? country,  String? city,  int? radiusKm)?  $default,) {final _that = this;
switch (_that) {
case _MatchesFilter() when $default != null:
return $default(_that.experience,_that.specialization,_that.skills,_that.locationMode,_that.country,_that.city,_that.radiusKm);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _MatchesFilter implements MatchesFilter {
  const _MatchesFilter({this.experience, this.specialization, final  List<Skill> skills = const [], this.locationMode, this.country, this.city, this.radiusKm}): _skills = skills;
  factory _MatchesFilter.fromJson(Map<String, dynamic> json) => _$MatchesFilterFromJson(json);

@override final  EExperience? experience;
@override final  ESpecialization? specialization;
 final  List<Skill> _skills;
@override@JsonKey() List<Skill> get skills {
  if (_skills is EqualUnmodifiableListView) return _skills;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_skills);
}

@override final  ELocationFilterMode? locationMode;
@override final  String? country;
@override final  String? city;
@override final  int? radiusKm;

/// Create a copy of MatchesFilter
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MatchesFilterCopyWith<_MatchesFilter> get copyWith => __$MatchesFilterCopyWithImpl<_MatchesFilter>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MatchesFilterToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MatchesFilter&&(identical(other.experience, experience) || other.experience == experience)&&(identical(other.specialization, specialization) || other.specialization == specialization)&&const DeepCollectionEquality().equals(other._skills, _skills)&&(identical(other.locationMode, locationMode) || other.locationMode == locationMode)&&(identical(other.country, country) || other.country == country)&&(identical(other.city, city) || other.city == city)&&(identical(other.radiusKm, radiusKm) || other.radiusKm == radiusKm));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,experience,specialization,const DeepCollectionEquality().hash(_skills),locationMode,country,city,radiusKm);

@override
String toString() {
  return 'MatchesFilter(experience: $experience, specialization: $specialization, skills: $skills, locationMode: $locationMode, country: $country, city: $city, radiusKm: $radiusKm)';
}


}

/// @nodoc
abstract mixin class _$MatchesFilterCopyWith<$Res> implements $MatchesFilterCopyWith<$Res> {
  factory _$MatchesFilterCopyWith(_MatchesFilter value, $Res Function(_MatchesFilter) _then) = __$MatchesFilterCopyWithImpl;
@override @useResult
$Res call({
 EExperience? experience, ESpecialization? specialization, List<Skill> skills, ELocationFilterMode? locationMode, String? country, String? city, int? radiusKm
});




}
/// @nodoc
class __$MatchesFilterCopyWithImpl<$Res>
    implements _$MatchesFilterCopyWith<$Res> {
  __$MatchesFilterCopyWithImpl(this._self, this._then);

  final _MatchesFilter _self;
  final $Res Function(_MatchesFilter) _then;

/// Create a copy of MatchesFilter
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? experience = freezed,Object? specialization = freezed,Object? skills = null,Object? locationMode = freezed,Object? country = freezed,Object? city = freezed,Object? radiusKm = freezed,}) {
  return _then(_MatchesFilter(
experience: freezed == experience ? _self.experience : experience // ignore: cast_nullable_to_non_nullable
as EExperience?,specialization: freezed == specialization ? _self.specialization : specialization // ignore: cast_nullable_to_non_nullable
as ESpecialization?,skills: null == skills ? _self._skills : skills // ignore: cast_nullable_to_non_nullable
as List<Skill>,locationMode: freezed == locationMode ? _self.locationMode : locationMode // ignore: cast_nullable_to_non_nullable
as ELocationFilterMode?,country: freezed == country ? _self.country : country // ignore: cast_nullable_to_non_nullable
as String?,city: freezed == city ? _self.city : city // ignore: cast_nullable_to_non_nullable
as String?,radiusKm: freezed == radiusKm ? _self.radiusKm : radiusKm // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}

// dart format on
