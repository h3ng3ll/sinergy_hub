// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'edit_profile_page_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$EditProfilePageEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is EditProfilePageEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'EditProfilePageEvent()';
}


}

/// @nodoc
class $EditProfilePageEventCopyWith<$Res>  {
$EditProfilePageEventCopyWith(EditProfilePageEvent _, $Res Function(EditProfilePageEvent) __);
}


/// Adds pattern-matching-related methods to [EditProfilePageEvent].
extension EditProfilePageEventPatterns on EditProfilePageEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _AddSkill value)?  addSkill,TResult Function( _Initialize value)?  initialize,TResult Function( _RemoveSkill value)?  removeSkill,TResult Function( _ApplyChanges value)?  applyChanges,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AddSkill() when addSkill != null:
return addSkill(_that);case _Initialize() when initialize != null:
return initialize(_that);case _RemoveSkill() when removeSkill != null:
return removeSkill(_that);case _ApplyChanges() when applyChanges != null:
return applyChanges(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _AddSkill value)  addSkill,required TResult Function( _Initialize value)  initialize,required TResult Function( _RemoveSkill value)  removeSkill,required TResult Function( _ApplyChanges value)  applyChanges,}){
final _that = this;
switch (_that) {
case _AddSkill():
return addSkill(_that);case _Initialize():
return initialize(_that);case _RemoveSkill():
return removeSkill(_that);case _ApplyChanges():
return applyChanges(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _AddSkill value)?  addSkill,TResult? Function( _Initialize value)?  initialize,TResult? Function( _RemoveSkill value)?  removeSkill,TResult? Function( _ApplyChanges value)?  applyChanges,}){
final _that = this;
switch (_that) {
case _AddSkill() when addSkill != null:
return addSkill(_that);case _Initialize() when initialize != null:
return initialize(_that);case _RemoveSkill() when removeSkill != null:
return removeSkill(_that);case _ApplyChanges() when applyChanges != null:
return applyChanges(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String name)?  addSkill,TResult Function()?  initialize,TResult Function( Skill skill)?  removeSkill,TResult Function( String? firstName,  String? lastName,  String? aboutMe,  Uint8List? img)?  applyChanges,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AddSkill() when addSkill != null:
return addSkill(_that.name);case _Initialize() when initialize != null:
return initialize();case _RemoveSkill() when removeSkill != null:
return removeSkill(_that.skill);case _ApplyChanges() when applyChanges != null:
return applyChanges(_that.firstName,_that.lastName,_that.aboutMe,_that.img);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String name)  addSkill,required TResult Function()  initialize,required TResult Function( Skill skill)  removeSkill,required TResult Function( String? firstName,  String? lastName,  String? aboutMe,  Uint8List? img)  applyChanges,}) {final _that = this;
switch (_that) {
case _AddSkill():
return addSkill(_that.name);case _Initialize():
return initialize();case _RemoveSkill():
return removeSkill(_that.skill);case _ApplyChanges():
return applyChanges(_that.firstName,_that.lastName,_that.aboutMe,_that.img);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String name)?  addSkill,TResult? Function()?  initialize,TResult? Function( Skill skill)?  removeSkill,TResult? Function( String? firstName,  String? lastName,  String? aboutMe,  Uint8List? img)?  applyChanges,}) {final _that = this;
switch (_that) {
case _AddSkill() when addSkill != null:
return addSkill(_that.name);case _Initialize() when initialize != null:
return initialize();case _RemoveSkill() when removeSkill != null:
return removeSkill(_that.skill);case _ApplyChanges() when applyChanges != null:
return applyChanges(_that.firstName,_that.lastName,_that.aboutMe,_that.img);case _:
  return null;

}
}

}

/// @nodoc


class _AddSkill implements EditProfilePageEvent {
  const _AddSkill({required this.name});
  

 final  String name;

/// Create a copy of EditProfilePageEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AddSkillCopyWith<_AddSkill> get copyWith => __$AddSkillCopyWithImpl<_AddSkill>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AddSkill&&(identical(other.name, name) || other.name == name));
}


@override
int get hashCode => Object.hash(runtimeType,name);

@override
String toString() {
  return 'EditProfilePageEvent.addSkill(name: $name)';
}


}

