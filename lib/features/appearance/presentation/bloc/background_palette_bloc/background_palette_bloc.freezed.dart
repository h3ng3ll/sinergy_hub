// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'background_palette_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$BackgroundPaletteEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BackgroundPaletteEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'BackgroundPaletteEvent()';
}


}

/// @nodoc
class $BackgroundPaletteEventCopyWith<$Res>  {
$BackgroundPaletteEventCopyWith(BackgroundPaletteEvent _, $Res Function(BackgroundPaletteEvent) __);
}


/// Adds pattern-matching-related methods to [BackgroundPaletteEvent].
extension BackgroundPaletteEventPatterns on BackgroundPaletteEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Start value)?  start,TResult Function( _Init value)?  init,TResult Function( _Reset value)?  reset,TResult Function( _SetPrimary value)?  setPrimary,TResult Function( _SetSecondary value)?  setSecondary,TResult Function( _ResetPalette value)?  resetPalette,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Start() when start != null:
return start(_that);case _Init() when init != null:
return init(_that);case _Reset() when reset != null:
return reset(_that);case _SetPrimary() when setPrimary != null:
return setPrimary(_that);case _SetSecondary() when setSecondary != null:
return setSecondary(_that);case _ResetPalette() when resetPalette != null:
return resetPalette(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Start value)  start,required TResult Function( _Init value)  init,required TResult Function( _Reset value)  reset,required TResult Function( _SetPrimary value)  setPrimary,required TResult Function( _SetSecondary value)  setSecondary,required TResult Function( _ResetPalette value)  resetPalette,}){
final _that = this;
switch (_that) {
case _Start():
return start(_that);case _Init():
return init(_that);case _Reset():
return reset(_that);case _SetPrimary():
return setPrimary(_that);case _SetSecondary():
return setSecondary(_that);case _ResetPalette():
return resetPalette(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Start value)?  start,TResult? Function( _Init value)?  init,TResult? Function( _Reset value)?  reset,TResult? Function( _SetPrimary value)?  setPrimary,TResult? Function( _SetSecondary value)?  setSecondary,TResult? Function( _ResetPalette value)?  resetPalette,}){
final _that = this;
switch (_that) {
case _Start() when start != null:
return start(_that);case _Init() when init != null:
return init(_that);case _Reset() when reset != null:
return reset(_that);case _SetPrimary() when setPrimary != null:
return setPrimary(_that);case _SetSecondary() when setSecondary != null:
return setSecondary(_that);case _ResetPalette() when resetPalette != null:
return resetPalette(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  start,TResult Function( String uid)?  init,TResult Function()?  reset,TResult Function( Color color)?  setPrimary,TResult Function( Color color)?  setSecondary,TResult Function()?  resetPalette,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Start() when start != null:
return start();case _Init() when init != null:
return init(_that.uid);case _Reset() when reset != null:
return reset();case _SetPrimary() when setPrimary != null:
return setPrimary(_that.color);case _SetSecondary() when setSecondary != null:
return setSecondary(_that.color);case _ResetPalette() when resetPalette != null:
return resetPalette();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  start,required TResult Function( String uid)  init,required TResult Function()  reset,required TResult Function( Color color)  setPrimary,required TResult Function( Color color)  setSecondary,required TResult Function()  resetPalette,}) {final _that = this;
switch (_that) {
case _Start():
return start();case _Init():
return init(_that.uid);case _Reset():
return reset();case _SetPrimary():
return setPrimary(_that.color);case _SetSecondary():
return setSecondary(_that.color);case _ResetPalette():
return resetPalette();}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  start,TResult? Function( String uid)?  init,TResult? Function()?  reset,TResult? Function( Color color)?  setPrimary,TResult? Function( Color color)?  setSecondary,TResult? Function()?  resetPalette,}) {final _that = this;
switch (_that) {
case _Start() when start != null:
return start();case _Init() when init != null:
return init(_that.uid);case _Reset() when reset != null:
return reset();case _SetPrimary() when setPrimary != null:
return setPrimary(_that.color);case _SetSecondary() when setSecondary != null:
return setSecondary(_that.color);case _ResetPalette() when resetPalette != null:
return resetPalette();case _:
  return null;

}
}

}

/// @nodoc


class _Start implements BackgroundPaletteEvent {
  const _Start();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Start);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'BackgroundPaletteEvent.start()';
}


}




/// @nodoc


class _Init implements BackgroundPaletteEvent {
  const _Init({required this.uid});
  

 final  String uid;

/// Create a copy of BackgroundPaletteEvent
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
  return 'BackgroundPaletteEvent.init(uid: $uid)';
}


}

/// @nodoc
abstract mixin class _$InitCopyWith<$Res> implements $BackgroundPaletteEventCopyWith<$Res> {
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

/// Create a copy of BackgroundPaletteEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? uid = null,}) {
  return _then(_Init(
uid: null == uid ? _self.uid : uid // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _Reset implements BackgroundPaletteEvent {
  const _Reset();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Reset);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'BackgroundPaletteEvent.reset()';
}


}




/// @nodoc


