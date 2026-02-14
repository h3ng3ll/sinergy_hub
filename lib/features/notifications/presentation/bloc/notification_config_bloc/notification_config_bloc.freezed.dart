// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'notification_config_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$NotificationConfigEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NotificationConfigEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'NotificationConfigEvent()';
}


}

/// @nodoc
class $NotificationConfigEventCopyWith<$Res>  {
$NotificationConfigEventCopyWith(NotificationConfigEvent _, $Res Function(NotificationConfigEvent) __);
}


/// Adds pattern-matching-related methods to [NotificationConfigEvent].
extension NotificationConfigEventPatterns on NotificationConfigEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Init value)?  init,TResult Function( _Save value)?  save,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Init() when init != null:
return init(_that);case _Save() when save != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Init value)  init,required TResult Function( _Save value)  save,}){
final _that = this;
switch (_that) {
case _Init():
return init(_that);case _Save():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Init value)?  init,TResult? Function( _Save value)?  save,}){
final _that = this;
switch (_that) {
case _Init() when init != null:
return init(_that);case _Save() when save != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  init,TResult Function( bool? isEnabledNotifications)?  save,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Init() when init != null:
return init();case _Save() when save != null:
return save(_that.isEnabledNotifications);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  init,required TResult Function( bool? isEnabledNotifications)  save,}) {final _that = this;
switch (_that) {
case _Init():
return init();case _Save():
return save(_that.isEnabledNotifications);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  init,TResult? Function( bool? isEnabledNotifications)?  save,}) {final _that = this;
switch (_that) {
case _Init() when init != null:
return init();case _Save() when save != null:
return save(_that.isEnabledNotifications);case _:
  return null;

}
}

}

/// @nodoc


class _Init implements NotificationConfigEvent {
  const _Init();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Init);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'NotificationConfigEvent.init()';
}


}




/// @nodoc


class _Save implements NotificationConfigEvent {
  const _Save({this.isEnabledNotifications});
  

 final  bool? isEnabledNotifications;

/// Create a copy of NotificationConfigEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SaveCopyWith<_Save> get copyWith => __$SaveCopyWithImpl<_Save>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Save&&(identical(other.isEnabledNotifications, isEnabledNotifications) || other.isEnabledNotifications == isEnabledNotifications));
}


@override
int get hashCode => Object.hash(runtimeType,isEnabledNotifications);

@override
String toString() {
  return 'NotificationConfigEvent.save(isEnabledNotifications: $isEnabledNotifications)';
}


}

