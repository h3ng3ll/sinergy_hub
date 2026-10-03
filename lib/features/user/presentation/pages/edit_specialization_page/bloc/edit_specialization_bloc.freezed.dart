// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'edit_specialization_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$EditSpecializationEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is EditSpecializationEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'EditSpecializationEvent()';
}


}

/// @nodoc
class $EditSpecializationEventCopyWith<$Res>  {
$EditSpecializationEventCopyWith(EditSpecializationEvent _, $Res Function(EditSpecializationEvent) __);
}


/// Adds pattern-matching-related methods to [EditSpecializationEvent].
extension EditSpecializationEventPatterns on EditSpecializationEvent {
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  init,TResult Function( ESpecialization specialization)?  select,TResult Function()?  save,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Init() when init != null:
return init();case _Select() when select != null:
return select(_that.specialization);case _Save() when save != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  init,required TResult Function( ESpecialization specialization)  select,required TResult Function()  save,}) {final _that = this;
switch (_that) {
case _Init():
return init();case _Select():
return select(_that.specialization);case _Save():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  init,TResult? Function( ESpecialization specialization)?  select,TResult? Function()?  save,}) {final _that = this;
switch (_that) {
case _Init() when init != null:
return init();case _Select() when select != null:
return select(_that.specialization);case _Save() when save != null:
return save();case _:
  return null;

}
}

}

/// @nodoc


class _Init implements EditSpecializationEvent {
  const _Init();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Init);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'EditSpecializationEvent.init()';
}


}




/// @nodoc


class _Select implements EditSpecializationEvent {
  const _Select({required this.specialization});
  

 final  ESpecialization specialization;

/// Create a copy of EditSpecializationEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SelectCopyWith<_Select> get copyWith => __$SelectCopyWithImpl<_Select>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Select&&(identical(other.specialization, specialization) || other.specialization == specialization));
}


@override
int get hashCode => Object.hash(runtimeType,specialization);

@override
String toString() {
  return 'EditSpecializationEvent.select(specialization: $specialization)';
}


}

/// @nodoc
abstract mixin class _$SelectCopyWith<$Res> implements $EditSpecializationEventCopyWith<$Res> {
  factory _$SelectCopyWith(_Select value, $Res Function(_Select) _then) = __$SelectCopyWithImpl;
@useResult
$Res call({
 ESpecialization specialization
});




}
/// @nodoc
class __$SelectCopyWithImpl<$Res>
    implements _$SelectCopyWith<$Res> {
  __$SelectCopyWithImpl(this._self, this._then);

  final _Select _self;
  final $Res Function(_Select) _then;

/// Create a copy of EditSpecializationEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? specialization = null,}) {
  return _then(_Select(
specialization: null == specialization ? _self.specialization : specialization // ignore: cast_nullable_to_non_nullable
as ESpecialization,
  ));
}


}

/// @nodoc


class _Save implements EditSpecializationEvent {
  const _Save();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Save);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'EditSpecializationEvent.save()';
}


}




