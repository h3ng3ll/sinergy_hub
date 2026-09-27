// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'liked_you_item.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$LikedYouItem {

 String get likeId; DateTime get likedAt; bool get isLocked;@JsonKey(unknownEnumValue: EImageState.none) EImageState get imageState; String? get imageUrl; String? get uid; String? get firstName; int? get age;@JsonKey(unknownEnumValue: JsonKey.nullForUndefinedEnumValue) ESpecialization? get specialization;@JsonKey(unknownEnumValue: JsonKey.nullForUndefinedEnumValue) EExperience? get experience; List<Skill> get skills;
/// Create a copy of LikedYouItem
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LikedYouItemCopyWith<LikedYouItem> get copyWith => _$LikedYouItemCopyWithImpl<LikedYouItem>(this as LikedYouItem, _$identity);

  /// Serializes this LikedYouItem to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LikedYouItem&&(identical(other.likeId, likeId) || other.likeId == likeId)&&(identical(other.likedAt, likedAt) || other.likedAt == likedAt)&&(identical(other.isLocked, isLocked) || other.isLocked == isLocked)&&(identical(other.imageState, imageState) || other.imageState == imageState)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.uid, uid) || other.uid == uid)&&(identical(other.firstName, firstName) || other.firstName == firstName)&&(identical(other.age, age) || other.age == age)&&(identical(other.specialization, specialization) || other.specialization == specialization)&&(identical(other.experience, experience) || other.experience == experience)&&const DeepCollectionEquality().equals(other.skills, skills));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,likeId,likedAt,isLocked,imageState,imageUrl,uid,firstName,age,specialization,experience,const DeepCollectionEquality().hash(skills));

@override
String toString() {
  return 'LikedYouItem(likeId: $likeId, likedAt: $likedAt, isLocked: $isLocked, imageState: $imageState, imageUrl: $imageUrl, uid: $uid, firstName: $firstName, age: $age, specialization: $specialization, experience: $experience, skills: $skills)';
}


}

/// @nodoc
abstract mixin class $LikedYouItemCopyWith<$Res>  {
  factory $LikedYouItemCopyWith(LikedYouItem value, $Res Function(LikedYouItem) _then) = _$LikedYouItemCopyWithImpl;
@useResult
$Res call({
 String likeId, DateTime likedAt, bool isLocked,@JsonKey(unknownEnumValue: EImageState.none) EImageState imageState, String? imageUrl, String? uid, String? firstName, int? age,@JsonKey(unknownEnumValue: JsonKey.nullForUndefinedEnumValue) ESpecialization? specialization,@JsonKey(unknownEnumValue: JsonKey.nullForUndefinedEnumValue) EExperience? experience, List<Skill> skills
});




}
/// @nodoc
class _$LikedYouItemCopyWithImpl<$Res>
    implements $LikedYouItemCopyWith<$Res> {
  _$LikedYouItemCopyWithImpl(this._self, this._then);

  final LikedYouItem _self;
  final $Res Function(LikedYouItem) _then;

/// Create a copy of LikedYouItem
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? likeId = null,Object? likedAt = null,Object? isLocked = null,Object? imageState = null,Object? imageUrl = freezed,Object? uid = freezed,Object? firstName = freezed,Object? age = freezed,Object? specialization = freezed,Object? experience = freezed,Object? skills = null,}) {
  return _then(_self.copyWith(
likeId: null == likeId ? _self.likeId : likeId // ignore: cast_nullable_to_non_nullable
as String,likedAt: null == likedAt ? _self.likedAt : likedAt // ignore: cast_nullable_to_non_nullable
as DateTime,isLocked: null == isLocked ? _self.isLocked : isLocked // ignore: cast_nullable_to_non_nullable
as bool,imageState: null == imageState ? _self.imageState : imageState // ignore: cast_nullable_to_non_nullable
as EImageState,imageUrl: freezed == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String?,uid: freezed == uid ? _self.uid : uid // ignore: cast_nullable_to_non_nullable
as String?,firstName: freezed == firstName ? _self.firstName : firstName // ignore: cast_nullable_to_non_nullable
as String?,age: freezed == age ? _self.age : age // ignore: cast_nullable_to_non_nullable
as int?,specialization: freezed == specialization ? _self.specialization : specialization // ignore: cast_nullable_to_non_nullable
as ESpecialization?,experience: freezed == experience ? _self.experience : experience // ignore: cast_nullable_to_non_nullable
as EExperience?,skills: null == skills ? _self.skills : skills // ignore: cast_nullable_to_non_nullable
as List<Skill>,
  ));
}

}