/// @nodoc
abstract mixin class _$SaveCopyWith<$Res> implements $NotificationConfigEventCopyWith<$Res> {
  factory _$SaveCopyWith(_Save value, $Res Function(_Save) _then) = __$SaveCopyWithImpl;
@useResult
$Res call({
 bool? isEnabledNotifications
});




}
/// @nodoc
class __$SaveCopyWithImpl<$Res>
    implements _$SaveCopyWith<$Res> {
  __$SaveCopyWithImpl(this._self, this._then);

  final _Save _self;
  final $Res Function(_Save) _then;

/// Create a copy of NotificationConfigEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? isEnabledNotifications = freezed,}) {
  return _then(_Save(
isEnabledNotifications: freezed == isEnabledNotifications ? _self.isEnabledNotifications : isEnabledNotifications // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}


}

/// @nodoc
mixin _$NotificationConfigState {

 NotificationConfig get config; NotificationConfigStatus get status; String get errorMessage;
/// Create a copy of NotificationConfigState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NotificationConfigStateCopyWith<NotificationConfigState> get copyWith => _$NotificationConfigStateCopyWithImpl<NotificationConfigState>(this as NotificationConfigState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NotificationConfigState&&(identical(other.config, config) || other.config == config)&&(identical(other.status, status) || other.status == status)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,config,status,errorMessage);

@override
String toString() {
  return 'NotificationConfigState(config: $config, status: $status, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class $NotificationConfigStateCopyWith<$Res>  {
  factory $NotificationConfigStateCopyWith(NotificationConfigState value, $Res Function(NotificationConfigState) _then) = _$NotificationConfigStateCopyWithImpl;
@useResult
$Res call({
 NotificationConfig config, NotificationConfigStatus status, String errorMessage
});


$NotificationConfigCopyWith<$Res> get config;

}
/// @nodoc
class _$NotificationConfigStateCopyWithImpl<$Res>
    implements $NotificationConfigStateCopyWith<$Res> {
  _$NotificationConfigStateCopyWithImpl(this._self, this._then);

  final NotificationConfigState _self;
  final $Res Function(NotificationConfigState) _then;

/// Create a copy of NotificationConfigState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? config = null,Object? status = null,Object? errorMessage = null,}) {
  return _then(_self.copyWith(
config: null == config ? _self.config : config // ignore: cast_nullable_to_non_nullable
as NotificationConfig,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as NotificationConfigStatus,errorMessage: null == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String,
  ));
}
/// Create a copy of NotificationConfigState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$NotificationConfigCopyWith<$Res> get config {
  
  return $NotificationConfigCopyWith<$Res>(_self.config, (value) {
    return _then(_self.copyWith(config: value));
  });
}
}


/// Adds pattern-matching-related methods to [NotificationConfigState].
extension NotificationConfigStatePatterns on NotificationConfigState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _NotificationConfigState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _NotificationConfigState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _NotificationConfigState value)  $default,){
final _that = this;
switch (_that) {
case _NotificationConfigState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _NotificationConfigState value)?  $default,){
final _that = this;
switch (_that) {
case _NotificationConfigState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( NotificationConfig config,  NotificationConfigStatus status,  String errorMessage)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _NotificationConfigState() when $default != null:
return $default(_that.config,_that.status,_that.errorMessage);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( NotificationConfig config,  NotificationConfigStatus status,  String errorMessage)  $default,) {final _that = this;
switch (_that) {
case _NotificationConfigState():
return $default(_that.config,_that.status,_that.errorMessage);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( NotificationConfig config,  NotificationConfigStatus status,  String errorMessage)?  $default,) {final _that = this;
switch (_that) {
case _NotificationConfigState() when $default != null:
return $default(_that.config,_that.status,_that.errorMessage);case _:
  return null;

}
}

}

/// @nodoc


class _NotificationConfigState implements NotificationConfigState {
  const _NotificationConfigState({this.config = const NotificationConfig(), this.status = NotificationConfigStatus.initial, this.errorMessage = ''});
  

@override@JsonKey() final  NotificationConfig config;
@override@JsonKey() final  NotificationConfigStatus status;
@override@JsonKey() final  String errorMessage;

/// Create a copy of NotificationConfigState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$NotificationConfigStateCopyWith<_NotificationConfigState> get copyWith => __$NotificationConfigStateCopyWithImpl<_NotificationConfigState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _NotificationConfigState&&(identical(other.config, config) || other.config == config)&&(identical(other.status, status) || other.status == status)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,config,status,errorMessage);

@override
String toString() {
  return 'NotificationConfigState(config: $config, status: $status, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class _$NotificationConfigStateCopyWith<$Res> implements $NotificationConfigStateCopyWith<$Res> {
  factory _$NotificationConfigStateCopyWith(_NotificationConfigState value, $Res Function(_NotificationConfigState) _then) = __$NotificationConfigStateCopyWithImpl;
@override @useResult
$Res call({
 NotificationConfig config, NotificationConfigStatus status, String errorMessage
});


@override $NotificationConfigCopyWith<$Res> get config;

}
/// @nodoc
class __$NotificationConfigStateCopyWithImpl<$Res>
    implements _$NotificationConfigStateCopyWith<$Res> {
  __$NotificationConfigStateCopyWithImpl(this._self, this._then);

  final _NotificationConfigState _self;
  final $Res Function(_NotificationConfigState) _then;

/// Create a copy of NotificationConfigState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? config = null,Object? status = null,Object? errorMessage = null,}) {
  return _then(_NotificationConfigState(
config: null == config ? _self.config : config // ignore: cast_nullable_to_non_nullable
as NotificationConfig,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as NotificationConfigStatus,errorMessage: null == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

/// Create a copy of NotificationConfigState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$NotificationConfigCopyWith<$Res> get config {
  
  return $NotificationConfigCopyWith<$Res>(_self.config, (value) {
    return _then(_self.copyWith(config: value));
  });
}
}

// dart format on
