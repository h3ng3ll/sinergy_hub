// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'matches_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$MatchesEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MatchesEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'MatchesEvent()';
}


}

/// @nodoc
class $MatchesEventCopyWith<$Res>  {
$MatchesEventCopyWith(MatchesEvent _, $Res Function(MatchesEvent) __);
}


/// Adds pattern-matching-related methods to [MatchesEvent].
extension MatchesEventPatterns on MatchesEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _StartListening value)?  startListening,TResult Function( _Create value)?  create,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _StartListening() when startListening != null:
return startListening(_that);case _Create() when create != null:
return create(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _StartListening value)  startListening,required TResult Function( _Create value)  create,}){
final _that = this;
switch (_that) {
case _StartListening():
return startListening(_that);case _Create():
return create(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _StartListening value)?  startListening,TResult? Function( _Create value)?  create,}){
final _that = this;
switch (_that) {
case _StartListening() when startListening != null:
return startListening(_that);case _Create() when create != null:
return create(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  startListening,TResult Function( TinderCardStatus status,  String matchedID)?  create,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _StartListening() when startListening != null:
return startListening();case _Create() when create != null:
return create(_that.status,_that.matchedID);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  startListening,required TResult Function( TinderCardStatus status,  String matchedID)  create,}) {final _that = this;
switch (_that) {
case _StartListening():
return startListening();case _Create():
return create(_that.status,_that.matchedID);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  startListening,TResult? Function( TinderCardStatus status,  String matchedID)?  create,}) {final _that = this;
switch (_that) {
case _StartListening() when startListening != null:
return startListening();case _Create() when create != null:
return create(_that.status,_that.matchedID);case _:
  return null;

}
}

}

/// @nodoc


class _StartListening implements MatchesEvent {
  const _StartListening();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _StartListening);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'MatchesEvent.startListening()';
}


}




/// @nodoc


class _Create implements MatchesEvent {
  const _Create({required this.status, required this.matchedID});
  

 final  TinderCardStatus status;
 final  String matchedID;

/// Create a copy of MatchesEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CreateCopyWith<_Create> get copyWith => __$CreateCopyWithImpl<_Create>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Create&&(identical(other.status, status) || other.status == status)&&(identical(other.matchedID, matchedID) || other.matchedID == matchedID));
}


@override
int get hashCode => Object.hash(runtimeType,status,matchedID);

@override
String toString() {
  return 'MatchesEvent.create(status: $status, matchedID: $matchedID)';
}


}

/// @nodoc
abstract mixin class _$CreateCopyWith<$Res> implements $MatchesEventCopyWith<$Res> {
  factory _$CreateCopyWith(_Create value, $Res Function(_Create) _then) = __$CreateCopyWithImpl;
@useResult
$Res call({
 TinderCardStatus status, String matchedID
});




}
/// @nodoc
class __$CreateCopyWithImpl<$Res>
    implements _$CreateCopyWith<$Res> {
  __$CreateCopyWithImpl(this._self, this._then);

  final _Create _self;
  final $Res Function(_Create) _then;

/// Create a copy of MatchesEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? status = null,Object? matchedID = null,}) {
  return _then(_Create(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as TinderCardStatus,matchedID: null == matchedID ? _self.matchedID : matchedID // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc
mixin _$MatchesState {

 MatchesStatus get status; String get errorMessage; Matches? get userMatch;
/// Create a copy of MatchesState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MatchesStateCopyWith<MatchesState> get copyWith => _$MatchesStateCopyWithImpl<MatchesState>(this as MatchesState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MatchesState&&(identical(other.status, status) || other.status == status)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage)&&(identical(other.userMatch, userMatch) || other.userMatch == userMatch));
}


@override
int get hashCode => Object.hash(runtimeType,status,errorMessage,userMatch);

@override
String toString() {
  return 'MatchesState(status: $status, errorMessage: $errorMessage, userMatch: $userMatch)';
}


}

/// @nodoc
abstract mixin class $MatchesStateCopyWith<$Res>  {
  factory $MatchesStateCopyWith(MatchesState value, $Res Function(MatchesState) _then) = _$MatchesStateCopyWithImpl;
@useResult
$Res call({
 MatchesStatus status, String errorMessage, Matches? userMatch
});


$MatchesCopyWith<$Res>? get userMatch;

}
/// @nodoc
class _$MatchesStateCopyWithImpl<$Res>
    implements $MatchesStateCopyWith<$Res> {
  _$MatchesStateCopyWithImpl(this._self, this._then);

  final MatchesState _self;
  final $Res Function(MatchesState) _then;

/// Create a copy of MatchesState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = null,Object? errorMessage = null,Object? userMatch = freezed,}) {
  return _then(_self.copyWith(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as MatchesStatus,errorMessage: null == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String,userMatch: freezed == userMatch ? _self.userMatch : userMatch // ignore: cast_nullable_to_non_nullable
as Matches?,
  ));
}
/// Create a copy of MatchesState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MatchesCopyWith<$Res>? get userMatch {
    if (_self.userMatch == null) {
    return null;
  }

  return $MatchesCopyWith<$Res>(_self.userMatch!, (value) {
    return _then(_self.copyWith(userMatch: value));
  });
}
}


