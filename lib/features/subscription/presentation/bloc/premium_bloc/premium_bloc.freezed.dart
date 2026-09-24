// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'premium_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$PremiumEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PremiumEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'PremiumEvent()';
}


}

/// @nodoc
class $PremiumEventCopyWith<$Res>  {
$PremiumEventCopyWith(PremiumEvent _, $Res Function(PremiumEvent) __);
}


/// Adds pattern-matching-related methods to [PremiumEvent].
extension PremiumEventPatterns on PremiumEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Init value)?  init,TResult Function( _Reset value)?  reset,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Init() when init != null:
return init(_that);case _Reset() when reset != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Init value)  init,required TResult Function( _Reset value)  reset,}){
final _that = this;
switch (_that) {
case _Init():
return init(_that);case _Reset():
return reset(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Init value)?  init,TResult? Function( _Reset value)?  reset,}){
final _that = this;
switch (_that) {
case _Init() when init != null:
return init(_that);case _Reset() when reset != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String uid)?  init,TResult Function()?  reset,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Init() when init != null:
return init(_that.uid);case _Reset() when reset != null:
return reset();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String uid)  init,required TResult Function()  reset,}) {final _that = this;
switch (_that) {
case _Init():
return init(_that.uid);case _Reset():
return reset();case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String uid)?  init,TResult? Function()?  reset,}) {final _that = this;
switch (_that) {
case _Init() when init != null:
return init(_that.uid);case _Reset() when reset != null:
return reset();case _:
  return null;

}
}

}

/// @nodoc


class _Init implements PremiumEvent {
  const _Init({required this.uid});
  

 final  String uid;

/// Create a copy of PremiumEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$InitCopyWith<_Init> get copyWith => __$InitCopyWithImpl<_Init>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Init&&(identical(other.uid, uid) || other.uid == uid));
}


@override
int get hashCode => Object.hash(runtimeType,uid);

@override
String toString() {
  return 'PremiumEvent.init(uid: $uid)';
}


}

/// @nodoc
abstract mixin class _$InitCopyWith<$Res> implements $PremiumEventCopyWith<$Res> {
  factory _$InitCopyWith(_Init value, $Res Function(_Init) _then) = __$InitCopyWithImpl;
@useResult
$Res call({
 String uid
});




}
/// @nodoc
class __$InitCopyWithImpl<$Res>
    implements _$InitCopyWith<$Res> {
  __$InitCopyWithImpl(this._self, this._then);

  final _Init _self;
  final $Res Function(_Init) _then;

/// Create a copy of PremiumEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? uid = null,}) {
  return _then(_Init(
uid: null == uid ? _self.uid : uid // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _Reset implements PremiumEvent {
  const _Reset();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Reset);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'PremiumEvent.reset()';
}


}




/// @nodoc
mixin _$PremiumState {

 EPremiumStatus get status; bool get isPremium; PremiumStatus? get premiumStatus; String get errorMessage;
/// Create a copy of PremiumState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PremiumStateCopyWith<PremiumState> get copyWith => _$PremiumStateCopyWithImpl<PremiumState>(this as PremiumState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PremiumState&&(identical(other.status, status) || other.status == status)&&(identical(other.isPremium, isPremium) || other.isPremium == isPremium)&&(identical(other.premiumStatus, premiumStatus) || other.premiumStatus == premiumStatus)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,status,isPremium,premiumStatus,errorMessage);

@override
String toString() {
  return 'PremiumState(status: $status, isPremium: $isPremium, premiumStatus: $premiumStatus, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class $PremiumStateCopyWith<$Res>  {
  factory $PremiumStateCopyWith(PremiumState value, $Res Function(PremiumState) _then) = _$PremiumStateCopyWithImpl;
@useResult
$Res call({
 EPremiumStatus status, bool isPremium, PremiumStatus? premiumStatus, String errorMessage
});


$PremiumStatusCopyWith<$Res>? get premiumStatus;

}
/// @nodoc
class _$PremiumStateCopyWithImpl<$Res>
    implements $PremiumStateCopyWith<$Res> {
  _$PremiumStateCopyWithImpl(this._self, this._then);

  final PremiumState _self;
  final $Res Function(PremiumState) _then;

/// Create a copy of PremiumState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = null,Object? isPremium = null,Object? premiumStatus = freezed,Object? errorMessage = null,}) {
  return _then(_self.copyWith(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as EPremiumStatus,isPremium: null == isPremium ? _self.isPremium : isPremium // ignore: cast_nullable_to_non_nullable
as bool,premiumStatus: freezed == premiumStatus ? _self.premiumStatus : premiumStatus // ignore: cast_nullable_to_non_nullable
as PremiumStatus?,errorMessage: null == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String,
  ));
}
/// Create a copy of PremiumState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PremiumStatusCopyWith<$Res>? get premiumStatus {
    if (_self.premiumStatus == null) {
    return null;
  }

  return $PremiumStatusCopyWith<$Res>(_self.premiumStatus!, (value) {
    return _then(_self.copyWith(premiumStatus: value));
  });
}
}


