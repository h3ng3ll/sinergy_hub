// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'liked_you_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$LikedYouEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LikedYouEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'LikedYouEvent()';
}


}

/// @nodoc
class $LikedYouEventCopyWith<$Res>  {
$LikedYouEventCopyWith(LikedYouEvent _, $Res Function(LikedYouEvent) __);
}


/// Adds pattern-matching-related methods to [LikedYouEvent].
extension LikedYouEventPatterns on LikedYouEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Load value)?  load,TResult Function( _LoadMore value)?  loadMore,TResult Function( _Refresh value)?  refresh,TResult Function( _WatchChanges value)?  watchChanges,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Load() when load != null:
return load(_that);case _LoadMore() when loadMore != null:
return loadMore(_that);case _Refresh() when refresh != null:
return refresh(_that);case _WatchChanges() when watchChanges != null:
return watchChanges(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Load value)  load,required TResult Function( _LoadMore value)  loadMore,required TResult Function( _Refresh value)  refresh,required TResult Function( _WatchChanges value)  watchChanges,}){
final _that = this;
switch (_that) {
case _Load():
return load(_that);case _LoadMore():
return loadMore(_that);case _Refresh():
return refresh(_that);case _WatchChanges():
return watchChanges(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Load value)?  load,TResult? Function( _LoadMore value)?  loadMore,TResult? Function( _Refresh value)?  refresh,TResult? Function( _WatchChanges value)?  watchChanges,}){
final _that = this;
switch (_that) {
case _Load() when load != null:
return load(_that);case _LoadMore() when loadMore != null:
return loadMore(_that);case _Refresh() when refresh != null:
return refresh(_that);case _WatchChanges() when watchChanges != null:
return watchChanges(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  load,TResult Function()?  loadMore,TResult Function()?  refresh,TResult Function()?  watchChanges,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Load() when load != null:
return load();case _LoadMore() when loadMore != null:
return loadMore();case _Refresh() when refresh != null:
return refresh();case _WatchChanges() when watchChanges != null:
return watchChanges();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  load,required TResult Function()  loadMore,required TResult Function()  refresh,required TResult Function()  watchChanges,}) {final _that = this;
switch (_that) {
case _Load():
return load();case _LoadMore():
return loadMore();case _Refresh():
return refresh();case _WatchChanges():
return watchChanges();case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  load,TResult? Function()?  loadMore,TResult? Function()?  refresh,TResult? Function()?  watchChanges,}) {final _that = this;
switch (_that) {
case _Load() when load != null:
return load();case _LoadMore() when loadMore != null:
return loadMore();case _Refresh() when refresh != null:
return refresh();case _WatchChanges() when watchChanges != null:
return watchChanges();case _:
  return null;

}
}

}

/// @nodoc


class _Load implements LikedYouEvent {
  const _Load();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Load);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'LikedYouEvent.load()';
}


}




/// @nodoc


class _LoadMore implements LikedYouEvent {
  const _LoadMore();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LoadMore);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'LikedYouEvent.loadMore()';
}


}




/// @nodoc


class _Refresh implements LikedYouEvent {
  const _Refresh();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Refresh);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'LikedYouEvent.refresh()';
}


}




/// @nodoc


class _WatchChanges implements LikedYouEvent {
  const _WatchChanges();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _WatchChanges);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'LikedYouEvent.watchChanges()';
}


}




