// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'match_result_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$MatchResultEvent {

 String get matchId;
/// Create a copy of MatchResultEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MatchResultEventCopyWith<MatchResultEvent> get copyWith => _$MatchResultEventCopyWithImpl<MatchResultEvent>(this as MatchResultEvent, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MatchResultEvent&&(identical(other.matchId, matchId) || other.matchId == matchId));
}


@override
int get hashCode => Object.hash(runtimeType,matchId);

@override
String toString() {
  return 'MatchResultEvent(matchId: $matchId)';
}


}

/// @nodoc
abstract mixin class $MatchResultEventCopyWith<$Res>  {
  factory $MatchResultEventCopyWith(MatchResultEvent value, $Res Function(MatchResultEvent) _then) = _$MatchResultEventCopyWithImpl;
@useResult
$Res call({
 String matchId
});




}
/// @nodoc
class _$MatchResultEventCopyWithImpl<$Res>
    implements $MatchResultEventCopyWith<$Res> {
  _$MatchResultEventCopyWithImpl(this._self, this._then);

  final MatchResultEvent _self;
  final $Res Function(MatchResultEvent) _then;

/// Create a copy of MatchResultEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? matchId = null,}) {
  return _then(_self.copyWith(
matchId: null == matchId ? _self.matchId : matchId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [MatchResultEvent].
extension MatchResultEventPatterns on MatchResultEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _GetResult value)?  getResult,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _GetResult() when getResult != null:
return getResult(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _GetResult value)  getResult,}){
final _that = this;
switch (_that) {
case _GetResult():
return getResult(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _GetResult value)?  getResult,}){
final _that = this;
switch (_that) {
case _GetResult() when getResult != null:
return getResult(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String matchId)?  getResult,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _GetResult() when getResult != null:
return getResult(_that.matchId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String matchId)  getResult,}) {final _that = this;
switch (_that) {
case _GetResult():
return getResult(_that.matchId);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String matchId)?  getResult,}) {final _that = this;
switch (_that) {
case _GetResult() when getResult != null:
return getResult(_that.matchId);case _:
  return null;

}
}

}

/// @nodoc


class _GetResult implements MatchResultEvent {
  const _GetResult({required this.matchId});
  

@override final  String matchId;

/// Create a copy of MatchResultEvent
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GetResultCopyWith<_GetResult> get copyWith => __$GetResultCopyWithImpl<_GetResult>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GetResult&&(identical(other.matchId, matchId) || other.matchId == matchId));
}


@override
int get hashCode => Object.hash(runtimeType,matchId);

@override
String toString() {
  return 'MatchResultEvent.getResult(matchId: $matchId)';
}


}

/// @nodoc
abstract mixin class _$GetResultCopyWith<$Res> implements $MatchResultEventCopyWith<$Res> {
  factory _$GetResultCopyWith(_GetResult value, $Res Function(_GetResult) _then) = __$GetResultCopyWithImpl;
@override @useResult
$Res call({
 String matchId
});




}
/// @nodoc
class __$GetResultCopyWithImpl<$Res>
    implements _$GetResultCopyWith<$Res> {
  __$GetResultCopyWithImpl(this._self, this._then);

  final _GetResult _self;
  final $Res Function(_GetResult) _then;

/// Create a copy of MatchResultEvent
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? matchId = null,}) {
  return _then(_GetResult(
matchId: null == matchId ? _self.matchId : matchId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc
mixin _$MatchResultState {

 MatchResultStatus get status; String get errorMessage; Matches? get match; UserData? get user;
/// Create a copy of MatchResultState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MatchResultStateCopyWith<MatchResultState> get copyWith => _$MatchResultStateCopyWithImpl<MatchResultState>(this as MatchResultState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MatchResultState&&(identical(other.status, status) || other.status == status)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage)&&(identical(other.match, match) || other.match == match)&&(identical(other.user, user) || other.user == user));
}


@override
int get hashCode => Object.hash(runtimeType,status,errorMessage,match,user);

@override
String toString() {
  return 'MatchResultState(status: $status, errorMessage: $errorMessage, match: $match, user: $user)';
}


}

/// @nodoc
abstract mixin class $MatchResultStateCopyWith<$Res>  {
  factory $MatchResultStateCopyWith(MatchResultState value, $Res Function(MatchResultState) _then) = _$MatchResultStateCopyWithImpl;
@useResult
$Res call({
 MatchResultStatus status, String errorMessage, Matches? match, UserData? user
});


$MatchesCopyWith<$Res>? get match;$UserDataCopyWith<$Res>? get user;

}
/// @nodoc
class _$MatchResultStateCopyWithImpl<$Res>
    implements $MatchResultStateCopyWith<$Res> {
  _$MatchResultStateCopyWithImpl(this._self, this._then);

  final MatchResultState _self;
  final $Res Function(MatchResultState) _then;

/// Create a copy of MatchResultState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = null,Object? errorMessage = null,Object? match = freezed,Object? user = freezed,}) {
  return _then(_self.copyWith(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as MatchResultStatus,errorMessage: null == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String,match: freezed == match ? _self.match : match // ignore: cast_nullable_to_non_nullable
as Matches?,user: freezed == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as UserData?,
  ));
}
/// Create a copy of MatchResultState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MatchesCopyWith<$Res>? get match {
    if (_self.match == null) {
    return null;
  }

  return $MatchesCopyWith<$Res>(_self.match!, (value) {
    return _then(_self.copyWith(match: value));
  });
}/// Create a copy of MatchResultState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserDataCopyWith<$Res>? get user {
    if (_self.user == null) {
    return null;
  }

  return $UserDataCopyWith<$Res>(_self.user!, (value) {
    return _then(_self.copyWith(user: value));
  });
}
}


