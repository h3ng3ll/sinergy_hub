// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'matches_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$MatchesDto {

 List<String> get answeredUids; EMatchesCompleteness get completeness; int get experienceScore; String get matchId; TinderCardStatus get matchStatus; dynamic get skillsMatch; int get skillsScore;@TimestampConverter() DateTime get time; List<String> get users; int get visionScore;
/// Create a copy of MatchesDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MatchesDtoCopyWith<MatchesDto> get copyWith => _$MatchesDtoCopyWithImpl<MatchesDto>(this as MatchesDto, _$identity);

  /// Serializes this MatchesDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MatchesDto&&const DeepCollectionEquality().equals(other.answeredUids, answeredUids)&&(identical(other.completeness, completeness) || other.completeness == completeness)&&(identical(other.experienceScore, experienceScore) || other.experienceScore == experienceScore)&&(identical(other.matchId, matchId) || other.matchId == matchId)&&(identical(other.matchStatus, matchStatus) || other.matchStatus == matchStatus)&&const DeepCollectionEquality().equals(other.skillsMatch, skillsMatch)&&(identical(other.skillsScore, skillsScore) || other.skillsScore == skillsScore)&&(identical(other.time, time) || other.time == time)&&const DeepCollectionEquality().equals(other.users, users)&&(identical(other.visionScore, visionScore) || other.visionScore == visionScore));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(answeredUids),completeness,experienceScore,matchId,matchStatus,const DeepCollectionEquality().hash(skillsMatch),skillsScore,time,const DeepCollectionEquality().hash(users),visionScore);

@override
String toString() {
  return 'MatchesDto(answeredUids: $answeredUids, completeness: $completeness, experienceScore: $experienceScore, matchId: $matchId, matchStatus: $matchStatus, skillsMatch: $skillsMatch, skillsScore: $skillsScore, time: $time, users: $users, visionScore: $visionScore)';
}


}

/// @nodoc
abstract mixin class $MatchesDtoCopyWith<$Res>  {
  factory $MatchesDtoCopyWith(MatchesDto value, $Res Function(MatchesDto) _then) = _$MatchesDtoCopyWithImpl;
@useResult
$Res call({
 List<String> answeredUids, EMatchesCompleteness completeness, int experienceScore, String matchId, TinderCardStatus matchStatus, dynamic skillsMatch, int skillsScore,@TimestampConverter() DateTime time, List<String> users, int visionScore
});




}
/// @nodoc
class _$MatchesDtoCopyWithImpl<$Res>
    implements $MatchesDtoCopyWith<$Res> {
  _$MatchesDtoCopyWithImpl(this._self, this._then);

  final MatchesDto _self;
  final $Res Function(MatchesDto) _then;

/// Create a copy of MatchesDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? answeredUids = null,Object? completeness = null,Object? experienceScore = null,Object? matchId = null,Object? matchStatus = null,Object? skillsMatch = freezed,Object? skillsScore = null,Object? time = null,Object? users = null,Object? visionScore = null,}) {
  return _then(_self.copyWith(
answeredUids: null == answeredUids ? _self.answeredUids : answeredUids // ignore: cast_nullable_to_non_nullable
as List<String>,completeness: null == completeness ? _self.completeness : completeness // ignore: cast_nullable_to_non_nullable
as EMatchesCompleteness,experienceScore: null == experienceScore ? _self.experienceScore : experienceScore // ignore: cast_nullable_to_non_nullable
as int,matchId: null == matchId ? _self.matchId : matchId // ignore: cast_nullable_to_non_nullable
as String,matchStatus: null == matchStatus ? _self.matchStatus : matchStatus // ignore: cast_nullable_to_non_nullable
as TinderCardStatus,skillsMatch: freezed == skillsMatch ? _self.skillsMatch : skillsMatch // ignore: cast_nullable_to_non_nullable
as dynamic,skillsScore: null == skillsScore ? _self.skillsScore : skillsScore // ignore: cast_nullable_to_non_nullable
as int,time: null == time ? _self.time : time // ignore: cast_nullable_to_non_nullable
as DateTime,users: null == users ? _self.users : users // ignore: cast_nullable_to_non_nullable
as List<String>,visionScore: null == visionScore ? _self.visionScore : visionScore // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [MatchesDto].
extension MatchesDtoPatterns on MatchesDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MatchesDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MatchesDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MatchesDto value)  $default,){
final _that = this;
switch (_that) {
case _MatchesDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MatchesDto value)?  $default,){
final _that = this;
switch (_that) {
case _MatchesDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<String> answeredUids,  EMatchesCompleteness completeness,  int experienceScore,  String matchId,  TinderCardStatus matchStatus,  dynamic skillsMatch,  int skillsScore, @TimestampConverter()  DateTime time,  List<String> users,  int visionScore)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MatchesDto() when $default != null:
return $default(_that.answeredUids,_that.completeness,_that.experienceScore,_that.matchId,_that.matchStatus,_that.skillsMatch,_that.skillsScore,_that.time,_that.users,_that.visionScore);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<String> answeredUids,  EMatchesCompleteness completeness,  int experienceScore,  String matchId,  TinderCardStatus matchStatus,  dynamic skillsMatch,  int skillsScore, @TimestampConverter()  DateTime time,  List<String> users,  int visionScore)  $default,) {final _that = this;
switch (_that) {
case _MatchesDto():
return $default(_that.answeredUids,_that.completeness,_that.experienceScore,_that.matchId,_that.matchStatus,_that.skillsMatch,_that.skillsScore,_that.time,_that.users,_that.visionScore);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<String> answeredUids,  EMatchesCompleteness completeness,  int experienceScore,  String matchId,  TinderCardStatus matchStatus,  dynamic skillsMatch,  int skillsScore, @TimestampConverter()  DateTime time,  List<String> users,  int visionScore)?  $default,) {final _that = this;
switch (_that) {
case _MatchesDto() when $default != null:
return $default(_that.answeredUids,_that.completeness,_that.experienceScore,_that.matchId,_that.matchStatus,_that.skillsMatch,_that.skillsScore,_that.time,_that.users,_that.visionScore);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _MatchesDto extends MatchesDto {
  const _MatchesDto({required final  List<String> answeredUids, required this.completeness, this.experienceScore = 0, required this.matchId, required this.matchStatus, this.skillsMatch = 0, this.skillsScore = 0, @TimestampConverter() required this.time, required final  List<String> users, this.visionScore = 0}): _answeredUids = answeredUids,_users = users,super._();
  factory _MatchesDto.fromJson(Map<String, dynamic> json) => _$MatchesDtoFromJson(json);

 final  List<String> _answeredUids;
@override List<String> get answeredUids {
  if (_answeredUids is EqualUnmodifiableListView) return _answeredUids;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_answeredUids);
}

@override final  EMatchesCompleteness completeness;
@override@JsonKey() final  int experienceScore;
@override final  String matchId;
@override final  TinderCardStatus matchStatus;
@override@JsonKey() final  dynamic skillsMatch;
@override@JsonKey() final  int skillsScore;
@override@TimestampConverter() final  DateTime time;
 final  List<String> _users;
@override List<String> get users {
  if (_users is EqualUnmodifiableListView) return _users;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_users);
}

@override@JsonKey() final  int visionScore;

/// Create a copy of MatchesDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MatchesDtoCopyWith<_MatchesDto> get copyWith => __$MatchesDtoCopyWithImpl<_MatchesDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MatchesDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MatchesDto&&const DeepCollectionEquality().equals(other._answeredUids, _answeredUids)&&(identical(other.completeness, completeness) || other.completeness == completeness)&&(identical(other.experienceScore, experienceScore) || other.experienceScore == experienceScore)&&(identical(other.matchId, matchId) || other.matchId == matchId)&&(identical(other.matchStatus, matchStatus) || other.matchStatus == matchStatus)&&const DeepCollectionEquality().equals(other.skillsMatch, skillsMatch)&&(identical(other.skillsScore, skillsScore) || other.skillsScore == skillsScore)&&(identical(other.time, time) || other.time == time)&&const DeepCollectionEquality().equals(other._users, _users)&&(identical(other.visionScore, visionScore) || other.visionScore == visionScore));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_answeredUids),completeness,experienceScore,matchId,matchStatus,const DeepCollectionEquality().hash(skillsMatch),skillsScore,time,const DeepCollectionEquality().hash(_users),visionScore);

@override
String toString() {
  return 'MatchesDto(answeredUids: $answeredUids, completeness: $completeness, experienceScore: $experienceScore, matchId: $matchId, matchStatus: $matchStatus, skillsMatch: $skillsMatch, skillsScore: $skillsScore, time: $time, users: $users, visionScore: $visionScore)';
}


}