/// Adds pattern-matching-related methods to [LikedYouItem].
extension LikedYouItemPatterns on LikedYouItem {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _LikedYouItem value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LikedYouItem() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _LikedYouItem value)  $default,){
final _that = this;
switch (_that) {
case _LikedYouItem():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _LikedYouItem value)?  $default,){
final _that = this;
switch (_that) {
case _LikedYouItem() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String likeId,  DateTime likedAt,  bool isLocked, @JsonKey(unknownEnumValue: EImageState.none)  EImageState imageState,  String? imageUrl,  String? uid,  String? firstName,  int? age, @JsonKey(unknownEnumValue: JsonKey.nullForUndefinedEnumValue)  ESpecialization? specialization, @JsonKey(unknownEnumValue: JsonKey.nullForUndefinedEnumValue)  EExperience? experience,  List<Skill> skills)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LikedYouItem() when $default != null:
return $default(_that.likeId,_that.likedAt,_that.isLocked,_that.imageState,_that.imageUrl,_that.uid,_that.firstName,_that.age,_that.specialization,_that.experience,_that.skills);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String likeId,  DateTime likedAt,  bool isLocked, @JsonKey(unknownEnumValue: EImageState.none)  EImageState imageState,  String? imageUrl,  String? uid,  String? firstName,  int? age, @JsonKey(unknownEnumValue: JsonKey.nullForUndefinedEnumValue)  ESpecialization? specialization, @JsonKey(unknownEnumValue: JsonKey.nullForUndefinedEnumValue)  EExperience? experience,  List<Skill> skills)  $default,) {final _that = this;
switch (_that) {
case _LikedYouItem():
return $default(_that.likeId,_that.likedAt,_that.isLocked,_that.imageState,_that.imageUrl,_that.uid,_that.firstName,_that.age,_that.specialization,_that.experience,_that.skills);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String likeId,  DateTime likedAt,  bool isLocked, @JsonKey(unknownEnumValue: EImageState.none)  EImageState imageState,  String? imageUrl,  String? uid,  String? firstName,  int? age, @JsonKey(unknownEnumValue: JsonKey.nullForUndefinedEnumValue)  ESpecialization? specialization, @JsonKey(unknownEnumValue: JsonKey.nullForUndefinedEnumValue)  EExperience? experience,  List<Skill> skills)?  $default,) {final _that = this;
switch (_that) {
case _LikedYouItem() when $default != null:
return $default(_that.likeId,_that.likedAt,_that.isLocked,_that.imageState,_that.imageUrl,_that.uid,_that.firstName,_that.age,_that.specialization,_that.experience,_that.skills);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(anyMap: true)
class _LikedYouItem implements LikedYouItem {
  const _LikedYouItem({required this.likeId, required this.likedAt, required this.isLocked, @JsonKey(unknownEnumValue: EImageState.none) this.imageState = EImageState.none, this.imageUrl, this.uid, this.firstName, this.age, @JsonKey(unknownEnumValue: JsonKey.nullForUndefinedEnumValue) this.specialization, @JsonKey(unknownEnumValue: JsonKey.nullForUndefinedEnumValue) this.experience, final  List<Skill> skills = const <Skill>[]}): _skills = skills;
  factory _LikedYouItem.fromJson(Map<String, dynamic> json) => _$LikedYouItemFromJson(json);

@override final  String likeId;
@override final  DateTime likedAt;
@override final  bool isLocked;
@override@JsonKey(unknownEnumValue: EImageState.none) final  EImageState imageState;
@override final  String? imageUrl;
@override final  String? uid;
@override final  String? firstName;
@override final  int? age;
@override@JsonKey(unknownEnumValue: JsonKey.nullForUndefinedEnumValue) final  ESpecialization? specialization;
@override@JsonKey(unknownEnumValue: JsonKey.nullForUndefinedEnumValue) final  EExperience? experience;
 final  List<Skill> _skills;
@override@JsonKey() List<Skill> get skills {
  if (_skills is EqualUnmodifiableListView) return _skills;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_skills);
}


/// Create a copy of LikedYouItem
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LikedYouItemCopyWith<_LikedYouItem> get copyWith => __$LikedYouItemCopyWithImpl<_LikedYouItem>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$LikedYouItemToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LikedYouItem&&(identical(other.likeId, likeId) || other.likeId == likeId)&&(identical(other.likedAt, likedAt) || other.likedAt == likedAt)&&(identical(other.isLocked, isLocked) || other.isLocked == isLocked)&&(identical(other.imageState, imageState) || other.imageState == imageState)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.uid, uid) || other.uid == uid)&&(identical(other.firstName, firstName) || other.firstName == firstName)&&(identical(other.age, age) || other.age == age)&&(identical(other.specialization, specialization) || other.specialization == specialization)&&(identical(other.experience, experience) || other.experience == experience)&&const DeepCollectionEquality().equals(other._skills, _skills));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,likeId,likedAt,isLocked,imageState,imageUrl,uid,firstName,age,specialization,experience,const DeepCollectionEquality().hash(_skills));

