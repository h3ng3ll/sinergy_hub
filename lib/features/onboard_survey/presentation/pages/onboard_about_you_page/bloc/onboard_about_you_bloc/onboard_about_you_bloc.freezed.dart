// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'onboard_about_you_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$OnboardAboutYouEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OnboardAboutYouEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'OnboardAboutYouEvent()';
}


}

/// @nodoc
class $OnboardAboutYouEventCopyWith<$Res>  {
$OnboardAboutYouEventCopyWith(OnboardAboutYouEvent _, $Res Function(OnboardAboutYouEvent) __);
}


/// Adds pattern-matching-related methods to [OnboardAboutYouEvent].
extension OnboardAboutYouEventPatterns on OnboardAboutYouEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Load value)?  load,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Load() when load != null:
return load(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Load value)  load,}){
final _that = this;
switch (_that) {
case _Load():
return load(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Load value)?  load,}){
final _that = this;
switch (_that) {
case _Load() when load != null:
return load(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  load,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Load() when load != null:
return load();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  load,}) {final _that = this;
switch (_that) {
case _Load():
return load();}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  load,}) {final _that = this;
switch (_that) {
case _Load() when load != null:
return load();case _:
  return null;

}
}

}

/// @nodoc


class _Load implements OnboardAboutYouEvent {
  const _Load();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Load);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'OnboardAboutYouEvent.load()';
}


}




/// @nodoc
mixin _$OnboardAboutYouState {

 EOnboardAboutYouStatus get status; String get firstName; String get lastName; String? get email; String get errorMessage;
/// Create a copy of OnboardAboutYouState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OnboardAboutYouStateCopyWith<OnboardAboutYouState> get copyWith => _$OnboardAboutYouStateCopyWithImpl<OnboardAboutYouState>(this as OnboardAboutYouState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OnboardAboutYouState&&(identical(other.status, status) || other.status == status)&&(identical(other.firstName, firstName) || other.firstName == firstName)&&(identical(other.lastName, lastName) || other.lastName == lastName)&&(identical(other.email, email) || other.email == email)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,status,firstName,lastName,email,errorMessage);

@override
String toString() {
  return 'OnboardAboutYouState(status: $status, firstName: $firstName, lastName: $lastName, email: $email, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class $OnboardAboutYouStateCopyWith<$Res>  {
  factory $OnboardAboutYouStateCopyWith(OnboardAboutYouState value, $Res Function(OnboardAboutYouState) _then) = _$OnboardAboutYouStateCopyWithImpl;
@useResult
$Res call({
 EOnboardAboutYouStatus status, String firstName, String lastName, String? email, String errorMessage
});




}
/// @nodoc
class _$OnboardAboutYouStateCopyWithImpl<$Res>
    implements $OnboardAboutYouStateCopyWith<$Res> {
  _$OnboardAboutYouStateCopyWithImpl(this._self, this._then);

  final OnboardAboutYouState _self;
  final $Res Function(OnboardAboutYouState) _then;

/// Create a copy of OnboardAboutYouState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = null,Object? firstName = null,Object? lastName = null,Object? email = freezed,Object? errorMessage = null,}) {
  return _then(_self.copyWith(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as EOnboardAboutYouStatus,firstName: null == firstName ? _self.firstName : firstName // ignore: cast_nullable_to_non_nullable
as String,lastName: null == lastName ? _self.lastName : lastName // ignore: cast_nullable_to_non_nullable
as String,email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,errorMessage: null == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [OnboardAboutYouState].
extension OnboardAboutYouStatePatterns on OnboardAboutYouState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _OnboardAboutYouState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _OnboardAboutYouState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _OnboardAboutYouState value)  $default,){
final _that = this;
switch (_that) {
case _OnboardAboutYouState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _OnboardAboutYouState value)?  $default,){
final _that = this;
switch (_that) {
case _OnboardAboutYouState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( EOnboardAboutYouStatus status,  String firstName,  String lastName,  String? email,  String errorMessage)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _OnboardAboutYouState() when $default != null:
return $default(_that.status,_that.firstName,_that.lastName,_that.email,_that.errorMessage);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( EOnboardAboutYouStatus status,  String firstName,  String lastName,  String? email,  String errorMessage)  $default,) {final _that = this;
switch (_that) {
case _OnboardAboutYouState():
return $default(_that.status,_that.firstName,_that.lastName,_that.email,_that.errorMessage);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( EOnboardAboutYouStatus status,  String firstName,  String lastName,  String? email,  String errorMessage)?  $default,) {final _that = this;
switch (_that) {
case _OnboardAboutYouState() when $default != null:
return $default(_that.status,_that.firstName,_that.lastName,_that.email,_that.errorMessage);case _:
  return null;

}
}

}

/// @nodoc


class _OnboardAboutYouState extends OnboardAboutYouState {
  const _OnboardAboutYouState({this.status = EOnboardAboutYouStatus.initial, this.firstName = '', this.lastName = '', this.email, this.errorMessage = ''}): super._();
  

@override@JsonKey() final  EOnboardAboutYouStatus status;
@override@JsonKey() final  String firstName;
@override@JsonKey() final  String lastName;
@override final  String? email;
@override@JsonKey() final  String errorMessage;

/// Create a copy of OnboardAboutYouState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OnboardAboutYouStateCopyWith<_OnboardAboutYouState> get copyWith => __$OnboardAboutYouStateCopyWithImpl<_OnboardAboutYouState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _OnboardAboutYouState&&(identical(other.status, status) || other.status == status)&&(identical(other.firstName, firstName) || other.firstName == firstName)&&(identical(other.lastName, lastName) || other.lastName == lastName)&&(identical(other.email, email) || other.email == email)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,status,firstName,lastName,email,errorMessage);

@override
String toString() {
  return 'OnboardAboutYouState(status: $status, firstName: $firstName, lastName: $lastName, email: $email, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class _$OnboardAboutYouStateCopyWith<$Res> implements $OnboardAboutYouStateCopyWith<$Res> {
  factory _$OnboardAboutYouStateCopyWith(_OnboardAboutYouState value, $Res Function(_OnboardAboutYouState) _then) = __$OnboardAboutYouStateCopyWithImpl;
@override @useResult
$Res call({
 EOnboardAboutYouStatus status, String firstName, String lastName, String? email, String errorMessage
});




}
/// @nodoc
class __$OnboardAboutYouStateCopyWithImpl<$Res>
    implements _$OnboardAboutYouStateCopyWith<$Res> {
  __$OnboardAboutYouStateCopyWithImpl(this._self, this._then);

  final _OnboardAboutYouState _self;
  final $Res Function(_OnboardAboutYouState) _then;

/// Create a copy of OnboardAboutYouState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = null,Object? firstName = null,Object? lastName = null,Object? email = freezed,Object? errorMessage = null,}) {
  return _then(_OnboardAboutYouState(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as EOnboardAboutYouStatus,firstName: null == firstName ? _self.firstName : firstName // ignore: cast_nullable_to_non_nullable
as String,lastName: null == lastName ? _self.lastName : lastName // ignore: cast_nullable_to_non_nullable
as String,email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,errorMessage: null == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
