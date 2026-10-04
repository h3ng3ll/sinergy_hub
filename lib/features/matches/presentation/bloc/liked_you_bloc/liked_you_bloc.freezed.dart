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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _LoadMore value)?  loadMore,TResult Function( _Refresh value)?  refresh,TResult Function( _Watch value)?  watch,TResult Function( _Respond value)?  respond,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LoadMore() when loadMore != null:
return loadMore(_that);case _Refresh() when refresh != null:
return refresh(_that);case _Watch() when watch != null:
return watch(_that);case _Respond() when respond != null:
return respond(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _LoadMore value)  loadMore,required TResult Function( _Refresh value)  refresh,required TResult Function( _Watch value)  watch,required TResult Function( _Respond value)  respond,}){
final _that = this;
switch (_that) {
case _LoadMore():
return loadMore(_that);case _Refresh():
return refresh(_that);case _Watch():
return watch(_that);case _Respond():
return respond(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _LoadMore value)?  loadMore,TResult? Function( _Refresh value)?  refresh,TResult? Function( _Watch value)?  watch,TResult? Function( _Respond value)?  respond,}){
final _that = this;
switch (_that) {
case _LoadMore() when loadMore != null:
return loadMore(_that);case _Refresh() when refresh != null:
return refresh(_that);case _Watch() when watch != null:
return watch(_that);case _Respond() when respond != null:
return respond(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  loadMore,TResult Function()?  refresh,TResult Function()?  watch,TResult Function( LikedYouItem item,  TinderCardStatus status)?  respond,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LoadMore() when loadMore != null:
return loadMore();case _Refresh() when refresh != null:
return refresh();case _Watch() when watch != null:
return watch();case _Respond() when respond != null:
return respond(_that.item,_that.status);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  loadMore,required TResult Function()  refresh,required TResult Function()  watch,required TResult Function( LikedYouItem item,  TinderCardStatus status)  respond,}) {final _that = this;
switch (_that) {
case _LoadMore():
return loadMore();case _Refresh():
return refresh();case _Watch():
return watch();case _Respond():
return respond(_that.item,_that.status);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  loadMore,TResult? Function()?  refresh,TResult? Function()?  watch,TResult? Function( LikedYouItem item,  TinderCardStatus status)?  respond,}) {final _that = this;
switch (_that) {
case _LoadMore() when loadMore != null:
return loadMore();case _Refresh() when refresh != null:
return refresh();case _Watch() when watch != null:
return watch();case _Respond() when respond != null:
return respond(_that.item,_that.status);case _:
  return null;

}
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


class _Watch implements LikedYouEvent {
  const _Watch();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Watch);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'LikedYouEvent.watch()';
}


}




/// @nodoc


class _Respond implements LikedYouEvent {
  const _Respond({required this.item, required this.status});
  

 final  LikedYouItem item;
 final  TinderCardStatus status;

/// Create a copy of LikedYouEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RespondCopyWith<_Respond> get copyWith => __$RespondCopyWithImpl<_Respond>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Respond&&(identical(other.item, item) || other.item == item)&&(identical(other.status, status) || other.status == status));
}


@override
int get hashCode => Object.hash(runtimeType,item,status);

@override
String toString() {
  return 'LikedYouEvent.respond(item: $item, status: $status)';
}


}

/// @nodoc
abstract mixin class _$RespondCopyWith<$Res> implements $LikedYouEventCopyWith<$Res> {
  factory _$RespondCopyWith(_Respond value, $Res Function(_Respond) _then) = __$RespondCopyWithImpl;
@useResult
$Res call({
 LikedYouItem item, TinderCardStatus status
});


$LikedYouItemCopyWith<$Res> get item;

}
/// @nodoc
class __$RespondCopyWithImpl<$Res>
    implements _$RespondCopyWith<$Res> {
  __$RespondCopyWithImpl(this._self, this._then);

  final _Respond _self;
  final $Res Function(_Respond) _then;

/// Create a copy of LikedYouEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? item = null,Object? status = null,}) {
  return _then(_Respond(
item: null == item ? _self.item : item // ignore: cast_nullable_to_non_nullable
as LikedYouItem,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as TinderCardStatus,
  ));
}

/// Create a copy of LikedYouEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LikedYouItemCopyWith<$Res> get item {
  
  return $LikedYouItemCopyWith<$Res>(_self.item, (value) {
    return _then(_self.copyWith(item: value));
  });
}
}

/// @nodoc
mixin _$LikedYouState {

 LikedYouPgState get likesState; ELikedYouStatus get status; String get errorMessage; ELikedYouActionStatus get actionStatus; Set<String> get respondingIds;/// `true` once a backend sync confirmed (or replaced) the cached page.
 bool get isSynced;
/// Create a copy of LikedYouState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LikedYouStateCopyWith<LikedYouState> get copyWith => _$LikedYouStateCopyWithImpl<LikedYouState>(this as LikedYouState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LikedYouState&&(identical(other.likesState, likesState) || other.likesState == likesState)&&(identical(other.status, status) || other.status == status)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage)&&(identical(other.actionStatus, actionStatus) || other.actionStatus == actionStatus)&&const DeepCollectionEquality().equals(other.respondingIds, respondingIds)&&(identical(other.isSynced, isSynced) || other.isSynced == isSynced));
}


@override
int get hashCode => Object.hash(runtimeType,likesState,status,errorMessage,actionStatus,const DeepCollectionEquality().hash(respondingIds),isSynced);

@override
String toString() {
  return 'LikedYouState(likesState: $likesState, status: $status, errorMessage: $errorMessage, actionStatus: $actionStatus, respondingIds: $respondingIds, isSynced: $isSynced)';
}


}

