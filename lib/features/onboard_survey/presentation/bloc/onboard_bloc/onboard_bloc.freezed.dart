// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'onboard_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$OnboardEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OnboardEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'OnboardEvent()';
}


}

/// @nodoc
class $OnboardEventCopyWith<$Res>  {
$OnboardEventCopyWith(OnboardEvent _, $Res Function(OnboardEvent) __);
}


/// Adds pattern-matching-related methods to [OnboardEvent].
extension OnboardEventPatterns on OnboardEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Update value)?  update,TResult Function( _Load value)?  load,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Update() when update != null:
return update(_that);case _Load() when load != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Update value)  update,required TResult Function( _Load value)  load,}){
final _that = this;
switch (_that) {
case _Update():
return update(_that);case _Load():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Update value)?  update,TResult? Function( _Load value)?  load,}){
final _that = this;
switch (_that) {
case _Update() when update != null:
return update(_that);case _Load() when load != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( bool? toldAboutYourself,  bool? completeSpecialization)?  update,TResult Function()?  load,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Update() when update != null:
return update(_that.toldAboutYourself,_that.completeSpecialization);case _Load() when load != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( bool? toldAboutYourself,  bool? completeSpecialization)  update,required TResult Function()  load,}) {final _that = this;
switch (_that) {
case _Update():
return update(_that.toldAboutYourself,_that.completeSpecialization);case _Load():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( bool? toldAboutYourself,  bool? completeSpecialization)?  update,TResult? Function()?  load,}) {final _that = this;
switch (_that) {
case _Update() when update != null:
return update(_that.toldAboutYourself,_that.completeSpecialization);case _Load() when load != null:
return load();case _:
  return null;

}
}

}

/// @nodoc


class _Update implements OnboardEvent {
  const _Update({this.toldAboutYourself, this.completeSpecialization});
  

 final  bool? toldAboutYourself;
 final  bool? completeSpecialization;

/// Create a copy of OnboardEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UpdateCopyWith<_Update> get copyWith => __$UpdateCopyWithImpl<_Update>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Update&&(identical(other.toldAboutYourself, toldAboutYourself) || other.toldAboutYourself == toldAboutYourself)&&(identical(other.completeSpecialization, completeSpecialization) || other.completeSpecialization == completeSpecialization));
}


@override
int get hashCode => Object.hash(runtimeType,toldAboutYourself,completeSpecialization);

@override
String toString() {
  return 'OnboardEvent.update(toldAboutYourself: $toldAboutYourself, completeSpecialization: $completeSpecialization)';
}


}

/// @nodoc
abstract mixin class _$UpdateCopyWith<$Res> implements $OnboardEventCopyWith<$Res> {
  factory _$UpdateCopyWith(_Update value, $Res Function(_Update) _then) = __$UpdateCopyWithImpl;
@useResult
$Res call({
 bool? toldAboutYourself, bool? completeSpecialization
});




}
/// @nodoc
class __$UpdateCopyWithImpl<$Res>
    implements _$UpdateCopyWith<$Res> {
  __$UpdateCopyWithImpl(this._self, this._then);

  final _Update _self;
  final $Res Function(_Update) _then;

/// Create a copy of OnboardEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? toldAboutYourself = freezed,Object? completeSpecialization = freezed,}) {
  return _then(_Update(
toldAboutYourself: freezed == toldAboutYourself ? _self.toldAboutYourself : toldAboutYourself // ignore: cast_nullable_to_non_nullable
as bool?,completeSpecialization: freezed == completeSpecialization ? _self.completeSpecialization : completeSpecialization // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}


}

/// @nodoc


class _Load implements OnboardEvent {
  const _Load();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Load);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'OnboardEvent.load()';
}


}