@override
String toString() {
  return 'LikedYouItem(likeId: $likeId, likedAt: $likedAt, isLocked: $isLocked, imageState: $imageState, imageUrl: $imageUrl, uid: $uid, firstName: $firstName, age: $age, specialization: $specialization, experience: $experience, skills: $skills)';
}


}

/// @nodoc
abstract mixin class _$LikedYouItemCopyWith<$Res> implements $LikedYouItemCopyWith<$Res> {
  factory _$LikedYouItemCopyWith(_LikedYouItem value, $Res Function(_LikedYouItem) _then) = __$LikedYouItemCopyWithImpl;
@override @useResult
$Res call({
 String likeId, DateTime likedAt, bool isLocked,@JsonKey(unknownEnumValue: EImageState.none) EImageState imageState, String? imageUrl, String? uid, String? firstName, int? age,@JsonKey(unknownEnumValue: JsonKey.nullForUndefinedEnumValue) ESpecialization? specialization,@JsonKey(unknownEnumValue: JsonKey.nullForUndefinedEnumValue) EExperience? experience, List<Skill> skills
});




}
/// @nodoc
class __$LikedYouItemCopyWithImpl<$Res>
    implements _$LikedYouItemCopyWith<$Res> {
  __$LikedYouItemCopyWithImpl(this._self, this._then);

  final _LikedYouItem _self;
  final $Res Function(_LikedYouItem) _then;

/// Create a copy of LikedYouItem
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? likeId = null,Object? likedAt = null,Object? isLocked = null,Object? imageState = null,Object? imageUrl = freezed,Object? uid = freezed,Object? firstName = freezed,Object? age = freezed,Object? specialization = freezed,Object? experience = freezed,Object? skills = null,}) {
  return _then(_LikedYouItem(
likeId: null == likeId ? _self.likeId : likeId // ignore: cast_nullable_to_non_nullable
as String,likedAt: null == likedAt ? _self.likedAt : likedAt // ignore: cast_nullable_to_non_nullable
as DateTime,isLocked: null == isLocked ? _self.isLocked : isLocked // ignore: cast_nullable_to_non_nullable
as bool,imageState: null == imageState ? _self.imageState : imageState // ignore: cast_nullable_to_non_nullable
as EImageState,imageUrl: freezed == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String?,uid: freezed == uid ? _self.uid : uid // ignore: cast_nullable_to_non_nullable
as String?,firstName: freezed == firstName ? _self.firstName : firstName // ignore: cast_nullable_to_non_nullable
as String?,age: freezed == age ? _self.age : age // ignore: cast_nullable_to_non_nullable
as int?,specialization: freezed == specialization ? _self.specialization : specialization // ignore: cast_nullable_to_non_nullable
as ESpecialization?,experience: freezed == experience ? _self.experience : experience // ignore: cast_nullable_to_non_nullable
as EExperience?,skills: null == skills ? _self._skills : skills // ignore: cast_nullable_to_non_nullable
as List<Skill>,
  ));
}


}

// dart format on
