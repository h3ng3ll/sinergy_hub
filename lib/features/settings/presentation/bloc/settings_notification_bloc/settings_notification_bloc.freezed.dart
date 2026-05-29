// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'settings_notification_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$SettingsNotificationEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SettingsNotificationEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SettingsNotificationEvent()';
}


}

/// @nodoc
class $SettingsNotificationEventCopyWith<$Res>  {
$SettingsNotificationEventCopyWith(SettingsNotificationEvent _, $Res Function(SettingsNotificationEvent) __);
}


/// Adds pattern-matching-related methods to [SettingsNotificationEvent].
extension SettingsNotificationEventPatterns on SettingsNotificationEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Load value)?  load,TResult Function( _Toggle value)?  toggle,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Load() when load != null:
return load(_that);case _Toggle() when toggle != null:
return toggle(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Load value)  load,required TResult Function( _Toggle value)  toggle,}){
final _that = this;
switch (_that) {
case _Load():
return load(_that);case _Toggle():
return toggle(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Load value)?  load,TResult? Function( _Toggle value)?  toggle,}){
final _that = this;
switch (_that) {
case _Load() when load != null:
return load(_that);case _Toggle() when toggle != null:
return toggle(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  load,TResult Function( bool enabled)?  toggle,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Load() when load != null:
return load();case _Toggle() when toggle != null:
return toggle(_that.enabled);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  load,required TResult Function( bool enabled)  toggle,}) {final _that = this;
switch (_that) {
case _Load():
return load();case _Toggle():
return toggle(_that.enabled);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  load,TResult? Function( bool enabled)?  toggle,}) {final _that = this;
switch (_that) {
case _Load() when load != null:
return load();case _Toggle() when toggle != null:
return toggle(_that.enabled);case _:
  return null;

}
}

}

/// @nodoc


class _Load implements SettingsNotificationEvent {
  const _Load();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Load);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SettingsNotificationEvent.load()';
}


}




/// @nodoc


class _Toggle implements SettingsNotificationEvent {
  const _Toggle({required this.enabled});
  

 final  bool enabled;

/// Create a copy of SettingsNotificationEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ToggleCopyWith<_Toggle> get copyWith => __$ToggleCopyWithImpl<_Toggle>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Toggle&&(identical(other.enabled, enabled) || other.enabled == enabled));
}


@override
int get hashCode => Object.hash(runtimeType,enabled);

@override
String toString() {
  return 'SettingsNotificationEvent.toggle(enabled: $enabled)';
}


}

