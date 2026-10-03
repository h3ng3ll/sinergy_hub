// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'edit_experience_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$EditExperienceEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is EditExperienceEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'EditExperienceEvent()';
}


}

/// @nodoc
class $EditExperienceEventCopyWith<$Res>  {
$EditExperienceEventCopyWith(EditExperienceEvent _, $Res Function(EditExperienceEvent) __);
}


/// Adds pattern-matching-related methods to [EditExperienceEvent].
extension EditExperienceEventPatterns on EditExperienceEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Init value)?  init,TResult Function( _Select value)?  select,TResult Function( _Save value)?  save,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Init() when init != null:
return init(_that);case _Select() when select != null:
return select(_that);case _Save() when save != null:
return save(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Init value)  init,required TResult Function( _Select value)  select,required TResult Function( _Save value)  save,}){
final _that = this;
switch (_that) {
case _Init():
return init(_that);case _Select():
return select(_that);case _Save():
return save(_that);case _:
  throw StateError('Unexpected subclass');

}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Init value)?  init,TResult? Function( _Select value)?  select,TResult? Function( _Save value)?  save,}){
final _that = this;
switch (_that) {
case _Init() when init != null:
return init(_that);case _Select() when select != null:
return select(_that);case _Save() when save != null:
return save(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  init,TResult Function( EExperience experience)?  select,TResult Function()?  save,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Init() when init != null:
return init();case _Select() when select != null:
return select(_that.experience);case _Save() when save != null:
return save();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  init,required TResult Function( EExperience experience)  select,required TResult Function()  save,}) {final _that = this;
switch (_that) {
case _Init():
return init();case _Select():
return select(_that.experience);case _Save():
return save();case _:
  throw StateError('Unexpected subclass');

}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  init,TResult? Function( EExperience experience)?  select,TResult? Function()?  save,}) {final _that = this;
switch (_that) {
case _Init() when init != null:
return init();case _Select() when select != null:
return select(_that.experience);case _Save() when save != null:
return save();case _:
  return null;

}
}

}

/// @nodoc


class _Init implements EditExperienceEvent {
  const _Init();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Init);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'EditExperienceEvent.init()';
}


}




/// @nodoc


class _Select implements EditExperienceEvent {
  const _Select({required this.experience});
  

 final  EExperience experience;

/// Create a copy of EditExperienceEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SelectCopyWith<_Select> get copyWith => __$SelectCopyWithImpl<_Select>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Select&&(identical(other.experience, experience) || other.experience == experience));
}


@override
int get hashCode => Object.hash(runtimeType,experience);

@override
String toString() {
  return 'EditExperienceEvent.select(experience: $experience)';
}


}

/// @nodoc
abstract mixin class _$SelectCopyWith<$Res> implements $EditExperienceEventCopyWith<$Res> {
  factory _$SelectCopyWith(_Select value, $Res Function(_Select) _then) = __$SelectCopyWithImpl;
@useResult
$Res call({
 EExperience experience
});




}
/// @nodoc
class __$SelectCopyWithImpl<$Res>
    implements _$SelectCopyWith<$Res> {
  __$SelectCopyWithImpl(this._self, this._then);

  final _Select _self;
  final $Res Function(_Select) _then;

/// Create a copy of EditExperienceEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? experience = null,}) {
  return _then(_Select(
experience: null == experience ? _self.experience : experience // ignore: cast_nullable_to_non_nullable
as EExperience,
  ));
}


}

/// @nodoc


class _Save implements EditExperienceEvent {
  const _Save();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Save);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'EditExperienceEvent.save()';
}


}