class _SetPrimary implements BackgroundPaletteEvent {
  const _SetPrimary({required this.color});
  

 final  Color color;

/// Create a copy of BackgroundPaletteEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SetPrimaryCopyWith<_SetPrimary> get copyWith => __$SetPrimaryCopyWithImpl<_SetPrimary>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SetPrimary&&(identical(other.color, color) || other.color == color));
}


@override
int get hashCode => Object.hash(runtimeType,color);

@override
String toString() {
  return 'BackgroundPaletteEvent.setPrimary(color: $color)';
}


}

/// @nodoc
abstract mixin class _$SetPrimaryCopyWith<$Res> implements $BackgroundPaletteEventCopyWith<$Res> {
  factory _$SetPrimaryCopyWith(_SetPrimary value, $Res Function(_SetPrimary) _then) = __$SetPrimaryCopyWithImpl;
@useResult
$Res call({
 Color color
});




}
/// @nodoc
class __$SetPrimaryCopyWithImpl<$Res>
    implements _$SetPrimaryCopyWith<$Res> {
  __$SetPrimaryCopyWithImpl(this._self, this._then);

  final _SetPrimary _self;
  final $Res Function(_SetPrimary) _then;

/// Create a copy of BackgroundPaletteEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? color = null,}) {
  return _then(_SetPrimary(
color: null == color ? _self.color : color // ignore: cast_nullable_to_non_nullable
as Color,
  ));
}


}

/// @nodoc


class _SetSecondary implements BackgroundPaletteEvent {
  const _SetSecondary({required this.color});
  

 final  Color color;

/// Create a copy of BackgroundPaletteEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SetSecondaryCopyWith<_SetSecondary> get copyWith => __$SetSecondaryCopyWithImpl<_SetSecondary>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SetSecondary&&(identical(other.color, color) || other.color == color));
}


@override
int get hashCode => Object.hash(runtimeType,color);

@override
String toString() {
  return 'BackgroundPaletteEvent.setSecondary(color: $color)';
}


}

/// @nodoc
abstract mixin class _$SetSecondaryCopyWith<$Res> implements $BackgroundPaletteEventCopyWith<$Res> {
  factory _$SetSecondaryCopyWith(_SetSecondary value, $Res Function(_SetSecondary) _then) = __$SetSecondaryCopyWithImpl;
@useResult
$Res call({
 Color color
});




}
/// @nodoc
class __$SetSecondaryCopyWithImpl<$Res>
    implements _$SetSecondaryCopyWith<$Res> {
  __$SetSecondaryCopyWithImpl(this._self, this._then);

  final _SetSecondary _self;
  final $Res Function(_SetSecondary) _then;

/// Create a copy of BackgroundPaletteEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? color = null,}) {
  return _then(_SetSecondary(
color: null == color ? _self.color : color // ignore: cast_nullable_to_non_nullable
as Color,
  ));
}


}

/// @nodoc


class _ResetPalette implements BackgroundPaletteEvent {
  const _ResetPalette();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ResetPalette);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'BackgroundPaletteEvent.resetPalette()';
}


}




/// @nodoc
mixin _$BackgroundPaletteState {

 EBackgroundPaletteStatus get status; String? get uid;/// The stored palette; `null` = default.
 BackgroundPalette? get palette; bool get isPremium; String get errorMessage;
/// Create a copy of BackgroundPaletteState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BackgroundPaletteStateCopyWith<BackgroundPaletteState> get copyWith => _$BackgroundPaletteStateCopyWithImpl<BackgroundPaletteState>(this as BackgroundPaletteState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BackgroundPaletteState&&(identical(other.status, status) || other.status == status)&&(identical(other.uid, uid) || other.uid == uid)&&(identical(other.palette, palette) || other.palette == palette)&&(identical(other.isPremium, isPremium) || other.isPremium == isPremium)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,status,uid,palette,isPremium,errorMessage);

@override
String toString() {
  return 'BackgroundPaletteState(status: $status, uid: $uid, palette: $palette, isPremium: $isPremium, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class $BackgroundPaletteStateCopyWith<$Res>  {
  factory $BackgroundPaletteStateCopyWith(BackgroundPaletteState value, $Res Function(BackgroundPaletteState) _then) = _$BackgroundPaletteStateCopyWithImpl;
@useResult
$Res call({
 EBackgroundPaletteStatus status, String? uid, BackgroundPalette? palette, bool isPremium, String errorMessage
});


$BackgroundPaletteCopyWith<$Res>? get palette;

}
/// @nodoc
class _$BackgroundPaletteStateCopyWithImpl<$Res>
    implements $BackgroundPaletteStateCopyWith<$Res> {
  _$BackgroundPaletteStateCopyWithImpl(this._self, this._then);

  final BackgroundPaletteState _self;
  final $Res Function(BackgroundPaletteState) _then;

/// Create a copy of BackgroundPaletteState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = null,Object? uid = freezed,Object? palette = freezed,Object? isPremium = null,Object? errorMessage = null,}) {
  return _then(_self.copyWith(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as EBackgroundPaletteStatus,uid: freezed == uid ? _self.uid : uid // ignore: cast_nullable_to_non_nullable
as String?,palette: freezed == palette ? _self.palette : palette // ignore: cast_nullable_to_non_nullable
as BackgroundPalette?,isPremium: null == isPremium ? _self.isPremium : isPremium // ignore: cast_nullable_to_non_nullable
as bool,errorMessage: null == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String,
  ));
}
/// Create a copy of BackgroundPaletteState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BackgroundPaletteCopyWith<$Res>? get palette {
    if (_self.palette == null) {
    return null;
  }

  return $BackgroundPaletteCopyWith<$Res>(_self.palette!, (value) {
    return _then(_self.copyWith(palette: value));
  });
}
}


