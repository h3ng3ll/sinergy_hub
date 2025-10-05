// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'onboard_survey_page_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$OnboardSurveyPageState {

 int get step; OnboardSurveyPageStatus get status;
/// Create a copy of OnboardSurveyPageState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OnboardSurveyPageStateCopyWith<OnboardSurveyPageState> get copyWith => _$OnboardSurveyPageStateCopyWithImpl<OnboardSurveyPageState>(this as OnboardSurveyPageState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OnboardSurveyPageState&&(identical(other.step, step) || other.step == step)&&(identical(other.status, status) || other.status == status));
}


@override
int get hashCode => Object.hash(runtimeType,step,status);

@override
String toString() {
  return 'OnboardSurveyPageState(step: $step, status: $status)';
}


}

/// @nodoc
abstract mixin class $OnboardSurveyPageStateCopyWith<$Res>  {
  factory $OnboardSurveyPageStateCopyWith(OnboardSurveyPageState value, $Res Function(OnboardSurveyPageState) _then) = _$OnboardSurveyPageStateCopyWithImpl;
@useResult
$Res call({
 int step, OnboardSurveyPageStatus status
});




}
/// @nodoc
class _$OnboardSurveyPageStateCopyWithImpl<$Res>
    implements $OnboardSurveyPageStateCopyWith<$Res> {
  _$OnboardSurveyPageStateCopyWithImpl(this._self, this._then);

  final OnboardSurveyPageState _self;
  final $Res Function(OnboardSurveyPageState) _then;

/// Create a copy of OnboardSurveyPageState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? step = null,Object? status = null,}) {
  return _then(_self.copyWith(
step: null == step ? _self.step : step // ignore: cast_nullable_to_non_nullable
as int,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as OnboardSurveyPageStatus,
  ));
}

}


/// Adds pattern-matching-related methods to [OnboardSurveyPageState].
extension OnboardSurveyPageStatePatterns on OnboardSurveyPageState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _OnboardSurveyPageState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _OnboardSurveyPageState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _OnboardSurveyPageState value)  $default,){
final _that = this;
switch (_that) {
case _OnboardSurveyPageState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _OnboardSurveyPageState value)?  $default,){
final _that = this;
switch (_that) {
case _OnboardSurveyPageState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int step,  OnboardSurveyPageStatus status)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _OnboardSurveyPageState() when $default != null:
return $default(_that.step,_that.status);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int step,  OnboardSurveyPageStatus status)  $default,) {final _that = this;
switch (_that) {
case _OnboardSurveyPageState():
return $default(_that.step,_that.status);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int step,  OnboardSurveyPageStatus status)?  $default,) {final _that = this;
switch (_that) {
case _OnboardSurveyPageState() when $default != null:
return $default(_that.step,_that.status);case _:
  return null;

}
}

}

/// @nodoc


class _OnboardSurveyPageState implements OnboardSurveyPageState {
  const _OnboardSurveyPageState({this.step = 1, this.status = OnboardSurveyPageStatus.loading});
  

@override@JsonKey() final  int step;
@override@JsonKey() final  OnboardSurveyPageStatus status;

/// Create a copy of OnboardSurveyPageState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OnboardSurveyPageStateCopyWith<_OnboardSurveyPageState> get copyWith => __$OnboardSurveyPageStateCopyWithImpl<_OnboardSurveyPageState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _OnboardSurveyPageState&&(identical(other.step, step) || other.step == step)&&(identical(other.status, status) || other.status == status));
}


@override
int get hashCode => Object.hash(runtimeType,step,status);

@override
String toString() {
  return 'OnboardSurveyPageState(step: $step, status: $status)';
}


}

/// @nodoc
abstract mixin class _$OnboardSurveyPageStateCopyWith<$Res> implements $OnboardSurveyPageStateCopyWith<$Res> {
  factory _$OnboardSurveyPageStateCopyWith(_OnboardSurveyPageState value, $Res Function(_OnboardSurveyPageState) _then) = __$OnboardSurveyPageStateCopyWithImpl;
@override @useResult
$Res call({
 int step, OnboardSurveyPageStatus status
});




}
/// @nodoc
class __$OnboardSurveyPageStateCopyWithImpl<$Res>
    implements _$OnboardSurveyPageStateCopyWith<$Res> {
  __$OnboardSurveyPageStateCopyWithImpl(this._self, this._then);

  final _OnboardSurveyPageState _self;
  final $Res Function(_OnboardSurveyPageState) _then;

/// Create a copy of OnboardSurveyPageState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? step = null,Object? status = null,}) {
  return _then(_OnboardSurveyPageState(
step: null == step ? _self.step : step // ignore: cast_nullable_to_non_nullable
as int,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as OnboardSurveyPageStatus,
  ));
}


}

// dart format on