/// @nodoc
mixin _$EditExperienceState {

 EEditExperienceStatus get status; UserData? get userData; EExperience? get selectedExperience; String get errorMessage;
/// Create a copy of EditExperienceState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$EditExperienceStateCopyWith<EditExperienceState> get copyWith => _$EditExperienceStateCopyWithImpl<EditExperienceState>(this as EditExperienceState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is EditExperienceState&&(identical(other.status, status) || other.status == status)&&(identical(other.userData, userData) || other.userData == userData)&&(identical(other.selectedExperience, selectedExperience) || other.selectedExperience == selectedExperience)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,status,userData,selectedExperience,errorMessage);

@override
String toString() {
  return 'EditExperienceState(status: $status, userData: $userData, selectedExperience: $selectedExperience, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class $EditExperienceStateCopyWith<$Res>  {
  factory $EditExperienceStateCopyWith(EditExperienceState value, $Res Function(EditExperienceState) _then) = _$EditExperienceStateCopyWithImpl;
@useResult
$Res call({
 EEditExperienceStatus status, UserData? userData, EExperience? selectedExperience, String errorMessage
});


$UserDataCopyWith<$Res>? get userData;

}
/// @nodoc
class _$EditExperienceStateCopyWithImpl<$Res>
    implements $EditExperienceStateCopyWith<$Res> {
  _$EditExperienceStateCopyWithImpl(this._self, this._then);

  final EditExperienceState _self;
  final $Res Function(EditExperienceState) _then;

/// Create a copy of EditExperienceState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = null,Object? userData = freezed,Object? selectedExperience = freezed,Object? errorMessage = null,}) {
  return _then(_self.copyWith(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as EEditExperienceStatus,userData: freezed == userData ? _self.userData : userData // ignore: cast_nullable_to_non_nullable
as UserData?,selectedExperience: freezed == selectedExperience ? _self.selectedExperience : selectedExperience // ignore: cast_nullable_to_non_nullable
as EExperience?,errorMessage: null == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String,
  ));
}
/// Create a copy of EditExperienceState
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


/// Adds pattern-matching-related methods to [EditExperienceState].
extension EditExperienceStatePatterns on EditExperienceState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _EditExperienceState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _EditExperienceState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _EditExperienceState value)  $default,){
final _that = this;
switch (_that) {
case _EditExperienceState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _EditExperienceState value)?  $default,){
final _that = this;
switch (_that) {
case _EditExperienceState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( EEditExperienceStatus status,  UserData? userData,  EExperience? selectedExperience,  String errorMessage)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _EditExperienceState() when $default != null:
return $default(_that.status,_that.userData,_that.selectedExperience,_that.errorMessage);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( EEditExperienceStatus status,  UserData? userData,  EExperience? selectedExperience,  String errorMessage)  $default,) {final _that = this;
switch (_that) {
case _EditExperienceState():
return $default(_that.status,_that.userData,_that.selectedExperience,_that.errorMessage);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( EEditExperienceStatus status,  UserData? userData,  EExperience? selectedExperience,  String errorMessage)?  $default,) {final _that = this;
switch (_that) {
case _EditExperienceState() when $default != null:
return $default(_that.status,_that.userData,_that.selectedExperience,_that.errorMessage);case _:
  return null;

}
}

}

/// @nodoc


class _EditExperienceState implements EditExperienceState {
  const _EditExperienceState({this.status = EEditExperienceStatus.initial, this.userData, this.selectedExperience, this.errorMessage = ''});
  

@override@JsonKey() final  EEditExperienceStatus status;
@override final  UserData? userData;
@override final  EExperience? selectedExperience;
@override@JsonKey() final  String errorMessage;

/// Create a copy of EditExperienceState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$EditExperienceStateCopyWith<_EditExperienceState> get copyWith => __$EditExperienceStateCopyWithImpl<_EditExperienceState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _EditExperienceState&&(identical(other.status, status) || other.status == status)&&(identical(other.userData, userData) || other.userData == userData)&&(identical(other.selectedExperience, selectedExperience) || other.selectedExperience == selectedExperience)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,status,userData,selectedExperience,errorMessage);

@override
String toString() {
  return 'EditExperienceState(status: $status, userData: $userData, selectedExperience: $selectedExperience, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class _$EditExperienceStateCopyWith<$Res> implements $EditExperienceStateCopyWith<$Res> {
  factory _$EditExperienceStateCopyWith(_EditExperienceState value, $Res Function(_EditExperienceState) _then) = __$EditExperienceStateCopyWithImpl;
@override @useResult
$Res call({
 EEditExperienceStatus status, UserData? userData, EExperience? selectedExperience, String errorMessage
});


@override $UserDataCopyWith<$Res>? get userData;

}
/// @nodoc
class __$EditExperienceStateCopyWithImpl<$Res>
    implements _$EditExperienceStateCopyWith<$Res> {
  __$EditExperienceStateCopyWithImpl(this._self, this._then);

  final _EditExperienceState _self;
  final $Res Function(_EditExperienceState) _then;

/// Create a copy of EditExperienceState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = null,Object? userData = freezed,Object? selectedExperience = freezed,Object? errorMessage = null,}) {
  return _then(_EditExperienceState(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as EEditExperienceStatus,userData: freezed == userData ? _self.userData : userData // ignore: cast_nullable_to_non_nullable
as UserData?,selectedExperience: freezed == selectedExperience ? _self.selectedExperience : selectedExperience // ignore: cast_nullable_to_non_nullable
as EExperience?,errorMessage: null == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

/// Create a copy of EditExperienceState
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
