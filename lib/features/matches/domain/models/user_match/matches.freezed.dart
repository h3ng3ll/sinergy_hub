// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'matches.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Matches {

 String get matchId; UserData get user; TinderCardStatus get matchStatus;/// If oneWayMatch it is mean one side
/// matched as liked and other side received as none
/// If other size confirm both completeness must
/// transform to twoWayMatch
 EMatchesCompleteness get completeness; DateTime get time;// Vision Align — насколько совпадают цели,
// видение, подходы двух людей.
// Можно оценивать по описаниям профилей / текстам о себе. 0 -10
 int? get align;/// Берём Experience.experience (junior, middle, senior, leadExpert).
// Считаем совпадение, например:
// 10/10 — один уровень разницы (например middle-middle)
// 8/10 — разница на один уровень (junior-middle)
// 5/10 — разница на два уровня
// 0/10 — разница на три уровня
// Можно учесть rangeExperience (годы опыта) для тонкой настройки.
 int? get experienceScore; int? get skillsMatch; int? get visionScore;
/// Create a copy of Matches
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MatchesCopyWith<Matches> get copyWith => _$MatchesCopyWithImpl<Matches>(this as Matches, _$identity);

  /// Serializes this Matches to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Matches&&(identical(other.matchId, matchId) || other.matchId == matchId)&&(identical(other.user, user) || other.user == user)&&(identical(other.matchStatus, matchStatus) || other.matchStatus == matchStatus)&&(identical(other.completeness, completeness) || other.completeness == completeness)&&(identical(other.time, time) || other.time == time)&&(identical(other.align, align) || other.align == align)&&(identical(other.experienceScore, experienceScore) || other.experienceScore == experienceScore)&&(identical(other.skillsMatch, skillsMatch) || other.skillsMatch == skillsMatch)&&(identical(other.visionScore, visionScore) || other.visionScore == visionScore));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,matchId,user,matchStatus,completeness,time,align,experienceScore,skillsMatch,visionScore);

@override
String toString() {
  return 'Matches(matchId: $matchId, user: $user, matchStatus: $matchStatus, completeness: $completeness, time: $time, align: $align, experienceScore: $experienceScore, skillsMatch: $skillsMatch, visionScore: $visionScore)';
}


}

/// @nodoc
abstract mixin class $MatchesCopyWith<$Res>  {
  factory $MatchesCopyWith(Matches value, $Res Function(Matches) _then) = _$MatchesCopyWithImpl;
@useResult
$Res call({
 String matchId, UserData user, TinderCardStatus matchStatus, EMatchesCompleteness completeness, DateTime time, int? align, int? experienceScore, int? skillsMatch, int? visionScore
});


$UserDataCopyWith<$Res> get user;

}
/// @nodoc
class _$MatchesCopyWithImpl<$Res>
    implements $MatchesCopyWith<$Res> {
  _$MatchesCopyWithImpl(this._self, this._then);

  final Matches _self;
  final $Res Function(Matches) _then;

/// Create a copy of Matches
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? matchId = null,Object? user = null,Object? matchStatus = null,Object? completeness = null,Object? time = null,Object? align = freezed,Object? experienceScore = freezed,Object? skillsMatch = freezed,Object? visionScore = freezed,}) {
  return _then(_self.copyWith(
matchId: null == matchId ? _self.matchId : matchId // ignore: cast_nullable_to_non_nullable
as String,user: null == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as UserData,matchStatus: null == matchStatus ? _self.matchStatus : matchStatus // ignore: cast_nullable_to_non_nullable
as TinderCardStatus,completeness: null == completeness ? _self.completeness : completeness // ignore: cast_nullable_to_non_nullable
as EMatchesCompleteness,time: null == time ? _self.time : time // ignore: cast_nullable_to_non_nullable
as DateTime,align: freezed == align ? _self.align : align // ignore: cast_nullable_to_non_nullable
as int?,experienceScore: freezed == experienceScore ? _self.experienceScore : experienceScore // ignore: cast_nullable_to_non_nullable
as int?,skillsMatch: freezed == skillsMatch ? _self.skillsMatch : skillsMatch // ignore: cast_nullable_to_non_nullable
as int?,visionScore: freezed == visionScore ? _self.visionScore : visionScore // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}
/// Create a copy of Matches
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserDataCopyWith<$Res> get user {
  
  return $UserDataCopyWith<$Res>(_self.user, (value) {
    return _then(_self.copyWith(user: value));
  });
}
}


/// Adds pattern-matching-related methods to [Matches].
extension MatchesPatterns on Matches {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Matches value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Matches() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Matches value)  $default,){
final _that = this;
switch (_that) {
case _Matches():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Matches value)?  $default,){
final _that = this;
switch (_that) {
case _Matches() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String matchId,  UserData user,  TinderCardStatus matchStatus,  EMatchesCompleteness completeness,  DateTime time,  int? align,  int? experienceScore,  int? skillsMatch,  int? visionScore)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Matches() when $default != null:
return $default(_that.matchId,_that.user,_that.matchStatus,_that.completeness,_that.time,_that.align,_that.experienceScore,_that.skillsMatch,_that.visionScore);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String matchId,  UserData user,  TinderCardStatus matchStatus,  EMatchesCompleteness completeness,  DateTime time,  int? align,  int? experienceScore,  int? skillsMatch,  int? visionScore)  $default,) {final _that = this;
switch (_that) {
case _Matches():
return $default(_that.matchId,_that.user,_that.matchStatus,_that.completeness,_that.time,_that.align,_that.experienceScore,_that.skillsMatch,_that.visionScore);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String matchId,  UserData user,  TinderCardStatus matchStatus,  EMatchesCompleteness completeness,  DateTime time,  int? align,  int? experienceScore,  int? skillsMatch,  int? visionScore)?  $default,) {final _that = this;
switch (_that) {
case _Matches() when $default != null:
return $default(_that.matchId,_that.user,_that.matchStatus,_that.completeness,_that.time,_that.align,_that.experienceScore,_that.skillsMatch,_that.visionScore);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Matches implements Matches {
  const _Matches({required this.matchId, required this.user, required this.matchStatus, this.completeness = EMatchesCompleteness.none, required this.time, this.align, this.experienceScore, this.skillsMatch, this.visionScore});
  factory _Matches.fromJson(Map<String, dynamic> json) => _$MatchesFromJson(json);

@override final  String matchId;
@override final  UserData user;
@override final  TinderCardStatus matchStatus;
/// If oneWayMatch it is mean one side
/// matched as liked and other side received as none
/// If other size confirm both completeness must
/// transform to twoWayMatch
@override@JsonKey() final  EMatchesCompleteness completeness;
@override final  DateTime time;
// Vision Align — насколько совпадают цели,
// видение, подходы двух людей.
// Можно оценивать по описаниям профилей / текстам о себе. 0 -10
@override final  int? align;
/// Берём Experience.experience (junior, middle, senior, leadExpert).
// Считаем совпадение, например:
// 10/10 — один уровень разницы (например middle-middle)
// 8/10 — разница на один уровень (junior-middle)
// 5/10 — разница на два уровня
// 0/10 — разница на три уровня
// Можно учесть rangeExperience (годы опыта) для тонкой настройки.
@override final  int? experienceScore;
@override final  int? skillsMatch;
@override final  int? visionScore;

/// Create a copy of Matches
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MatchesCopyWith<_Matches> get copyWith => __$MatchesCopyWithImpl<_Matches>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MatchesToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Matches&&(identical(other.matchId, matchId) || other.matchId == matchId)&&(identical(other.user, user) || other.user == user)&&(identical(other.matchStatus, matchStatus) || other.matchStatus == matchStatus)&&(identical(other.completeness, completeness) || other.completeness == completeness)&&(identical(other.time, time) || other.time == time)&&(identical(other.align, align) || other.align == align)&&(identical(other.experienceScore, experienceScore) || other.experienceScore == experienceScore)&&(identical(other.skillsMatch, skillsMatch) || other.skillsMatch == skillsMatch)&&(identical(other.visionScore, visionScore) || other.visionScore == visionScore));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,matchId,user,matchStatus,completeness,time,align,experienceScore,skillsMatch,visionScore);

@override
String toString() {
  return 'Matches(matchId: $matchId, user: $user, matchStatus: $matchStatus, completeness: $completeness, time: $time, align: $align, experienceScore: $experienceScore, skillsMatch: $skillsMatch, visionScore: $visionScore)';
}


}

