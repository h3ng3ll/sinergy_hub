// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_profiler.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$UserProfiler {

 ESpecialization get specialization; ERole get role; EExperience get experience; List<ESpecialization> get searchingSpecializations;
/// Create a copy of UserProfiler
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserProfilerCopyWith<UserProfiler> get copyWith => _$UserProfilerCopyWithImpl<UserProfiler>(this as UserProfiler, _$identity);

  /// Serializes this UserProfiler to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserProfiler&&(identical(other.specialization, specialization) || other.specialization == specialization)&&(identical(other.role, role) || other.role == role)&&(identical(other.experience, experience) || other.experience == experience)&&const DeepCollectionEquality().equals(other.searchingSpecializations, searchingSpecializations));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,specialization,role,experience,const DeepCollectionEquality().hash(searchingSpecializations));

@override
String toString() {
  return 'UserProfiler(specialization: $specialization, role: $role, experience: $experience, searchingSpecializations: $searchingSpecializations)';
}


}

/// @nodoc
abstract mixin class $UserProfilerCopyWith<$Res>  {
  factory $UserProfilerCopyWith(UserProfiler value, $Res Function(UserProfiler) _then) = _$UserProfilerCopyWithImpl;
@useResult
$Res call({
 ESpecialization specialization, ERole role, EExperience experience, List<ESpecialization> searchingSpecializations
});




}
/// @nodoc
class _$UserProfilerCopyWithImpl<$Res>
    implements $UserProfilerCopyWith<$Res> {
  _$UserProfilerCopyWithImpl(this._self, this._then);

  final UserProfiler _self;
  final $Res Function(UserProfiler) _then;

/// Create a copy of UserProfiler
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? specialization = null,Object? role = null,Object? experience = null,Object? searchingSpecializations = null,}) {
  return _then(_self.copyWith(
specialization: null == specialization ? _self.specialization : specialization // ignore: cast_nullable_to_non_nullable
as ESpecialization,role: null == role ? _self.role : role // ignore: cast_nullable_to_non_nullable
as ERole,experience: null == experience ? _self.experience : experience // ignore: cast_nullable_to_non_nullable
as EExperience,searchingSpecializations: null == searchingSpecializations ? _self.searchingSpecializations : searchingSpecializations // ignore: cast_nullable_to_non_nullable
as List<ESpecialization>,
  ));
}

}


/// Adds pattern-matching-related methods to [UserProfiler].
extension UserProfilerPatterns on UserProfiler {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UserProfiler value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UserProfiler() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UserProfiler value)  $default,){
final _that = this;
switch (_that) {
case _UserProfiler():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UserProfiler value)?  $default,){
final _that = this;
switch (_that) {
case _UserProfiler() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( ESpecialization specialization,  ERole role,  EExperience experience,  List<ESpecialization> searchingSpecializations)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UserProfiler() when $default != null:
return $default(_that.specialization,_that.role,_that.experience,_that.searchingSpecializations);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( ESpecialization specialization,  ERole role,  EExperience experience,  List<ESpecialization> searchingSpecializations)  $default,) {final _that = this;
switch (_that) {
case _UserProfiler():
return $default(_that.specialization,_that.role,_that.experience,_that.searchingSpecializations);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( ESpecialization specialization,  ERole role,  EExperience experience,  List<ESpecialization> searchingSpecializations)?  $default,) {final _that = this;
switch (_that) {
case _UserProfiler() when $default != null:
return $default(_that.specialization,_that.role,_that.experience,_that.searchingSpecializations);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _UserProfiler implements UserProfiler {
  const _UserProfiler({required this.specialization, required this.role, required this.experience, required final  List<ESpecialization> searchingSpecializations}): _searchingSpecializations = searchingSpecializations;
  factory _UserProfiler.fromJson(Map<String, dynamic> json) => _$UserProfilerFromJson(json);

@override final  ESpecialization specialization;
@override final  ERole role;
@override final  EExperience experience;
 final  List<ESpecialization> _searchingSpecializations;
@override List<ESpecialization> get searchingSpecializations {
  if (_searchingSpecializations is EqualUnmodifiableListView) return _searchingSpecializations;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_searchingSpecializations);
}


/// Create a copy of UserProfiler
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UserProfilerCopyWith<_UserProfiler> get copyWith => __$UserProfilerCopyWithImpl<_UserProfiler>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UserProfilerToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UserProfiler&&(identical(other.specialization, specialization) || other.specialization == specialization)&&(identical(other.role, role) || other.role == role)&&(identical(other.experience, experience) || other.experience == experience)&&const DeepCollectionEquality().equals(other._searchingSpecializations, _searchingSpecializations));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,specialization,role,experience,const DeepCollectionEquality().hash(_searchingSpecializations));

@override
String toString() {
  return 'UserProfiler(specialization: $specialization, role: $role, experience: $experience, searchingSpecializations: $searchingSpecializations)';
}


}

/// @nodoc
abstract mixin class _$UserProfilerCopyWith<$Res> implements $UserProfilerCopyWith<$Res> {
  factory _$UserProfilerCopyWith(_UserProfiler value, $Res Function(_UserProfiler) _then) = __$UserProfilerCopyWithImpl;
@override @useResult
$Res call({
 ESpecialization specialization, ERole role, EExperience experience, List<ESpecialization> searchingSpecializations
});




}
/// @nodoc
class __$UserProfilerCopyWithImpl<$Res>
    implements _$UserProfilerCopyWith<$Res> {
  __$UserProfilerCopyWithImpl(this._self, this._then);

  final _UserProfiler _self;
  final $Res Function(_UserProfiler) _then;

/// Create a copy of UserProfiler
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? specialization = null,Object? role = null,Object? experience = null,Object? searchingSpecializations = null,}) {
  return _then(_UserProfiler(
specialization: null == specialization ? _self.specialization : specialization // ignore: cast_nullable_to_non_nullable
as ESpecialization,role: null == role ? _self.role : role // ignore: cast_nullable_to_non_nullable
as ERole,experience: null == experience ? _self.experience : experience // ignore: cast_nullable_to_non_nullable
as EExperience,searchingSpecializations: null == searchingSpecializations ? _self._searchingSpecializations : searchingSpecializations // ignore: cast_nullable_to_non_nullable
as List<ESpecialization>,
  ));
}


}

// dart format on
