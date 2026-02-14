// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'notification_config.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$NotificationConfig {

 List<String> get fcmTokens; bool get enabledNotifications;
/// Create a copy of NotificationConfig
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NotificationConfigCopyWith<NotificationConfig> get copyWith => _$NotificationConfigCopyWithImpl<NotificationConfig>(this as NotificationConfig, _$identity);

  /// Serializes this NotificationConfig to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NotificationConfig&&const DeepCollectionEquality().equals(other.fcmTokens, fcmTokens)&&(identical(other.enabledNotifications, enabledNotifications) || other.enabledNotifications == enabledNotifications));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(fcmTokens),enabledNotifications);

@override
String toString() {
  return 'NotificationConfig(fcmTokens: $fcmTokens, enabledNotifications: $enabledNotifications)';
}


}

/// @nodoc
abstract mixin class $NotificationConfigCopyWith<$Res>  {
  factory $NotificationConfigCopyWith(NotificationConfig value, $Res Function(NotificationConfig) _then) = _$NotificationConfigCopyWithImpl;
@useResult
$Res call({
 List<String> fcmTokens, bool enabledNotifications
});




}
/// @nodoc
class _$NotificationConfigCopyWithImpl<$Res>
    implements $NotificationConfigCopyWith<$Res> {
  _$NotificationConfigCopyWithImpl(this._self, this._then);

  final NotificationConfig _self;
  final $Res Function(NotificationConfig) _then;

/// Create a copy of NotificationConfig
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? fcmTokens = null,Object? enabledNotifications = null,}) {
  return _then(_self.copyWith(
fcmTokens: null == fcmTokens ? _self.fcmTokens : fcmTokens // ignore: cast_nullable_to_non_nullable
as List<String>,enabledNotifications: null == enabledNotifications ? _self.enabledNotifications : enabledNotifications // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [NotificationConfig].
extension NotificationConfigPatterns on NotificationConfig {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _NotificationConfig value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _NotificationConfig() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _NotificationConfig value)  $default,){
final _that = this;
switch (_that) {
case _NotificationConfig():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _NotificationConfig value)?  $default,){
final _that = this;
switch (_that) {
case _NotificationConfig() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<String> fcmTokens,  bool enabledNotifications)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _NotificationConfig() when $default != null:
return $default(_that.fcmTokens,_that.enabledNotifications);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<String> fcmTokens,  bool enabledNotifications)  $default,) {final _that = this;
switch (_that) {
case _NotificationConfig():
return $default(_that.fcmTokens,_that.enabledNotifications);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<String> fcmTokens,  bool enabledNotifications)?  $default,) {final _that = this;
switch (_that) {
case _NotificationConfig() when $default != null:
return $default(_that.fcmTokens,_that.enabledNotifications);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _NotificationConfig implements NotificationConfig {
  const _NotificationConfig({final  List<String> fcmTokens = const [], this.enabledNotifications = true}): _fcmTokens = fcmTokens;
  factory _NotificationConfig.fromJson(Map<String, dynamic> json) => _$NotificationConfigFromJson(json);

 final  List<String> _fcmTokens;
@override@JsonKey() List<String> get fcmTokens {
  if (_fcmTokens is EqualUnmodifiableListView) return _fcmTokens;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_fcmTokens);
}

@override@JsonKey() final  bool enabledNotifications;

/// Create a copy of NotificationConfig
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$NotificationConfigCopyWith<_NotificationConfig> get copyWith => __$NotificationConfigCopyWithImpl<_NotificationConfig>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$NotificationConfigToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _NotificationConfig&&const DeepCollectionEquality().equals(other._fcmTokens, _fcmTokens)&&(identical(other.enabledNotifications, enabledNotifications) || other.enabledNotifications == enabledNotifications));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_fcmTokens),enabledNotifications);

@override
String toString() {
  return 'NotificationConfig(fcmTokens: $fcmTokens, enabledNotifications: $enabledNotifications)';
}


}

/// @nodoc
abstract mixin class _$NotificationConfigCopyWith<$Res> implements $NotificationConfigCopyWith<$Res> {
  factory _$NotificationConfigCopyWith(_NotificationConfig value, $Res Function(_NotificationConfig) _then) = __$NotificationConfigCopyWithImpl;
@override @useResult
$Res call({
 List<String> fcmTokens, bool enabledNotifications
});




}
/// @nodoc
class __$NotificationConfigCopyWithImpl<$Res>
    implements _$NotificationConfigCopyWith<$Res> {
  __$NotificationConfigCopyWithImpl(this._self, this._then);

  final _NotificationConfig _self;
  final $Res Function(_NotificationConfig) _then;

/// Create a copy of NotificationConfig
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? fcmTokens = null,Object? enabledNotifications = null,}) {
  return _then(_NotificationConfig(
fcmTokens: null == fcmTokens ? _self._fcmTokens : fcmTokens // ignore: cast_nullable_to_non_nullable
as List<String>,enabledNotifications: null == enabledNotifications ? _self.enabledNotifications : enabledNotifications // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