/// @nodoc
abstract mixin class _$MatchesCopyWith<$Res> implements $MatchesCopyWith<$Res> {
  factory _$MatchesCopyWith(_Matches value, $Res Function(_Matches) _then) = __$MatchesCopyWithImpl;
@override @useResult
$Res call({
 String matchId, UserData user, TinderCardStatus matchStatus, EMatchesCompleteness completeness, DateTime time, int? align, int? experienceScore, int? skillsMatch, int? visionScore
});


@override $UserDataCopyWith<$Res> get user;

}
/// @nodoc
class __$MatchesCopyWithImpl<$Res>
    implements _$MatchesCopyWith<$Res> {
  __$MatchesCopyWithImpl(this._self, this._then);

  final _Matches _self;
  final $Res Function(_Matches) _then;

/// Create a copy of Matches
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? matchId = null,Object? user = null,Object? matchStatus = null,Object? completeness = null,Object? time = null,Object? align = freezed,Object? experienceScore = freezed,Object? skillsMatch = freezed,Object? visionScore = freezed,}) {
  return _then(_Matches(
matchId: null == matchId ? _self.matchId : matchId // ignore: cast_nullable_to_non_nullable
as String,user: null == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as UserData,matchStatus: null == matchStatus ? _self.matchStatus : matchStatus // ignore: cast_nullable_to_non_nullable
as TinderCardStatus,completeness: null == completeness ? _self.completeness : completeness // ignore: cast_nullable_to_non_nullable
as EMatchesCompleteness,time: null == time ? _self.time : time // ignore: cast_nullable_to_non_nullable
as DateTime,align: freezed == align ? _self.align : align // ignore: cast_nullable_to_non_nullable
as int?,experienceScore: freezed == experienceScore ? _self.experienceScore : experienceScore // ignore: cast_nullable_to_non_nullable
as int?,skillsMatch: freezed == skillsMatch ? _self.skillsMatch : skillsMatch // ignore: cast_nullable_to_non_nullable
as int?,visionScore: freezed == visionScore ? _self.visionScore : visionScore // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

/// Create a copy of Matches
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserDataCopyWith<$Res> get user {
  
  return $UserDataCopyWith<$Res>(_self.user, (value) {
    return _then(_self.copyWith(user: value));
  });
}
}

// dart format on