/// Adds pattern-matching-related methods to [BackgroundPaletteState].
extension BackgroundPaletteStatePatterns on BackgroundPaletteState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BackgroundPaletteState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BackgroundPaletteState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BackgroundPaletteState value)  $default,){
final _that = this;
switch (_that) {
case _BackgroundPaletteState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BackgroundPaletteState value)?  $default,){
final _that = this;
switch (_that) {
case _BackgroundPaletteState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( EBackgroundPaletteStatus status,  String? uid,  BackgroundPalette? palette,  bool isPremium,  String errorMessage)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BackgroundPaletteState() when $default != null:
return $default(_that.status,_that.uid,_that.palette,_that.isPremium,_that.errorMessage);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( EBackgroundPaletteStatus status,  String? uid,  BackgroundPalette? palette,  bool isPremium,  String errorMessage)  $default,) {final _that = this;
switch (_that) {
case _BackgroundPaletteState():
return $default(_that.status,_that.uid,_that.palette,_that.isPremium,_that.errorMessage);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( EBackgroundPaletteStatus status,  String? uid,  BackgroundPalette? palette,  bool isPremium,  String errorMessage)?  $default,) {final _that = this;
switch (_that) {
case _BackgroundPaletteState() when $default != null:
return $default(_that.status,_that.uid,_that.palette,_that.isPremium,_that.errorMessage);case _:
  return null;

}
}

}

/// @nodoc


class _BackgroundPaletteState implements BackgroundPaletteState {
  const _BackgroundPaletteState({this.status = EBackgroundPaletteStatus.initial, this.uid, this.palette, this.isPremium = false, this.errorMessage = ''});
  

@override@JsonKey() final  EBackgroundPaletteStatus status;
@override final  String? uid;
/// The stored palette; `null` = default.
@override final  BackgroundPalette? palette;
@override@JsonKey() final  bool isPremium;
@override@JsonKey() final  String errorMessage;

/// Create a copy of BackgroundPaletteState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BackgroundPaletteStateCopyWith<_BackgroundPaletteState> get copyWith => __$BackgroundPaletteStateCopyWithImpl<_BackgroundPaletteState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BackgroundPaletteState&&(identical(other.status, status) || other.status == status)&&(identical(other.uid, uid) || other.uid == uid)&&(identical(other.palette, palette) || other.palette == palette)&&(identical(other.isPremium, isPremium) || other.isPremium == isPremium)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,status,uid,palette,isPremium,errorMessage);

@override
String toString() {
  return 'BackgroundPaletteState(status: $status, uid: $uid, palette: $palette, isPremium: $isPremium, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class _$BackgroundPaletteStateCopyWith<$Res> implements $BackgroundPaletteStateCopyWith<$Res> {
  factory _$BackgroundPaletteStateCopyWith(_BackgroundPaletteState value, $Res Function(_BackgroundPaletteState) _then) = __$BackgroundPaletteStateCopyWithImpl;
@override @useResult
$Res call({
 EBackgroundPaletteStatus status, String? uid, BackgroundPalette? palette, bool isPremium, String errorMessage
});


@override $BackgroundPaletteCopyWith<$Res>? get palette;

}
/// @nodoc
class __$BackgroundPaletteStateCopyWithImpl<$Res>
    implements _$BackgroundPaletteStateCopyWith<$Res> {
  __$BackgroundPaletteStateCopyWithImpl(this._self, this._then);

  final _BackgroundPaletteState _self;
  final $Res Function(_BackgroundPaletteState) _then;

/// Create a copy of BackgroundPaletteState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = null,Object? uid = freezed,Object? palette = freezed,Object? isPremium = null,Object? errorMessage = null,}) {
  return _then(_BackgroundPaletteState(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as EBackgroundPaletteStatus,uid: freezed == uid ? _self.uid : uid // ignore: cast_nullable_to_non_nullable
as String?,palette: freezed == palette ? _self.palette : palette // ignore: cast_nullable_to_non_nullable
as BackgroundPalette?,isPremium: null == isPremium ? _self.isPremium : isPremium // ignore: cast_nullable_to_non_nullable
as bool,errorMessage: null == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

/// Create a copy of BackgroundPaletteState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BackgroundPaletteCopyWith<$Res>? get palette {
    if (_self.palette == null) {
    return null;
  }

  return $BackgroundPaletteCopyWith<$Res>(_self.palette!, (value) {
    return _then(_self.copyWith(palette: value));
  });
}
}

// dart format on
