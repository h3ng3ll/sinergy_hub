// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'onboard_survey_page_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$OnboardSurveyPageEvent {

 int get page;
/// Create a copy of OnboardSurveyPageEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OnboardSurveyPageEventCopyWith<OnboardSurveyPageEvent> get copyWith => _$OnboardSurveyPageEventCopyWithImpl<OnboardSurveyPageEvent>(this as OnboardSurveyPageEvent, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OnboardSurveyPageEvent&&(identical(other.page, page) || other.page == page));
}


@override
int get hashCode => Object.hash(runtimeType,page);

@override
String toString() {
  return 'OnboardSurveyPageEvent(page: $page)';
}


}

/// @nodoc
abstract mixin class $OnboardSurveyPageEventCopyWith<$Res>  {
  factory $OnboardSurveyPageEventCopyWith(OnboardSurveyPageEvent value, $Res Function(OnboardSurveyPageEvent) _then) = _$OnboardSurveyPageEventCopyWithImpl;
@useResult
$Res call({
 int page
});




}
/// @nodoc
class _$OnboardSurveyPageEventCopyWithImpl<$Res>
    implements $OnboardSurveyPageEventCopyWith<$Res> {
  _$OnboardSurveyPageEventCopyWithImpl(this._self, this._then);

  final OnboardSurveyPageEvent _self;
  final $Res Function(OnboardSurveyPageEvent) _then;

/// Create a copy of OnboardSurveyPageEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? page = null,}) {
  return _then(_self.copyWith(
page: null == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [OnboardSurveyPageEvent].
extension OnboardSurveyPageEventPatterns on OnboardSurveyPageEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _GoTo value)?  goTo,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _GoTo() when goTo != null:
return goTo(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _GoTo value)  goTo,}){
final _that = this;
switch (_that) {
case _GoTo():
return goTo(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _GoTo value)?  goTo,}){
final _that = this;
switch (_that) {
case _GoTo() when goTo != null:
return goTo(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( int page)?  goTo,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _GoTo() when goTo != null:
return goTo(_that.page);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( int page)  goTo,}) {final _that = this;
switch (_that) {
case _GoTo():
return goTo(_that.page);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( int page)?  goTo,}) {final _that = this;
switch (_that) {
case _GoTo() when goTo != null:
return goTo(_that.page);case _:
  return null;

}
}

}

/// @nodoc


class _GoTo implements OnboardSurveyPageEvent {
  const _GoTo({required this.page});
  

@override final  int page;

/// Create a copy of OnboardSurveyPageEvent
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GoToCopyWith<_GoTo> get copyWith => __$GoToCopyWithImpl<_GoTo>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GoTo&&(identical(other.page, page) || other.page == page));
}


@override
int get hashCode => Object.hash(runtimeType,page);

@override
String toString() {
  return 'OnboardSurveyPageEvent.goTo(page: $page)';
}


}

/// @nodoc
abstract mixin class _$GoToCopyWith<$Res> implements $OnboardSurveyPageEventCopyWith<$Res> {
  factory _$GoToCopyWith(_GoTo value, $Res Function(_GoTo) _then) = __$GoToCopyWithImpl;
@override @useResult
$Res call({
 int page
});




}
/// @nodoc
class __$GoToCopyWithImpl<$Res>
    implements _$GoToCopyWith<$Res> {
  __$GoToCopyWithImpl(this._self, this._then);

  final _GoTo _self;
  final $Res Function(_GoTo) _then;

/// Create a copy of OnboardSurveyPageEvent
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? page = null,}) {
  return _then(_GoTo(
page: null == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc
mixin _$OnboardSurveyPageState {

 int get step;
/// Create a copy of OnboardSurveyPageState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OnboardSurveyPageStateCopyWith<OnboardSurveyPageState> get copyWith => _$OnboardSurveyPageStateCopyWithImpl<OnboardSurveyPageState>(this as OnboardSurveyPageState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OnboardSurveyPageState&&(identical(other.step, step) || other.step == step));
}


@override
int get hashCode => Object.hash(runtimeType,step);

@override
String toString() {
  return 'OnboardSurveyPageState(step: $step)';
}


}

/// @nodoc
abstract mixin class $OnboardSurveyPageStateCopyWith<$Res>  {
  factory $OnboardSurveyPageStateCopyWith(OnboardSurveyPageState value, $Res Function(OnboardSurveyPageState) _then) = _$OnboardSurveyPageStateCopyWithImpl;
@useResult
$Res call({
 int step
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
@pragma('vm:prefer-inline') @override $Res call({Object? step = null,}) {
  return _then(_self.copyWith(
step: null == step ? _self.step : step // ignore: cast_nullable_to_non_nullable
as int,
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int step)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _OnboardSurveyPageState() when $default != null:
return $default(_that.step);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int step)  $default,) {final _that = this;
switch (_that) {
case _OnboardSurveyPageState():
return $default(_that.step);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int step)?  $default,) {final _that = this;
switch (_that) {
case _OnboardSurveyPageState() when $default != null:
return $default(_that.step);case _:
  return null;

}
}

}

/// @nodoc


class _OnboardSurveyPageState implements OnboardSurveyPageState {
  const _OnboardSurveyPageState({this.step = 1});
  

@override@JsonKey() final  int step;

/// Create a copy of OnboardSurveyPageState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OnboardSurveyPageStateCopyWith<_OnboardSurveyPageState> get copyWith => __$OnboardSurveyPageStateCopyWithImpl<_OnboardSurveyPageState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _OnboardSurveyPageState&&(identical(other.step, step) || other.step == step));
}


@override
int get hashCode => Object.hash(runtimeType,step);

@override
String toString() {
  return 'OnboardSurveyPageState(step: $step)';
}


}

/// @nodoc
abstract mixin class _$OnboardSurveyPageStateCopyWith<$Res> implements $OnboardSurveyPageStateCopyWith<$Res> {
  factory _$OnboardSurveyPageStateCopyWith(_OnboardSurveyPageState value, $Res Function(_OnboardSurveyPageState) _then) = __$OnboardSurveyPageStateCopyWithImpl;
@override @useResult
$Res call({
 int step
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
@override @pragma('vm:prefer-inline') $Res call({Object? step = null,}) {
  return _then(_OnboardSurveyPageState(
step: null == step ? _self.step : step // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