/// Adds pattern-matching-related methods to [PremiumState].
extension PremiumStatePatterns on PremiumState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PremiumState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PremiumState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PremiumState value)  $default,){
final _that = this;
switch (_that) {
case _PremiumState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PremiumState value)?  $default,){
final _that = this;
switch (_that) {
case _PremiumState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( EPremiumStatus status,  bool isPremium,  PremiumStatus? premiumStatus,  String errorMessage)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PremiumState() when $default != null:
return $default(_that.status,_that.isPremium,_that.premiumStatus,_that.errorMessage);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( EPremiumStatus status,  bool isPremium,  PremiumStatus? premiumStatus,  String errorMessage)  $default,) {final _that = this;
switch (_that) {
case _PremiumState():
return $default(_that.status,_that.isPremium,_that.premiumStatus,_that.errorMessage);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( EPremiumStatus status,  bool isPremium,  PremiumStatus? premiumStatus,  String errorMessage)?  $default,) {final _that = this;
switch (_that) {
case _PremiumState() when $default != null:
return $default(_that.status,_that.isPremium,_that.premiumStatus,_that.errorMessage);case _:
  return null;

}
}

}

/// @nodoc


class _PremiumState implements PremiumState {
  const _PremiumState({this.status = EPremiumStatus.initial, this.isPremium = false, this.premiumStatus, this.errorMessage = ''});
  

@override@JsonKey() final  EPremiumStatus status;
@override@JsonKey() final  bool isPremium;
@override final  PremiumStatus? premiumStatus;
@override@JsonKey() final  String errorMessage;

/// Create a copy of PremiumState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PremiumStateCopyWith<_PremiumState> get copyWith => __$PremiumStateCopyWithImpl<_PremiumState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PremiumState&&(identical(other.status, status) || other.status == status)&&(identical(other.isPremium, isPremium) || other.isPremium == isPremium)&&(identical(other.premiumStatus, premiumStatus) || other.premiumStatus == premiumStatus)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,status,isPremium,premiumStatus,errorMessage);

@override
String toString() {
  return 'PremiumState(status: $status, isPremium: $isPremium, premiumStatus: $premiumStatus, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class _$PremiumStateCopyWith<$Res> implements $PremiumStateCopyWith<$Res> {
  factory _$PremiumStateCopyWith(_PremiumState value, $Res Function(_PremiumState) _then) = __$PremiumStateCopyWithImpl;
@override @useResult
$Res call({
 EPremiumStatus status, bool isPremium, PremiumStatus? premiumStatus, String errorMessage
});


@override $PremiumStatusCopyWith<$Res>? get premiumStatus;

}
/// @nodoc
class __$PremiumStateCopyWithImpl<$Res>
    implements _$PremiumStateCopyWith<$Res> {
  __$PremiumStateCopyWithImpl(this._self, this._then);

  final _PremiumState _self;
  final $Res Function(_PremiumState) _then;

/// Create a copy of PremiumState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = null,Object? isPremium = null,Object? premiumStatus = freezed,Object? errorMessage = null,}) {
  return _then(_PremiumState(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as EPremiumStatus,isPremium: null == isPremium ? _self.isPremium : isPremium // ignore: cast_nullable_to_non_nullable
as bool,premiumStatus: freezed == premiumStatus ? _self.premiumStatus : premiumStatus // ignore: cast_nullable_to_non_nullable
as PremiumStatus?,errorMessage: null == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

/// Create a copy of PremiumState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PremiumStatusCopyWith<$Res>? get premiumStatus {
    if (_self.premiumStatus == null) {
    return null;
  }

  return $PremiumStatusCopyWith<$Res>(_self.premiumStatus!, (value) {
    return _then(_self.copyWith(premiumStatus: value));
  });
}
}

// dart format on