/// @nodoc
mixin _$OnboardState {

 OnboardStatus get onboardStatus; dynamic get status; String get errorMessage;
/// Create a copy of OnboardState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OnboardStateCopyWith<OnboardState> get copyWith => _$OnboardStateCopyWithImpl<OnboardState>(this as OnboardState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OnboardState&&(identical(other.onboardStatus, onboardStatus) || other.onboardStatus == onboardStatus)&&const DeepCollectionEquality().equals(other.status, status)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,onboardStatus,const DeepCollectionEquality().hash(status),errorMessage);

@override
String toString() {
  return 'OnboardState(onboardStatus: $onboardStatus, status: $status, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class $OnboardStateCopyWith<$Res>  {
  factory $OnboardStateCopyWith(OnboardState value, $Res Function(OnboardState) _then) = _$OnboardStateCopyWithImpl;
@useResult
$Res call({
 OnboardStatus onboardStatus, dynamic status, String errorMessage
});


$OnboardStatusCopyWith<$Res> get onboardStatus;

}
/// @nodoc
class _$OnboardStateCopyWithImpl<$Res>
    implements $OnboardStateCopyWith<$Res> {
  _$OnboardStateCopyWithImpl(this._self, this._then);

  final OnboardState _self;
  final $Res Function(OnboardState) _then;

/// Create a copy of OnboardState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? onboardStatus = null,Object? status = freezed,Object? errorMessage = null,}) {
  return _then(_self.copyWith(
onboardStatus: null == onboardStatus ? _self.onboardStatus : onboardStatus // ignore: cast_nullable_to_non_nullable
as OnboardStatus,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as dynamic,errorMessage: null == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String,
  ));
}
/// Create a copy of OnboardState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$OnboardStatusCopyWith<$Res> get onboardStatus {
  
  return $OnboardStatusCopyWith<$Res>(_self.onboardStatus, (value) {
    return _then(_self.copyWith(onboardStatus: value));
  });
}
}


/// Adds pattern-matching-related methods to [OnboardState].
extension OnboardStatePatterns on OnboardState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _OnboardState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _OnboardState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _OnboardState value)  $default,){
final _that = this;
switch (_that) {
case _OnboardState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _OnboardState value)?  $default,){
final _that = this;
switch (_that) {
case _OnboardState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( OnboardStatus onboardStatus,  dynamic status,  String errorMessage)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _OnboardState() when $default != null:
return $default(_that.onboardStatus,_that.status,_that.errorMessage);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( OnboardStatus onboardStatus,  dynamic status,  String errorMessage)  $default,) {final _that = this;
switch (_that) {
case _OnboardState():
return $default(_that.onboardStatus,_that.status,_that.errorMessage);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( OnboardStatus onboardStatus,  dynamic status,  String errorMessage)?  $default,) {final _that = this;
switch (_that) {
case _OnboardState() when $default != null:
return $default(_that.onboardStatus,_that.status,_that.errorMessage);case _:
  return null;

}
}

}

/// @nodoc


class _OnboardState implements OnboardState {
  const _OnboardState({required this.onboardStatus, this.status = EOnboardStatus.initial, this.errorMessage = ''});
  

@override final  OnboardStatus onboardStatus;
@override@JsonKey() final  dynamic status;
@override@JsonKey() final  String errorMessage;

/// Create a copy of OnboardState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OnboardStateCopyWith<_OnboardState> get copyWith => __$OnboardStateCopyWithImpl<_OnboardState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _OnboardState&&(identical(other.onboardStatus, onboardStatus) || other.onboardStatus == onboardStatus)&&const DeepCollectionEquality().equals(other.status, status)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,onboardStatus,const DeepCollectionEquality().hash(status),errorMessage);

@override
String toString() {
  return 'OnboardState(onboardStatus: $onboardStatus, status: $status, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class _$OnboardStateCopyWith<$Res> implements $OnboardStateCopyWith<$Res> {
  factory _$OnboardStateCopyWith(_OnboardState value, $Res Function(_OnboardState) _then) = __$OnboardStateCopyWithImpl;
@override @useResult
$Res call({
 OnboardStatus onboardStatus, dynamic status, String errorMessage
});


@override $OnboardStatusCopyWith<$Res> get onboardStatus;

}
/// @nodoc
class __$OnboardStateCopyWithImpl<$Res>
    implements _$OnboardStateCopyWith<$Res> {
  __$OnboardStateCopyWithImpl(this._self, this._then);

  final _OnboardState _self;
  final $Res Function(_OnboardState) _then;

/// Create a copy of OnboardState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? onboardStatus = null,Object? status = freezed,Object? errorMessage = null,}) {
  return _then(_OnboardState(
onboardStatus: null == onboardStatus ? _self.onboardStatus : onboardStatus // ignore: cast_nullable_to_non_nullable
as OnboardStatus,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as dynamic,errorMessage: null == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

/// Create a copy of OnboardState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$OnboardStatusCopyWith<$Res> get onboardStatus {
  
  return $OnboardStatusCopyWith<$Res>(_self.onboardStatus, (value) {
    return _then(_self.copyWith(onboardStatus: value));
  });
}
}

// dart format on