/// @nodoc
abstract mixin class _$AddSkillCopyWith<$Res> implements $EditProfilePageEventCopyWith<$Res> {
  factory _$AddSkillCopyWith(_AddSkill value, $Res Function(_AddSkill) _then) = __$AddSkillCopyWithImpl;
@useResult
$Res call({
 String name
});




}
/// @nodoc
class __$AddSkillCopyWithImpl<$Res>
    implements _$AddSkillCopyWith<$Res> {
  __$AddSkillCopyWithImpl(this._self, this._then);

  final _AddSkill _self;
  final $Res Function(_AddSkill) _then;

/// Create a copy of EditProfilePageEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? name = null,}) {
  return _then(_AddSkill(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _Initialize implements EditProfilePageEvent {
  const _Initialize();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Initialize);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'EditProfilePageEvent.initialize()';
}


}




/// @nodoc


class _RemoveSkill implements EditProfilePageEvent {
  const _RemoveSkill({required this.skill});
  

 final  Skill skill;

/// Create a copy of EditProfilePageEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RemoveSkillCopyWith<_RemoveSkill> get copyWith => __$RemoveSkillCopyWithImpl<_RemoveSkill>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RemoveSkill&&(identical(other.skill, skill) || other.skill == skill));
}


@override
int get hashCode => Object.hash(runtimeType,skill);

@override
String toString() {
  return 'EditProfilePageEvent.removeSkill(skill: $skill)';
}


}

/// @nodoc
abstract mixin class _$RemoveSkillCopyWith<$Res> implements $EditProfilePageEventCopyWith<$Res> {
  factory _$RemoveSkillCopyWith(_RemoveSkill value, $Res Function(_RemoveSkill) _then) = __$RemoveSkillCopyWithImpl;
@useResult
$Res call({
 Skill skill
});


$SkillCopyWith<$Res> get skill;

}
/// @nodoc
class __$RemoveSkillCopyWithImpl<$Res>
    implements _$RemoveSkillCopyWith<$Res> {
  __$RemoveSkillCopyWithImpl(this._self, this._then);

  final _RemoveSkill _self;
  final $Res Function(_RemoveSkill) _then;

/// Create a copy of EditProfilePageEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? skill = null,}) {
  return _then(_RemoveSkill(
skill: null == skill ? _self.skill : skill // ignore: cast_nullable_to_non_nullable
as Skill,
  ));
}

/// Create a copy of EditProfilePageEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SkillCopyWith<$Res> get skill {
  
  return $SkillCopyWith<$Res>(_self.skill, (value) {
    return _then(_self.copyWith(skill: value));
  });
}
}

/// @nodoc


class _ApplyChanges implements EditProfilePageEvent {
  const _ApplyChanges({this.firstName, this.lastName, this.aboutMe, this.img});
  

 final  String? firstName;
 final  String? lastName;
 final  String? aboutMe;
 final  Uint8List? img;

/// Create a copy of EditProfilePageEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ApplyChangesCopyWith<_ApplyChanges> get copyWith => __$ApplyChangesCopyWithImpl<_ApplyChanges>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ApplyChanges&&(identical(other.firstName, firstName) || other.firstName == firstName)&&(identical(other.lastName, lastName) || other.lastName == lastName)&&(identical(other.aboutMe, aboutMe) || other.aboutMe == aboutMe)&&const DeepCollectionEquality().equals(other.img, img));
}


@override
int get hashCode => Object.hash(runtimeType,firstName,lastName,aboutMe,const DeepCollectionEquality().hash(img));

@override
String toString() {
  return 'EditProfilePageEvent.applyChanges(firstName: $firstName, lastName: $lastName, aboutMe: $aboutMe, img: $img)';
}


}