/// Adds pattern-matching-related methods to [MatchesState].
extension MatchesStatePatterns on MatchesState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MatchesState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MatchesState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MatchesState value)  $default,){
final _that = this;
switch (_that) {
case _MatchesState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MatchesState value)?  $default,){
final _that = this;
switch (_that) {
case _MatchesState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( MatchesStatus status,  String errorMessage,  Matches? userMatch)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MatchesState() when $default != null:
return $default(_that.status,_that.errorMessage,_that.userMatch);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( MatchesStatus status,  String errorMessage,  Matches? userMatch)  $default,) {final _that = this;
switch (_that) {
case _MatchesState():
return $default(_that.status,_that.errorMessage,_that.userMatch);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( MatchesStatus status,  String errorMessage,  Matches? userMatch)?  $default,) {final _that = this;
switch (_that) {
case _MatchesState() when $default != null:
return $default(_that.status,_that.errorMessage,_that.userMatch);case _:
  return null;

}
}

}

/// @nodoc


class _MatchesState implements MatchesState {
  const _MatchesState({this.status = MatchesStatus.initial, this.errorMessage = '', this.userMatch});
  

@override@JsonKey() final  MatchesStatus status;
@override@JsonKey() final  String errorMessage;
@override final  Matches? userMatch;

/// Create a copy of MatchesState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MatchesStateCopyWith<_MatchesState> get copyWith => __$MatchesStateCopyWithImpl<_MatchesState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MatchesState&&(identical(other.status, status) || other.status == status)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage)&&(identical(other.userMatch, userMatch) || other.userMatch == userMatch));
}


@override
int get hashCode => Object.hash(runtimeType,status,errorMessage,userMatch);

@override
String toString() {
  return 'MatchesState(status: $status, errorMessage: $errorMessage, userMatch: $userMatch)';
}


}

/// @nodoc
abstract mixin class _$MatchesStateCopyWith<$Res> implements $MatchesStateCopyWith<$Res> {
  factory _$MatchesStateCopyWith(_MatchesState value, $Res Function(_MatchesState) _then) = __$MatchesStateCopyWithImpl;
@override @useResult
$Res call({
 MatchesStatus status, String errorMessage, Matches? userMatch
});


@override $MatchesCopyWith<$Res>? get userMatch;

}
/// @nodoc
class __$MatchesStateCopyWithImpl<$Res>
    implements _$MatchesStateCopyWith<$Res> {
  __$MatchesStateCopyWithImpl(this._self, this._then);

  final _MatchesState _self;
  final $Res Function(_MatchesState) _then;

/// Create a copy of MatchesState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = null,Object? errorMessage = null,Object? userMatch = freezed,}) {
  return _then(_MatchesState(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as MatchesStatus,errorMessage: null == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String,userMatch: freezed == userMatch ? _self.userMatch : userMatch // ignore: cast_nullable_to_non_nullable
as Matches?,
  ));
}

/// Create a copy of MatchesState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MatchesCopyWith<$Res>? get userMatch {
    if (_self.userMatch == null) {
    return null;
  }

  return $MatchesCopyWith<$Res>(_self.userMatch!, (value) {
    return _then(_self.copyWith(userMatch: value));
  });
}
}

// dart format on