/// @nodoc
abstract mixin class _$MatchesDtoCopyWith<$Res> implements $MatchesDtoCopyWith<$Res> {
  factory _$MatchesDtoCopyWith(_MatchesDto value, $Res Function(_MatchesDto) _then) = __$MatchesDtoCopyWithImpl;
@override @useResult
$Res call({
 List<String> answeredUids, EMatchesCompleteness completeness, int experienceScore, String matchId, TinderCardStatus matchStatus, dynamic skillsMatch, int skillsScore,@TimestampConverter() DateTime time, List<String> users, int visionScore
});




}
/// @nodoc
class __$MatchesDtoCopyWithImpl<$Res>
    implements _$MatchesDtoCopyWith<$Res> {
  __$MatchesDtoCopyWithImpl(this._self, this._then);

  final _MatchesDto _self;
  final $Res Function(_MatchesDto) _then;

/// Create a copy of MatchesDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? answeredUids = null,Object? completeness = null,Object? experienceScore = null,Object? matchId = null,Object? matchStatus = null,Object? skillsMatch = freezed,Object? skillsScore = null,Object? time = null,Object? users = null,Object? visionScore = null,}) {
  return _then(_MatchesDto(
answeredUids: null == answeredUids ? _self._answeredUids : answeredUids // ignore: cast_nullable_to_non_nullable
as List<String>,completeness: null == completeness ? _self.completeness : completeness // ignore: cast_nullable_to_non_nullable
as EMatchesCompleteness,experienceScore: null == experienceScore ? _self.experienceScore : experienceScore // ignore: cast_nullable_to_non_nullable
as int,matchId: null == matchId ? _self.matchId : matchId // ignore: cast_nullable_to_non_nullable
as String,matchStatus: null == matchStatus ? _self.matchStatus : matchStatus // ignore: cast_nullable_to_non_nullable
as TinderCardStatus,skillsMatch: freezed == skillsMatch ? _self.skillsMatch : skillsMatch // ignore: cast_nullable_to_non_nullable
as dynamic,skillsScore: null == skillsScore ? _self.skillsScore : skillsScore // ignore: cast_nullable_to_non_nullable
as int,time: null == time ? _self.time : time // ignore: cast_nullable_to_non_nullable
as DateTime,users: null == users ? _self._users : users // ignore: cast_nullable_to_non_nullable
as List<String>,visionScore: null == visionScore ? _self.visionScore : visionScore // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
