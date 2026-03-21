// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'edit_looking_for_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$EditLookingForEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is EditLookingForEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'EditLookingForEvent()';
}


}

/// @nodoc
class $EditLookingForEventCopyWith<$Res>  {
$EditLookingForEventCopyWith(EditLookingForEvent _, $Res Function(EditLookingForEvent) __);
}


/// Adds pattern-matching-related methods to [EditLookingForEvent].
extension EditLookingForEventPatterns on EditLookingForEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Init value)?  init,TResult Function( _ToggleSpecialization value)?  toggleSpecialization,TResult Function( _Save value)?  save,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Init() when init != null:
return init(_that);case _ToggleSpecialization() when toggleSpecialization != null:
return toggleSpecialization(_that);case _Save() when save != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Init value)  init,required TResult Function( _ToggleSpecialization value)  toggleSpecialization,required TResult Function( _Save value)  save,}){
final _that = this;
switch (_that) {
case _Init():
return init(_that);case _ToggleSpecialization():
return toggleSpecialization(_that);case _Save():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Init value)?  init,TResult? Function( _ToggleSpecialization value)?  toggleSpecialization,TResult? Function( _Save value)?  save,}){
final _that = this;
switch (_that) {
case _Init() when init != null:
return init(_that);case _ToggleSpecialization() when toggleSpecialization != null:
return toggleSpecialization(_that);case _Save() when save != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  init,TResult Function( ESpecialization specialization)?  toggleSpecialization,TResult Function()?  save,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Init() when init != null:
return init();case _ToggleSpecialization() when toggleSpecialization != null:
return toggleSpecialization(_that.specialization);case _Save() when save != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  init,required TResult Function( ESpecialization specialization)  toggleSpecialization,required TResult Function()  save,}) {final _that = this;
switch (_that) {
case _Init():
return init();case _ToggleSpecialization():
return toggleSpecialization(_that.specialization);case _Save():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  init,TResult? Function( ESpecialization specialization)?  toggleSpecialization,TResult? Function()?  save,}) {final _that = this;
switch (_that) {
case _Init() when init != null:
return init();case _ToggleSpecialization() when toggleSpecialization != null:
return toggleSpecialization(_that.specialization);case _Save() when save != null:
return save();case _:
  return null;

}
}

}

/// @nodoc


class _Init implements EditLookingForEvent {
  const _Init();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Init);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'EditLookingForEvent.init()';
}


}




/// @nodoc


class _ToggleSpecialization implements EditLookingForEvent {
  const _ToggleSpecialization({required this.specialization});
  

 final  ESpecialization specialization;

/// Create a copy of EditLookingForEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ToggleSpecializationCopyWith<_ToggleSpecialization> get copyWith => __$ToggleSpecializationCopyWithImpl<_ToggleSpecialization>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ToggleSpecialization&&(identical(other.specialization, specialization) || other.specialization == specialization));
}


@override
int get hashCode => Object.hash(runtimeType,specialization);

@override
String toString() {
  return 'EditLookingForEvent.toggleSpecialization(specialization: $specialization)';
}


}

/// @nodoc
abstract mixin class _$ToggleSpecializationCopyWith<$Res> implements $EditLookingForEventCopyWith<$Res> {
  factory _$ToggleSpecializationCopyWith(_ToggleSpecialization value, $Res Function(_ToggleSpecialization) _then) = __$ToggleSpecializationCopyWithImpl;
@useResult
$Res call({
 ESpecialization specialization
});




}
/// @nodoc
class __$ToggleSpecializationCopyWithImpl<$Res>
    implements _$ToggleSpecializationCopyWith<$Res> {
  __$ToggleSpecializationCopyWithImpl(this._self, this._then);

  final _ToggleSpecialization _self;
  final $Res Function(_ToggleSpecialization) _then;

/// Create a copy of EditLookingForEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? specialization = null,}) {
  return _then(_ToggleSpecialization(
specialization: null == specialization ? _self.specialization : specialization // ignore: cast_nullable_to_non_nullable
as ESpecialization,
  ));
}


}

/// @nodoc


class _Save implements EditLookingForEvent {
  const _Save();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Save);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'EditLookingForEvent.save()';
}


}