/// @nodoc
abstract mixin class $LikedYouStateCopyWith<$Res>  {
  factory $LikedYouStateCopyWith(LikedYouState value, $Res Function(LikedYouState) _then) = _$LikedYouStateCopyWithImpl;
@useResult
$Res call({
 LikedYouPgState likesState, ELikedYouStatus status, String errorMessage, ELikedYouActionStatus actionStatus, Set<String> respondingIds, bool isSynced
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
@pragma('vm:prefer-inline') @override $Res call({Object? likesState = null,Object? status = null,Object? errorMessage = null,Object? actionStatus = null,Object? respondingIds = null,Object? isSynced = null,}) {
  return _then(_self.copyWith(
likesState: null == likesState ? _self.likesState : likesState // ignore: cast_nullable_to_non_nullable
as LikedYouPgState,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as ELikedYouStatus,errorMessage: null == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String,actionStatus: null == actionStatus ? _self.actionStatus : actionStatus // ignore: cast_nullable_to_non_nullable
as ELikedYouActionStatus,respondingIds: null == respondingIds ? _self.respondingIds : respondingIds // ignore: cast_nullable_to_non_nullable
as Set<String>,isSynced: null == isSynced ? _self.isSynced : isSynced // ignore: cast_nullable_to_non_nullable
as bool,
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( LikedYouPgState likesState,  ELikedYouStatus status,  String errorMessage,  ELikedYouActionStatus actionStatus,  Set<String> respondingIds,  bool isSynced)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LikedYouState() when $default != null:
return $default(_that.likesState,_that.status,_that.errorMessage,_that.actionStatus,_that.respondingIds,_that.isSynced);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( LikedYouPgState likesState,  ELikedYouStatus status,  String errorMessage,  ELikedYouActionStatus actionStatus,  Set<String> respondingIds,  bool isSynced)  $default,) {final _that = this;
switch (_that) {
case _LikedYouState():
return $default(_that.likesState,_that.status,_that.errorMessage,_that.actionStatus,_that.respondingIds,_that.isSynced);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( LikedYouPgState likesState,  ELikedYouStatus status,  String errorMessage,  ELikedYouActionStatus actionStatus,  Set<String> respondingIds,  bool isSynced)?  $default,) {final _that = this;
switch (_that) {
case _LikedYouState() when $default != null:
return $default(_that.likesState,_that.status,_that.errorMessage,_that.actionStatus,_that.respondingIds,_that.isSynced);case _:
  return null;

}
}

}

/// @nodoc


class _LikedYouState implements LikedYouState {
  const _LikedYouState({this.likesState = const LikedYouPgState(), this.status = ELikedYouStatus.loading, this.errorMessage = '', this.actionStatus = ELikedYouActionStatus.idle, final  Set<String> respondingIds = const <String>{}, this.isSynced = false}): _respondingIds = respondingIds;
  

@override@JsonKey() final  LikedYouPgState likesState;
@override@JsonKey() final  ELikedYouStatus status;
@override@JsonKey() final  String errorMessage;
@override@JsonKey() final  ELikedYouActionStatus actionStatus;
 final  Set<String> _respondingIds;
@override@JsonKey() Set<String> get respondingIds {
  if (_respondingIds is EqualUnmodifiableSetView) return _respondingIds;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableSetView(_respondingIds);
}

/// `true` once a backend sync confirmed (or replaced) the cached page.
@override@JsonKey() final  bool isSynced;

/// Create a copy of LikedYouState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LikedYouStateCopyWith<_LikedYouState> get copyWith => __$LikedYouStateCopyWithImpl<_LikedYouState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LikedYouState&&(identical(other.likesState, likesState) || other.likesState == likesState)&&(identical(other.status, status) || other.status == status)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage)&&(identical(other.actionStatus, actionStatus) || other.actionStatus == actionStatus)&&const DeepCollectionEquality().equals(other._respondingIds, _respondingIds)&&(identical(other.isSynced, isSynced) || other.isSynced == isSynced));
}


@override
int get hashCode => Object.hash(runtimeType,likesState,status,errorMessage,actionStatus,const DeepCollectionEquality().hash(_respondingIds),isSynced);

@override
String toString() {
  return 'LikedYouState(likesState: $likesState, status: $status, errorMessage: $errorMessage, actionStatus: $actionStatus, respondingIds: $respondingIds, isSynced: $isSynced)';
}


}

/// @nodoc
abstract mixin class _$LikedYouStateCopyWith<$Res> implements $LikedYouStateCopyWith<$Res> {
  factory _$LikedYouStateCopyWith(_LikedYouState value, $Res Function(_LikedYouState) _then) = __$LikedYouStateCopyWithImpl;
@override @useResult
$Res call({
 LikedYouPgState likesState, ELikedYouStatus status, String errorMessage, ELikedYouActionStatus actionStatus, Set<String> respondingIds, bool isSynced
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
@override @pragma('vm:prefer-inline') $Res call({Object? likesState = null,Object? status = null,Object? errorMessage = null,Object? actionStatus = null,Object? respondingIds = null,Object? isSynced = null,}) {
  return _then(_LikedYouState(
likesState: null == likesState ? _self.likesState : likesState // ignore: cast_nullable_to_non_nullable
as LikedYouPgState,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as ELikedYouStatus,errorMessage: null == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String,actionStatus: null == actionStatus ? _self.actionStatus : actionStatus // ignore: cast_nullable_to_non_nullable
as ELikedYouActionStatus,respondingIds: null == respondingIds ? _self._respondingIds : respondingIds // ignore: cast_nullable_to_non_nullable
as Set<String>,isSynced: null == isSynced ? _self.isSynced : isSynced // ignore: cast_nullable_to_non_nullable
as bool,
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