/// @nodoc
mixin _$LikedYouState {

 LikedYouPgState get likesState; ELikedYouStatus get status; String get errorMessage;
/// Create a copy of LikedYouState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LikedYouStateCopyWith<LikedYouState> get copyWith => _$LikedYouStateCopyWithImpl<LikedYouState>(this as LikedYouState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LikedYouState&&(identical(other.likesState, likesState) || other.likesState == likesState)&&(identical(other.status, status) || other.status == status)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,likesState,status,errorMessage);

@override
String toString() {
  return 'LikedYouState(likesState: $likesState, status: $status, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class $LikedYouStateCopyWith<$Res>  {
  factory $LikedYouStateCopyWith(LikedYouState value, $Res Function(LikedYouState) _then) = _$LikedYouStateCopyWithImpl;
@useResult
$Res call({
 LikedYouPgState likesState, ELikedYouStatus status, String errorMessage
});


$LikedYouPgStateCopyWith<$Res> get likesState;

}
/// @nodoc
class _$LikedYouStateCopyWithImpl<$Res>
    implements $LikedYouStateCopyWith<$Res> {
  _$LikedYouStateCopyWithImpl(this._self, this._then);

  final LikedYouState _self;
  final $Res Function(LikedYouState) _then;

/// Create a copy of LikedYouState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? likesState = null,Object? status = null,Object? errorMessage = null,}) {
  return _then(_self.copyWith(
likesState: null == likesState ? _self.likesState : likesState // ignore: cast_nullable_to_non_nullable
as LikedYouPgState,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as ELikedYouStatus,errorMessage: null == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String,
  ));
}
/// Create a copy of LikedYouState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LikedYouPgStateCopyWith<$Res> get likesState {
  
  return $LikedYouPgStateCopyWith<$Res>(_self.likesState, (value) {
    return _then(_self.copyWith(likesState: value));
  });
}
}


/// Adds pattern-matching-related methods to [LikedYouState].
extension LikedYouStatePatterns on LikedYouState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _LikedYouState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LikedYouState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _LikedYouState value)  $default,){
final _that = this;
switch (_that) {
case _LikedYouState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _LikedYouState value)?  $default,){
final _that = this;
switch (_that) {
case _LikedYouState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( LikedYouPgState likesState,  ELikedYouStatus status,  String errorMessage)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LikedYouState() when $default != null:
return $default(_that.likesState,_that.status,_that.errorMessage);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( LikedYouPgState likesState,  ELikedYouStatus status,  String errorMessage)  $default,) {final _that = this;
switch (_that) {
case _LikedYouState():
return $default(_that.likesState,_that.status,_that.errorMessage);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( LikedYouPgState likesState,  ELikedYouStatus status,  String errorMessage)?  $default,) {final _that = this;
switch (_that) {
case _LikedYouState() when $default != null:
return $default(_that.likesState,_that.status,_that.errorMessage);case _:
  return null;

}
}

}

/// @nodoc


class _LikedYouState implements LikedYouState {
  const _LikedYouState({this.likesState = const LikedYouPgState(), this.status = ELikedYouStatus.loading, this.errorMessage = ''});
  

@override@JsonKey() final  LikedYouPgState likesState;
@override@JsonKey() final  ELikedYouStatus status;
@override@JsonKey() final  String errorMessage;

/// Create a copy of LikedYouState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LikedYouStateCopyWith<_LikedYouState> get copyWith => __$LikedYouStateCopyWithImpl<_LikedYouState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LikedYouState&&(identical(other.likesState, likesState) || other.likesState == likesState)&&(identical(other.status, status) || other.status == status)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,likesState,status,errorMessage);

@override
String toString() {
  return 'LikedYouState(likesState: $likesState, status: $status, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class _$LikedYouStateCopyWith<$Res> implements $LikedYouStateCopyWith<$Res> {
  factory _$LikedYouStateCopyWith(_LikedYouState value, $Res Function(_LikedYouState) _then) = __$LikedYouStateCopyWithImpl;
@override @useResult
$Res call({
 LikedYouPgState likesState, ELikedYouStatus status, String errorMessage
});


@override $LikedYouPgStateCopyWith<$Res> get likesState;

}
/// @nodoc
class __$LikedYouStateCopyWithImpl<$Res>
    implements _$LikedYouStateCopyWith<$Res> {
  __$LikedYouStateCopyWithImpl(this._self, this._then);

  final _LikedYouState _self;
  final $Res Function(_LikedYouState) _then;

/// Create a copy of LikedYouState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? likesState = null,Object? status = null,Object? errorMessage = null,}) {
  return _then(_LikedYouState(
likesState: null == likesState ? _self.likesState : likesState // ignore: cast_nullable_to_non_nullable
as LikedYouPgState,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as ELikedYouStatus,errorMessage: null == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

/// Create a copy of LikedYouState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LikedYouPgStateCopyWith<$Res> get likesState {
  
  return $LikedYouPgStateCopyWith<$Res>(_self.likesState, (value) {
    return _then(_self.copyWith(likesState: value));
  });
}
}

// dart format on
