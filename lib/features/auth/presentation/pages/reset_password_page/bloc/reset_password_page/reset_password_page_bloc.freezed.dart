// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'reset_password_page_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ResetPasswordPageEvent {

 String get email;
/// Create a copy of ResetPasswordPageEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ResetPasswordPageEventCopyWith<ResetPasswordPageEvent> get copyWith => _$ResetPasswordPageEventCopyWithImpl<ResetPasswordPageEvent>(this as ResetPasswordPageEvent, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ResetPasswordPageEvent&&(identical(other.email, email) || other.email == email));
}


@override
int get hashCode => Object.hash(runtimeType,email);

@override
String toString() {
  return 'ResetPasswordPageEvent(email: $email)';
}


}

/// @nodoc
abstract mixin class $ResetPasswordPageEventCopyWith<$Res>  {
  factory $ResetPasswordPageEventCopyWith(ResetPasswordPageEvent value, $Res Function(ResetPasswordPageEvent) _then) = _$ResetPasswordPageEventCopyWithImpl;
@useResult
$Res call({
 String email
});




}
/// @nodoc
class _$ResetPasswordPageEventCopyWithImpl<$Res>
    implements $ResetPasswordPageEventCopyWith<$Res> {
  _$ResetPasswordPageEventCopyWithImpl(this._self, this._then);

  final ResetPasswordPageEvent _self;
  final $Res Function(ResetPasswordPageEvent) _then;

/// Create a copy of ResetPasswordPageEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? email = null,}) {
  return _then(_self.copyWith(
email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [ResetPasswordPageEvent].
extension ResetPasswordPageEventPatterns on ResetPasswordPageEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Reset value)?  reset,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Reset() when reset != null:
return reset(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Reset value)  reset,}){
final _that = this;
switch (_that) {
case _Reset():
return reset(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Reset value)?  reset,}){
final _that = this;
switch (_that) {
case _Reset() when reset != null:
return reset(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String email)?  reset,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Reset() when reset != null:
return reset(_that.email);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String email)  reset,}) {final _that = this;
switch (_that) {
case _Reset():
return reset(_that.email);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String email)?  reset,}) {final _that = this;
switch (_that) {
case _Reset() when reset != null:
return reset(_that.email);case _:
  return null;

}
}

}

/// @nodoc


class _Reset implements ResetPasswordPageEvent {
  const _Reset({required this.email});
  

@override final  String email;

/// Create a copy of ResetPasswordPageEvent
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ResetCopyWith<_Reset> get copyWith => __$ResetCopyWithImpl<_Reset>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Reset&&(identical(other.email, email) || other.email == email));
}


@override
int get hashCode => Object.hash(runtimeType,email);

@override
String toString() {
  return 'ResetPasswordPageEvent.reset(email: $email)';
}


}

/// @nodoc
abstract mixin class _$ResetCopyWith<$Res> implements $ResetPasswordPageEventCopyWith<$Res> {
  factory _$ResetCopyWith(_Reset value, $Res Function(_Reset) _then) = __$ResetCopyWithImpl;
@override @useResult
$Res call({
 String email
});




}
/// @nodoc
class __$ResetCopyWithImpl<$Res>
    implements _$ResetCopyWith<$Res> {
  __$ResetCopyWithImpl(this._self, this._then);

  final _Reset _self;
  final $Res Function(_Reset) _then;

/// Create a copy of ResetPasswordPageEvent
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? email = null,}) {
  return _then(_Reset(
email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc
mixin _$ResetPasswordPageState {

 ResetPasswordPageStatus get status; String get errorMessage;
/// Create a copy of ResetPasswordPageState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ResetPasswordPageStateCopyWith<ResetPasswordPageState> get copyWith => _$ResetPasswordPageStateCopyWithImpl<ResetPasswordPageState>(this as ResetPasswordPageState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ResetPasswordPageState&&(identical(other.status, status) || other.status == status)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,status,errorMessage);

@override
String toString() {
  return 'ResetPasswordPageState(status: $status, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class $ResetPasswordPageStateCopyWith<$Res>  {
  factory $ResetPasswordPageStateCopyWith(ResetPasswordPageState value, $Res Function(ResetPasswordPageState) _then) = _$ResetPasswordPageStateCopyWithImpl;
@useResult
$Res call({
 ResetPasswordPageStatus status, String errorMessage
});




}
/// @nodoc
class _$ResetPasswordPageStateCopyWithImpl<$Res>
    implements $ResetPasswordPageStateCopyWith<$Res> {
  _$ResetPasswordPageStateCopyWithImpl(this._self, this._then);

  final ResetPasswordPageState _self;
  final $Res Function(ResetPasswordPageState) _then;

/// Create a copy of ResetPasswordPageState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = null,Object? errorMessage = null,}) {
  return _then(_self.copyWith(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as ResetPasswordPageStatus,errorMessage: null == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [ResetPasswordPageState].
extension ResetPasswordPageStatePatterns on ResetPasswordPageState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ResetPasswordPageState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ResetPasswordPageState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ResetPasswordPageState value)  $default,){
final _that = this;
switch (_that) {
case _ResetPasswordPageState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ResetPasswordPageState value)?  $default,){
final _that = this;
switch (_that) {
case _ResetPasswordPageState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( ResetPasswordPageStatus status,  String errorMessage)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ResetPasswordPageState() when $default != null:
return $default(_that.status,_that.errorMessage);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( ResetPasswordPageStatus status,  String errorMessage)  $default,) {final _that = this;
switch (_that) {
case _ResetPasswordPageState():
return $default(_that.status,_that.errorMessage);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( ResetPasswordPageStatus status,  String errorMessage)?  $default,) {final _that = this;
switch (_that) {
case _ResetPasswordPageState() when $default != null:
return $default(_that.status,_that.errorMessage);case _:
  return null;

}
}

}

/// @nodoc


class _ResetPasswordPageState implements ResetPasswordPageState {
  const _ResetPasswordPageState({this.status = ResetPasswordPageStatus.initial, this.errorMessage = ''});
  

@override@JsonKey() final  ResetPasswordPageStatus status;
@override@JsonKey() final  String errorMessage;

/// Create a copy of ResetPasswordPageState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ResetPasswordPageStateCopyWith<_ResetPasswordPageState> get copyWith => __$ResetPasswordPageStateCopyWithImpl<_ResetPasswordPageState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ResetPasswordPageState&&(identical(other.status, status) || other.status == status)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,status,errorMessage);

@override
String toString() {
  return 'ResetPasswordPageState(status: $status, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class _$ResetPasswordPageStateCopyWith<$Res> implements $ResetPasswordPageStateCopyWith<$Res> {
  factory _$ResetPasswordPageStateCopyWith(_ResetPasswordPageState value, $Res Function(_ResetPasswordPageState) _then) = __$ResetPasswordPageStateCopyWithImpl;
@override @useResult
$Res call({
 ResetPasswordPageStatus status, String errorMessage
});




}
/// @nodoc
class __$ResetPasswordPageStateCopyWithImpl<$Res>
    implements _$ResetPasswordPageStateCopyWith<$Res> {
  __$ResetPasswordPageStateCopyWithImpl(this._self, this._then);

  final _ResetPasswordPageState _self;
  final $Res Function(_ResetPasswordPageState) _then;

/// Create a copy of ResetPasswordPageState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = null,Object? errorMessage = null,}) {
  return _then(_ResetPasswordPageState(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as ResetPasswordPageStatus,errorMessage: null == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