/// @nodoc
abstract mixin class _$ApplyChangesCopyWith<$Res> implements $EditProfilePageEventCopyWith<$Res> {
  factory _$ApplyChangesCopyWith(_ApplyChanges value, $Res Function(_ApplyChanges) _then) = __$ApplyChangesCopyWithImpl;
@useResult
$Res call({
 String? firstName, String? lastName, String? aboutMe, Uint8List? img
});




}
/// @nodoc
class __$ApplyChangesCopyWithImpl<$Res>
    implements _$ApplyChangesCopyWith<$Res> {
  __$ApplyChangesCopyWithImpl(this._self, this._then);

  final _ApplyChanges _self;
  final $Res Function(_ApplyChanges) _then;

/// Create a copy of EditProfilePageEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? firstName = freezed,Object? lastName = freezed,Object? aboutMe = freezed,Object? img = freezed,}) {
  return _then(_ApplyChanges(
firstName: freezed == firstName ? _self.firstName : firstName // ignore: cast_nullable_to_non_nullable
as String?,lastName: freezed == lastName ? _self.lastName : lastName // ignore: cast_nullable_to_non_nullable
as String?,aboutMe: freezed == aboutMe ? _self.aboutMe : aboutMe // ignore: cast_nullable_to_non_nullable
as String?,img: freezed == img ? _self.img : img // ignore: cast_nullable_to_non_nullable
as Uint8List?,
  ));
}


}

/// @nodoc
mixin _$EditProfilePageState {

 EditProfilePageStatus get status; List<Skill> get skills; UserData? get userData; List<String> get availableSkills; dynamic get errorMessage;
/// Create a copy of EditProfilePageState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$EditProfilePageStateCopyWith<EditProfilePageState> get copyWith => _$EditProfilePageStateCopyWithImpl<EditProfilePageState>(this as EditProfilePageState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is EditProfilePageState&&(identical(other.status, status) || other.status == status)&&const DeepCollectionEquality().equals(other.skills, skills)&&(identical(other.userData, userData) || other.userData == userData)&&const DeepCollectionEquality().equals(other.availableSkills, availableSkills)&&const DeepCollectionEquality().equals(other.errorMessage, errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,status,const DeepCollectionEquality().hash(skills),userData,const DeepCollectionEquality().hash(availableSkills),const DeepCollectionEquality().hash(errorMessage));

@override
String toString() {
  return 'EditProfilePageState(status: $status, skills: $skills, userData: $userData, availableSkills: $availableSkills, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class $EditProfilePageStateCopyWith<$Res>  {
  factory $EditProfilePageStateCopyWith(EditProfilePageState value, $Res Function(EditProfilePageState) _then) = _$EditProfilePageStateCopyWithImpl;
@useResult
$Res call({
 EditProfilePageStatus status, List<Skill> skills, UserData? userData, List<String> availableSkills, dynamic errorMessage
});


$UserDataCopyWith<$Res>? get userData;

}
/// @nodoc
class _$EditProfilePageStateCopyWithImpl<$Res>
    implements $EditProfilePageStateCopyWith<$Res> {
  _$EditProfilePageStateCopyWithImpl(this._self, this._then);

  final EditProfilePageState _self;
  final $Res Function(EditProfilePageState) _then;

/// Create a copy of EditProfilePageState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = null,Object? skills = null,Object? userData = freezed,Object? availableSkills = null,Object? errorMessage = freezed,}) {
  return _then(_self.copyWith(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as EditProfilePageStatus,skills: null == skills ? _self.skills : skills // ignore: cast_nullable_to_non_nullable
as List<Skill>,userData: freezed == userData ? _self.userData : userData // ignore: cast_nullable_to_non_nullable
as UserData?,availableSkills: null == availableSkills ? _self.availableSkills : availableSkills // ignore: cast_nullable_to_non_nullable
as List<String>,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as dynamic,
  ));
}
/// Create a copy of EditProfilePageState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserDataCopyWith<$Res>? get userData {
    if (_self.userData == null) {
    return null;
  }

  return $UserDataCopyWith<$Res>(_self.userData!, (value) {
    return _then(_self.copyWith(userData: value));
  });
}
}