/// Adds pattern-matching-related methods to [MatchResultState].
extension MatchResultStatePatterns on MatchResultState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MatchResultState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MatchResultState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MatchResultState value)  $default,){
final _that = this;
switch (_that) {
case _MatchResultState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MatchResultState value)?  $default,){
final _that = this;
switch (_that) {
case _MatchResultState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( MatchResultStatus status,  String errorMessage,  Matches? match,  UserData? user)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MatchResultState() when $default != null:
return $default(_that.status,_that.errorMessage,_that.match,_that.user);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( MatchResultStatus status,  String errorMessage,  Matches? match,  UserData? user)  $default,) {final _that = this;
switch (_that) {
case _MatchResultState():
return $default(_that.status,_that.errorMessage,_that.match,_that.user);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( MatchResultStatus status,  String errorMessage,  Matches? match,  UserData? user)?  $default,) {final _that = this;
switch (_that) {
case _MatchResultState() when $default != null:
return $default(_that.status,_that.errorMessage,_that.match,_that.user);case _:
  return null;

}
}

}

/// @nodoc


class _MatchResultState implements MatchResultState {
  const _MatchResultState({this.status = MatchResultStatus.initial, this.errorMessage = '', this.match, this.user});
  

@override@JsonKey() final  MatchResultStatus status;
@override@JsonKey() final  String errorMessage;
@override final  Matches? match;
@override final  UserData? user;

/// Create a copy of MatchResultState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MatchResultStateCopyWith<_MatchResultState> get copyWith => __$MatchResultStateCopyWithImpl<_MatchResultState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MatchResultState&&(identical(other.status, status) || other.status == status)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage)&&(identical(other.match, match) || other.match == match)&&(identical(other.user, user) || other.user == user));
}


@override
int get hashCode => Object.hash(runtimeType,status,errorMessage,match,user);

@override
String toString() {
  return 'MatchResultState(status: $status, errorMessage: $errorMessage, match: $match, user: $user)';
}


}

/// @nodoc
abstract mixin class _$MatchResultStateCopyWith<$Res> implements $MatchResultStateCopyWith<$Res> {
  factory _$MatchResultStateCopyWith(_MatchResultState value, $Res Function(_MatchResultState) _then) = __$MatchResultStateCopyWithImpl;
@override @useResult
$Res call({
 MatchResultStatus status, String errorMessage, Matches? match, UserData? user
});


@override $MatchesCopyWith<$Res>? get match;@override $UserDataCopyWith<$Res>? get user;

}
/// @nodoc
class __$MatchResultStateCopyWithImpl<$Res>
    implements _$MatchResultStateCopyWith<$Res> {
  __$MatchResultStateCopyWithImpl(this._self, this._then);

  final _MatchResultState _self;
  final $Res Function(_MatchResultState) _then;

/// Create a copy of MatchResultState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = null,Object? errorMessage = null,Object? match = freezed,Object? user = freezed,}) {
  return _then(_MatchResultState(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as MatchResultStatus,errorMessage: null == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String,match: freezed == match ? _self.match : match // ignore: cast_nullable_to_non_nullable
as Matches?,user: freezed == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as UserData?,
  ));
}

/// Create a copy of MatchResultState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MatchesCopyWith<$Res>? get match {
    if (_self.match == null) {
    return null;
  }

  return $MatchesCopyWith<$Res>(_self.match!, (value) {
    return _then(_self.copyWith(match: value));
  });
}/// Create a copy of MatchResultState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserDataCopyWith<$Res>? get user {
    if (_self.user == null) {
    return null;
  }

  return $UserDataCopyWith<$Res>(_self.user!, (value) {
    return _then(_self.copyWith(user: value));
  });
}
}

// dart format on