/// @nodoc
mixin _$EditLookingForState {

 EditLookingForStatus get status; UserData? get userData; List<ESpecialization> get selectedSpecializations; String get errorMessage;
/// Create a copy of EditLookingForState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$EditLookingForStateCopyWith<EditLookingForState> get copyWith => _$EditLookingForStateCopyWithImpl<EditLookingForState>(this as EditLookingForState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is EditLookingForState&&(identical(other.status, status) || other.status == status)&&(identical(other.userData, userData) || other.userData == userData)&&const DeepCollectionEquality().equals(other.selectedSpecializations, selectedSpecializations)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,status,userData,const DeepCollectionEquality().hash(selectedSpecializations),errorMessage);

@override
String toString() {
  return 'EditLookingForState(status: $status, userData: $userData, selectedSpecializations: $selectedSpecializations, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class $EditLookingForStateCopyWith<$Res>  {
  factory $EditLookingForStateCopyWith(EditLookingForState value, $Res Function(EditLookingForState) _then) = _$EditLookingForStateCopyWithImpl;
@useResult
$Res call({
 EditLookingForStatus status, UserData? userData, List<ESpecialization> selectedSpecializations, String errorMessage
});


$UserDataCopyWith<$Res>? get userData;

}
/// @nodoc
class _$EditLookingForStateCopyWithImpl<$Res>
    implements $EditLookingForStateCopyWith<$Res> {
  _$EditLookingForStateCopyWithImpl(this._self, this._then);

  final EditLookingForState _self;
  final $Res Function(EditLookingForState) _then;

/// Create a copy of EditLookingForState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = null,Object? userData = freezed,Object? selectedSpecializations = null,Object? errorMessage = null,}) {
  return _then(_self.copyWith(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as EditLookingForStatus,userData: freezed == userData ? _self.userData : userData // ignore: cast_nullable_to_non_nullable
as UserData?,selectedSpecializations: null == selectedSpecializations ? _self.selectedSpecializations : selectedSpecializations // ignore: cast_nullable_to_non_nullable
as List<ESpecialization>,errorMessage: null == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String,
  ));
}
/// Create a copy of EditLookingForState
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


/// Adds pattern-matching-related methods to [EditLookingForState].
extension EditLookingForStatePatterns on EditLookingForState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _EditLookingForState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _EditLookingForState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _EditLookingForState value)  $default,){
final _that = this;
switch (_that) {
case _EditLookingForState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _EditLookingForState value)?  $default,){
final _that = this;
switch (_that) {
case _EditLookingForState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( EditLookingForStatus status,  UserData? userData,  List<ESpecialization> selectedSpecializations,  String errorMessage)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _EditLookingForState() when $default != null:
return $default(_that.status,_that.userData,_that.selectedSpecializations,_that.errorMessage);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( EditLookingForStatus status,  UserData? userData,  List<ESpecialization> selectedSpecializations,  String errorMessage)  $default,) {final _that = this;
switch (_that) {
case _EditLookingForState():
return $default(_that.status,_that.userData,_that.selectedSpecializations,_that.errorMessage);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( EditLookingForStatus status,  UserData? userData,  List<ESpecialization> selectedSpecializations,  String errorMessage)?  $default,) {final _that = this;
switch (_that) {
case _EditLookingForState() when $default != null:
return $default(_that.status,_that.userData,_that.selectedSpecializations,_that.errorMessage);case _:
  return null;

}
}

}

/// @nodoc


class _EditLookingForState implements EditLookingForState {
  const _EditLookingForState({this.status = EditLookingForStatus.initial, this.userData, final  List<ESpecialization> selectedSpecializations = const [], this.errorMessage = ''}): _selectedSpecializations = selectedSpecializations;
  

@override@JsonKey() final  EditLookingForStatus status;
@override final  UserData? userData;
 final  List<ESpecialization> _selectedSpecializations;
@override@JsonKey() List<ESpecialization> get selectedSpecializations {
  if (_selectedSpecializations is EqualUnmodifiableListView) return _selectedSpecializations;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_selectedSpecializations);
}

@override@JsonKey() final  String errorMessage;

/// Create a copy of EditLookingForState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$EditLookingForStateCopyWith<_EditLookingForState> get copyWith => __$EditLookingForStateCopyWithImpl<_EditLookingForState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _EditLookingForState&&(identical(other.status, status) || other.status == status)&&(identical(other.userData, userData) || other.userData == userData)&&const DeepCollectionEquality().equals(other._selectedSpecializations, _selectedSpecializations)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,status,userData,const DeepCollectionEquality().hash(_selectedSpecializations),errorMessage);

@override
String toString() {
  return 'EditLookingForState(status: $status, userData: $userData, selectedSpecializations: $selectedSpecializations, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class _$EditLookingForStateCopyWith<$Res> implements $EditLookingForStateCopyWith<$Res> {
  factory _$EditLookingForStateCopyWith(_EditLookingForState value, $Res Function(_EditLookingForState) _then) = __$EditLookingForStateCopyWithImpl;
@override @useResult
$Res call({
 EditLookingForStatus status, UserData? userData, List<ESpecialization> selectedSpecializations, String errorMessage
});


@override $UserDataCopyWith<$Res>? get userData;

}
/// @nodoc
class __$EditLookingForStateCopyWithImpl<$Res>
    implements _$EditLookingForStateCopyWith<$Res> {
  __$EditLookingForStateCopyWithImpl(this._self, this._then);

  final _EditLookingForState _self;
  final $Res Function(_EditLookingForState) _then;

/// Create a copy of EditLookingForState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = null,Object? userData = freezed,Object? selectedSpecializations = null,Object? errorMessage = null,}) {
  return _then(_EditLookingForState(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as EditLookingForStatus,userData: freezed == userData ? _self.userData : userData // ignore: cast_nullable_to_non_nullable
as UserData?,selectedSpecializations: null == selectedSpecializations ? _self._selectedSpecializations : selectedSpecializations // ignore: cast_nullable_to_non_nullable
as List<ESpecialization>,errorMessage: null == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

/// Create a copy of EditLookingForState
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