/// Adds pattern-matching-related methods to [EditProfilePageState].
extension EditProfilePageStatePatterns on EditProfilePageState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _EditProfilePageState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _EditProfilePageState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _EditProfilePageState value)  $default,){
final _that = this;
switch (_that) {
case _EditProfilePageState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _EditProfilePageState value)?  $default,){
final _that = this;
switch (_that) {
case _EditProfilePageState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( EditProfilePageStatus status,  List<Skill> skills,  UserData? userData,  List<String> availableSkills,  dynamic errorMessage)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _EditProfilePageState() when $default != null:
return $default(_that.status,_that.skills,_that.userData,_that.availableSkills,_that.errorMessage);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( EditProfilePageStatus status,  List<Skill> skills,  UserData? userData,  List<String> availableSkills,  dynamic errorMessage)  $default,) {final _that = this;
switch (_that) {
case _EditProfilePageState():
return $default(_that.status,_that.skills,_that.userData,_that.availableSkills,_that.errorMessage);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( EditProfilePageStatus status,  List<Skill> skills,  UserData? userData,  List<String> availableSkills,  dynamic errorMessage)?  $default,) {final _that = this;
switch (_that) {
case _EditProfilePageState() when $default != null:
return $default(_that.status,_that.skills,_that.userData,_that.availableSkills,_that.errorMessage);case _:
  return null;

}
}

}

/// @nodoc


class _EditProfilePageState implements EditProfilePageState {
  const _EditProfilePageState({this.status = EditProfilePageStatus.initial, final  List<Skill> skills = const [], this.userData, final  List<String> availableSkills = const [], this.errorMessage = ''}): _skills = skills,_availableSkills = availableSkills;
  

@override@JsonKey() final  EditProfilePageStatus status;
 final  List<Skill> _skills;
@override@JsonKey() List<Skill> get skills {
  if (_skills is EqualUnmodifiableListView) return _skills;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_skills);
}

@override final  UserData? userData;
 final  List<String> _availableSkills;
@override@JsonKey() List<String> get availableSkills {
  if (_availableSkills is EqualUnmodifiableListView) return _availableSkills;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_availableSkills);
}

@override@JsonKey() final  dynamic errorMessage;

/// Create a copy of EditProfilePageState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$EditProfilePageStateCopyWith<_EditProfilePageState> get copyWith => __$EditProfilePageStateCopyWithImpl<_EditProfilePageState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _EditProfilePageState&&(identical(other.status, status) || other.status == status)&&const DeepCollectionEquality().equals(other._skills, _skills)&&(identical(other.userData, userData) || other.userData == userData)&&const DeepCollectionEquality().equals(other._availableSkills, _availableSkills)&&const DeepCollectionEquality().equals(other.errorMessage, errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,status,const DeepCollectionEquality().hash(_skills),userData,const DeepCollectionEquality().hash(_availableSkills),const DeepCollectionEquality().hash(errorMessage));

@override
String toString() {
  return 'EditProfilePageState(status: $status, skills: $skills, userData: $userData, availableSkills: $availableSkills, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class _$EditProfilePageStateCopyWith<$Res> implements $EditProfilePageStateCopyWith<$Res> {
  factory _$EditProfilePageStateCopyWith(_EditProfilePageState value, $Res Function(_EditProfilePageState) _then) = __$EditProfilePageStateCopyWithImpl;
@override @useResult
$Res call({
 EditProfilePageStatus status, List<Skill> skills, UserData? userData, List<String> availableSkills, dynamic errorMessage
});


@override $UserDataCopyWith<$Res>? get userData;

}
/// @nodoc
class __$EditProfilePageStateCopyWithImpl<$Res>
    implements _$EditProfilePageStateCopyWith<$Res> {
  __$EditProfilePageStateCopyWithImpl(this._self, this._then);

  final _EditProfilePageState _self;
  final $Res Function(_EditProfilePageState) _then;

/// Create a copy of EditProfilePageState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = null,Object? skills = null,Object? userData = freezed,Object? availableSkills = null,Object? errorMessage = freezed,}) {
  return _then(_EditProfilePageState(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as EditProfilePageStatus,skills: null == skills ? _self._skills : skills // ignore: cast_nullable_to_non_nullable
as List<Skill>,userData: freezed == userData ? _self.userData : userData // ignore: cast_nullable_to_non_nullable
as UserData?,availableSkills: null == availableSkills ? _self._availableSkills : availableSkills // ignore: cast_nullable_to_non_nullable
as List<String>,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as dynamic,
  ));
}

/// Create a copy of EditProfilePageState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserDataCopyWith<$Res>? get userData {
    if (_self.userData == null) {
    return null;
  }

  return $UserDataCopyWith<$Res>(_self.userData!, (value) {
    return _then(_self.copyWith(userData: value));
  });
}
}

// dart format on