/// @nodoc
abstract mixin class _$ToggleCopyWith<$Res> implements $SettingsNotificationEventCopyWith<$Res> {
  factory _$ToggleCopyWith(_Toggle value, $Res Function(_Toggle) _then) = __$ToggleCopyWithImpl;
@useResult
$Res call({
 bool enabled
});




}
/// @nodoc
class __$ToggleCopyWithImpl<$Res>
    implements _$ToggleCopyWith<$Res> {
  __$ToggleCopyWithImpl(this._self, this._then);

  final _Toggle _self;
  final $Res Function(_Toggle) _then;

/// Create a copy of SettingsNotificationEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? enabled = null,}) {
  return _then(_Toggle(
enabled: null == enabled ? _self.enabled : enabled // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

/// @nodoc
mixin _$SettingsNotificationState {

 ESettingsNotificationStatus get status; NotificationConfig get config; bool get enabledNotifications; String get errorMessage;
/// Create a copy of SettingsNotificationState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SettingsNotificationStateCopyWith<SettingsNotificationState> get copyWith => _$SettingsNotificationStateCopyWithImpl<SettingsNotificationState>(this as SettingsNotificationState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SettingsNotificationState&&(identical(other.status, status) || other.status == status)&&(identical(other.config, config) || other.config == config)&&(identical(other.enabledNotifications, enabledNotifications) || other.enabledNotifications == enabledNotifications)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,status,config,enabledNotifications,errorMessage);

@override
String toString() {
  return 'SettingsNotificationState(status: $status, config: $config, enabledNotifications: $enabledNotifications, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class $SettingsNotificationStateCopyWith<$Res>  {
  factory $SettingsNotificationStateCopyWith(SettingsNotificationState value, $Res Function(SettingsNotificationState) _then) = _$SettingsNotificationStateCopyWithImpl;
@useResult
$Res call({
 ESettingsNotificationStatus status, NotificationConfig config, bool enabledNotifications, String errorMessage
});


$NotificationConfigCopyWith<$Res> get config;

}
/// @nodoc
class _$SettingsNotificationStateCopyWithImpl<$Res>
    implements $SettingsNotificationStateCopyWith<$Res> {
  _$SettingsNotificationStateCopyWithImpl(this._self, this._then);

  final SettingsNotificationState _self;
  final $Res Function(SettingsNotificationState) _then;

/// Create a copy of SettingsNotificationState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = null,Object? config = null,Object? enabledNotifications = null,Object? errorMessage = null,}) {
  return _then(_self.copyWith(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as ESettingsNotificationStatus,config: null == config ? _self.config : config // ignore: cast_nullable_to_non_nullable
as NotificationConfig,enabledNotifications: null == enabledNotifications ? _self.enabledNotifications : enabledNotifications // ignore: cast_nullable_to_non_nullable
as bool,errorMessage: null == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String,
  ));
}
/// Create a copy of SettingsNotificationState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$NotificationConfigCopyWith<$Res> get config {
  
  return $NotificationConfigCopyWith<$Res>(_self.config, (value) {
    return _then(_self.copyWith(config: value));
  });
}
}


/// Adds pattern-matching-related methods to [SettingsNotificationState].
extension SettingsNotificationStatePatterns on SettingsNotificationState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SettingsNotificationState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SettingsNotificationState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SettingsNotificationState value)  $default,){
final _that = this;
switch (_that) {
case _SettingsNotificationState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SettingsNotificationState value)?  $default,){
final _that = this;
switch (_that) {
case _SettingsNotificationState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( ESettingsNotificationStatus status,  NotificationConfig config,  bool enabledNotifications,  String errorMessage)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SettingsNotificationState() when $default != null:
return $default(_that.status,_that.config,_that.enabledNotifications,_that.errorMessage);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( ESettingsNotificationStatus status,  NotificationConfig config,  bool enabledNotifications,  String errorMessage)  $default,) {final _that = this;
switch (_that) {
case _SettingsNotificationState():
return $default(_that.status,_that.config,_that.enabledNotifications,_that.errorMessage);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( ESettingsNotificationStatus status,  NotificationConfig config,  bool enabledNotifications,  String errorMessage)?  $default,) {final _that = this;
switch (_that) {
case _SettingsNotificationState() when $default != null:
return $default(_that.status,_that.config,_that.enabledNotifications,_that.errorMessage);case _:
  return null;

}
}

}

/// @nodoc


class _SettingsNotificationState implements SettingsNotificationState {
  const _SettingsNotificationState({this.status = ESettingsNotificationStatus.initial, this.config = const NotificationConfig(), this.enabledNotifications = true, this.errorMessage = ''});
  

@override@JsonKey() final  ESettingsNotificationStatus status;
@override@JsonKey() final  NotificationConfig config;
@override@JsonKey() final  bool enabledNotifications;
@override@JsonKey() final  String errorMessage;

/// Create a copy of SettingsNotificationState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SettingsNotificationStateCopyWith<_SettingsNotificationState> get copyWith => __$SettingsNotificationStateCopyWithImpl<_SettingsNotificationState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SettingsNotificationState&&(identical(other.status, status) || other.status == status)&&(identical(other.config, config) || other.config == config)&&(identical(other.enabledNotifications, enabledNotifications) || other.enabledNotifications == enabledNotifications)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,status,config,enabledNotifications,errorMessage);

@override
String toString() {
  return 'SettingsNotificationState(status: $status, config: $config, enabledNotifications: $enabledNotifications, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class _$SettingsNotificationStateCopyWith<$Res> implements $SettingsNotificationStateCopyWith<$Res> {
  factory _$SettingsNotificationStateCopyWith(_SettingsNotificationState value, $Res Function(_SettingsNotificationState) _then) = __$SettingsNotificationStateCopyWithImpl;
@override @useResult
$Res call({
 ESettingsNotificationStatus status, NotificationConfig config, bool enabledNotifications, String errorMessage
});


@override $NotificationConfigCopyWith<$Res> get config;

}
/// @nodoc
class __$SettingsNotificationStateCopyWithImpl<$Res>
    implements _$SettingsNotificationStateCopyWith<$Res> {
  __$SettingsNotificationStateCopyWithImpl(this._self, this._then);

  final _SettingsNotificationState _self;
  final $Res Function(_SettingsNotificationState) _then;

/// Create a copy of SettingsNotificationState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = null,Object? config = null,Object? enabledNotifications = null,Object? errorMessage = null,}) {
  return _then(_SettingsNotificationState(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as ESettingsNotificationStatus,config: null == config ? _self.config : config // ignore: cast_nullable_to_non_nullable
as NotificationConfig,enabledNotifications: null == enabledNotifications ? _self.enabledNotifications : enabledNotifications // ignore: cast_nullable_to_non_nullable
as bool,errorMessage: null == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

/// Create a copy of SettingsNotificationState
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
