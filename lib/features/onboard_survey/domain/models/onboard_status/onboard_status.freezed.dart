// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'onboard_status.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$OnboardStatus {

 bool get toldAboutYourself; bool get completeSpecialization; bool get completedMatchTutorial; bool get completedChatTutorial;
/// Create a copy of OnboardStatus
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OnboardStatusCopyWith<OnboardStatus> get copyWith => _$OnboardStatusCopyWithImpl<OnboardStatus>(this as OnboardStatus, _$identity);

  /// Serializes this OnboardStatus to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OnboardStatus&&(identical(other.toldAboutYourself, toldAboutYourself) || other.toldAboutYourself == toldAboutYourself)&&(identical(other.completeSpecialization, completeSpecialization) || other.completeSpecialization == completeSpecialization)&&(identical(other.completedMatchTutorial, completedMatchTutorial) || other.completedMatchTutorial == completedMatchTutorial)&&(identical(other.completedChatTutorial, completedChatTutorial) || other.completedChatTutorial == completedChatTutorial));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,toldAboutYourself,completeSpecialization,completedMatchTutorial,completedChatTutorial);

@override
String toString() {
  return 'OnboardStatus(toldAboutYourself: $toldAboutYourself, completeSpecialization: $completeSpecialization, completedMatchTutorial: $completedMatchTutorial, completedChatTutorial: $completedChatTutorial)';
}


}

/// @nodoc
abstract mixin class $OnboardStatusCopyWith<$Res>  {
  factory $OnboardStatusCopyWith(OnboardStatus value, $Res Function(OnboardStatus) _then) = _$OnboardStatusCopyWithImpl;
@useResult
$Res call({
 bool toldAboutYourself, bool completeSpecialization, bool completedMatchTutorial, bool completedChatTutorial
});




}
/// @nodoc
class _$OnboardStatusCopyWithImpl<$Res>
    implements $OnboardStatusCopyWith<$Res> {
  _$OnboardStatusCopyWithImpl(this._self, this._then);

  final OnboardStatus _self;
  final $Res Function(OnboardStatus) _then;

/// Create a copy of OnboardStatus
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? toldAboutYourself = null,Object? completeSpecialization = null,Object? completedMatchTutorial = null,Object? completedChatTutorial = null,}) {
  return _then(_self.copyWith(
toldAboutYourself: null == toldAboutYourself ? _self.toldAboutYourself : toldAboutYourself // ignore: cast_nullable_to_non_nullable
as bool,completeSpecialization: null == completeSpecialization ? _self.completeSpecialization : completeSpecialization // ignore: cast_nullable_to_non_nullable
as bool,completedMatchTutorial: null == completedMatchTutorial ? _self.completedMatchTutorial : completedMatchTutorial // ignore: cast_nullable_to_non_nullable
as bool,completedChatTutorial: null == completedChatTutorial ? _self.completedChatTutorial : completedChatTutorial // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [OnboardStatus].
extension OnboardStatusPatterns on OnboardStatus {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _OnboardStatus value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _OnboardStatus() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _OnboardStatus value)  $default,){
final _that = this;
switch (_that) {
case _OnboardStatus():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _OnboardStatus value)?  $default,){
final _that = this;
switch (_that) {
case _OnboardStatus() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool toldAboutYourself,  bool completeSpecialization,  bool completedMatchTutorial,  bool completedChatTutorial)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _OnboardStatus() when $default != null:
return $default(_that.toldAboutYourself,_that.completeSpecialization,_that.completedMatchTutorial,_that.completedChatTutorial);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool toldAboutYourself,  bool completeSpecialization,  bool completedMatchTutorial,  bool completedChatTutorial)  $default,) {final _that = this;
switch (_that) {
case _OnboardStatus():
return $default(_that.toldAboutYourself,_that.completeSpecialization,_that.completedMatchTutorial,_that.completedChatTutorial);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool toldAboutYourself,  bool completeSpecialization,  bool completedMatchTutorial,  bool completedChatTutorial)?  $default,) {final _that = this;
switch (_that) {
case _OnboardStatus() when $default != null:
return $default(_that.toldAboutYourself,_that.completeSpecialization,_that.completedMatchTutorial,_that.completedChatTutorial);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _OnboardStatus implements OnboardStatus {
  const _OnboardStatus({this.toldAboutYourself = false, this.completeSpecialization = false, this.completedMatchTutorial = false, this.completedChatTutorial = false});
  factory _OnboardStatus.fromJson(Map<String, dynamic> json) => _$OnboardStatusFromJson(json);

@override@JsonKey() final  bool toldAboutYourself;
@override@JsonKey() final  bool completeSpecialization;
@override@JsonKey() final  bool completedMatchTutorial;
@override@JsonKey() final  bool completedChatTutorial;

/// Create a copy of OnboardStatus
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OnboardStatusCopyWith<_OnboardStatus> get copyWith => __$OnboardStatusCopyWithImpl<_OnboardStatus>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$OnboardStatusToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _OnboardStatus&&(identical(other.toldAboutYourself, toldAboutYourself) || other.toldAboutYourself == toldAboutYourself)&&(identical(other.completeSpecialization, completeSpecialization) || other.completeSpecialization == completeSpecialization)&&(identical(other.completedMatchTutorial, completedMatchTutorial) || other.completedMatchTutorial == completedMatchTutorial)&&(identical(other.completedChatTutorial, completedChatTutorial) || other.completedChatTutorial == completedChatTutorial));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,toldAboutYourself,completeSpecialization,completedMatchTutorial,completedChatTutorial);

@override
String toString() {
  return 'OnboardStatus(toldAboutYourself: $toldAboutYourself, completeSpecialization: $completeSpecialization, completedMatchTutorial: $completedMatchTutorial, completedChatTutorial: $completedChatTutorial)';
}


}

/// @nodoc
abstract mixin class _$OnboardStatusCopyWith<$Res> implements $OnboardStatusCopyWith<$Res> {
  factory _$OnboardStatusCopyWith(_OnboardStatus value, $Res Function(_OnboardStatus) _then) = __$OnboardStatusCopyWithImpl;
@override @useResult
$Res call({
 bool toldAboutYourself, bool completeSpecialization, bool completedMatchTutorial, bool completedChatTutorial
});




}
/// @nodoc
class __$OnboardStatusCopyWithImpl<$Res>
    implements _$OnboardStatusCopyWith<$Res> {
  __$OnboardStatusCopyWithImpl(this._self, this._then);

  final _OnboardStatus _self;
  final $Res Function(_OnboardStatus) _then;

/// Create a copy of OnboardStatus
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? toldAboutYourself = null,Object? completeSpecialization = null,Object? completedMatchTutorial = null,Object? completedChatTutorial = null,}) {
  return _then(_OnboardStatus(
toldAboutYourself: null == toldAboutYourself ? _self.toldAboutYourself : toldAboutYourself // ignore: cast_nullable_to_non_nullable
as bool,completeSpecialization: null == completeSpecialization ? _self.completeSpecialization : completeSpecialization // ignore: cast_nullable_to_non_nullable
as bool,completedMatchTutorial: null == completedMatchTutorial ? _self.completedMatchTutorial : completedMatchTutorial // ignore: cast_nullable_to_non_nullable
as bool,completedChatTutorial: null == completedChatTutorial ? _self.completedChatTutorial : completedChatTutorial // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