/// @nodoc
mixin _$EditSpecializationState {

 EEditSpecializationStatus get status; UserData? get userData; ESpecialization? get selectedSpecialization; String get errorMessage;
/// Create a copy of EditSpecializationState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$EditSpecializationStateCopyWith<EditSpecializationState> get copyWith => _$EditSpecializationStateCopyWithImpl<EditSpecializationState>(this as EditSpecializationState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is EditSpecializationState&&(identical(other.status, status) || other.status == status)&&(identical(other.userData, userData) || other.userData == userData)&&(identical(other.selectedSpecialization, selectedSpecialization) || other.selectedSpecialization == selectedSpecialization)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,status,userData,selectedSpecialization,errorMessage);

@override
String toString() {
  return 'EditSpecializationState(status: $status, userData: $userData, selectedSpecialization: $selectedSpecialization, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class $EditSpecializationStateCopyWith<$Res>  {
  factory $EditSpecializationStateCopyWith(EditSpecializationState value, $Res Function(EditSpecializationState) _then) = _$EditSpecializationStateCopyWithImpl;
@useResult
$Res call({
 EEditSpecializationStatus status, UserData? userData, ESpecialization? selectedSpecialization, String errorMessage
});


$UserDataCopyWith<$Res>? get userData;

}
/// @nodoc
class _$EditSpecializationStateCopyWithImpl<$Res>
    implements $EditSpecializationStateCopyWith<$Res> {
  _$EditSpecializationStateCopyWithImpl(this._self, this._then);

  final EditSpecializationState _self;
  final $Res Function(EditSpecializationState) _then;

/// Create a copy of EditSpecializationState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = null,Object? userData = freezed,Object? selectedSpecialization = freezed,Object? errorMessage = null,}) {
  return _then(_self.copyWith(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as EEditSpecializationStatus,userData: freezed == userData ? _self.userData : userData // ignore: cast_nullable_to_non_nullable
as UserData?,selectedSpecialization: freezed == selectedSpecialization ? _self.selectedSpecialization : selectedSpecialization // ignore: cast_nullable_to_non_nullable
as ESpecialization?,errorMessage: null == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String,
  ));
}
/// Create a copy of EditSpecializationState
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


/// Adds pattern-matching-related methods to [EditSpecializationState].
extension EditSpecializationStatePatterns on EditSpecializationState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _EditSpecializationState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _EditSpecializationState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _EditSpecializationState value)  $default,){
final _that = this;
switch (_that) {
case _EditSpecializationState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _EditSpecializationState value)?  $default,){
final _that = this;
switch (_that) {
case _EditSpecializationState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( EEditSpecializationStatus status,  UserData? userData,  ESpecialization? selectedSpecialization,  String errorMessage)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _EditSpecializationState() when $default != null:
return $default(_that.status,_that.userData,_that.selectedSpecialization,_that.errorMessage);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( EEditSpecializationStatus status,  UserData? userData,  ESpecialization? selectedSpecialization,  String errorMessage)  $default,) {final _that = this;
switch (_that) {
case _EditSpecializationState():
return $default(_that.status,_that.userData,_that.selectedSpecialization,_that.errorMessage);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( EEditSpecializationStatus status,  UserData? userData,  ESpecialization? selectedSpecialization,  String errorMessage)?  $default,) {final _that = this;
switch (_that) {
case _EditSpecializationState() when $default != null:
return $default(_that.status,_that.userData,_that.selectedSpecialization,_that.errorMessage);case _:
  return null;

}
}

}

/// @nodoc


class _EditSpecializationState implements EditSpecializationState {
  const _EditSpecializationState({this.status = EEditSpecializationStatus.initial, this.userData, this.selectedSpecialization, this.errorMessage = ''});
  

@override@JsonKey() final  EEditSpecializationStatus status;
@override final  UserData? userData;
@override final  ESpecialization? selectedSpecialization;
@override@JsonKey() final  String errorMessage;

/// Create a copy of EditSpecializationState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$EditSpecializationStateCopyWith<_EditSpecializationState> get copyWith => __$EditSpecializationStateCopyWithImpl<_EditSpecializationState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _EditSpecializationState&&(identical(other.status, status) || other.status == status)&&(identical(other.userData, userData) || other.userData == userData)&&(identical(other.selectedSpecialization, selectedSpecialization) || other.selectedSpecialization == selectedSpecialization)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,status,userData,selectedSpecialization,errorMessage);

@override
String toString() {
  return 'EditSpecializationState(status: $status, userData: $userData, selectedSpecialization: $selectedSpecialization, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class _$EditSpecializationStateCopyWith<$Res> implements $EditSpecializationStateCopyWith<$Res> {
  factory _$EditSpecializationStateCopyWith(_EditSpecializationState value, $Res Function(_EditSpecializationState) _then) = __$EditSpecializationStateCopyWithImpl;
@override @useResult
$Res call({
 EEditSpecializationStatus status, UserData? userData, ESpecialization? selectedSpecialization, String errorMessage
});


@override $UserDataCopyWith<$Res>? get userData;

}
/// @nodoc
class __$EditSpecializationStateCopyWithImpl<$Res>
    implements _$EditSpecializationStateCopyWith<$Res> {
  __$EditSpecializationStateCopyWithImpl(this._self, this._then);

  final _EditSpecializationState _self;
  final $Res Function(_EditSpecializationState) _then;

/// Create a copy of EditSpecializationState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = null,Object? userData = freezed,Object? selectedSpecialization = freezed,Object? errorMessage = null,}) {
  return _then(_EditSpecializationState(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as EEditSpecializationStatus,userData: freezed == userData ? _self.userData : userData // ignore: cast_nullable_to_non_nullable
as UserData?,selectedSpecialization: freezed == selectedSpecialization ? _self.selectedSpecialization : selectedSpecialization // ignore: cast_nullable_to_non_nullable
as ESpecialization?,errorMessage: null == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

/// Create a copy of EditSpecializationState
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
