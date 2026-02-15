// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'people_data_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$PeopleDataEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PeopleDataEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'PeopleDataEvent()';
}


}

/// @nodoc
class $PeopleDataEventCopyWith<$Res>  {
$PeopleDataEventCopyWith(PeopleDataEvent _, $Res Function(PeopleDataEvent) __);
}


/// Adds pattern-matching-related methods to [PeopleDataEvent].
extension PeopleDataEventPatterns on PeopleDataEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _LoadPeoples value)?  loadPeoples,TResult Function( _RemoveVisible value)?  removeVisible,TResult Function( _UpdateViewedPeoples value)?  updateViewedPeoples,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LoadPeoples() when loadPeoples != null:
return loadPeoples(_that);case _RemoveVisible() when removeVisible != null:
return removeVisible(_that);case _UpdateViewedPeoples() when updateViewedPeoples != null:
return updateViewedPeoples(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _LoadPeoples value)  loadPeoples,required TResult Function( _RemoveVisible value)  removeVisible,required TResult Function( _UpdateViewedPeoples value)  updateViewedPeoples,}){
final _that = this;
switch (_that) {
case _LoadPeoples():
return loadPeoples(_that);case _RemoveVisible():
return removeVisible(_that);case _UpdateViewedPeoples():
return updateViewedPeoples(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _LoadPeoples value)?  loadPeoples,TResult? Function( _RemoveVisible value)?  removeVisible,TResult? Function( _UpdateViewedPeoples value)?  updateViewedPeoples,}){
final _that = this;
switch (_that) {
case _LoadPeoples() when loadPeoples != null:
return loadPeoples(_that);case _RemoveVisible() when removeVisible != null:
return removeVisible(_that);case _UpdateViewedPeoples() when updateViewedPeoples != null:
return updateViewedPeoples(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  loadPeoples,TResult Function()?  removeVisible,TResult Function( List<String> uids)?  updateViewedPeoples,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LoadPeoples() when loadPeoples != null:
return loadPeoples();case _RemoveVisible() when removeVisible != null:
return removeVisible();case _UpdateViewedPeoples() when updateViewedPeoples != null:
return updateViewedPeoples(_that.uids);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  loadPeoples,required TResult Function()  removeVisible,required TResult Function( List<String> uids)  updateViewedPeoples,}) {final _that = this;
switch (_that) {
case _LoadPeoples():
return loadPeoples();case _RemoveVisible():
return removeVisible();case _UpdateViewedPeoples():
return updateViewedPeoples(_that.uids);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  loadPeoples,TResult? Function()?  removeVisible,TResult? Function( List<String> uids)?  updateViewedPeoples,}) {final _that = this;
switch (_that) {
case _LoadPeoples() when loadPeoples != null:
return loadPeoples();case _RemoveVisible() when removeVisible != null:
return removeVisible();case _UpdateViewedPeoples() when updateViewedPeoples != null:
return updateViewedPeoples(_that.uids);case _:
  return null;

}
}

}

/// @nodoc


class _LoadPeoples implements PeopleDataEvent {
  const _LoadPeoples();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LoadPeoples);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'PeopleDataEvent.loadPeoples()';
}


}




/// @nodoc


class _RemoveVisible implements PeopleDataEvent {
  const _RemoveVisible();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RemoveVisible);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'PeopleDataEvent.removeVisible()';
}


}




/// @nodoc


class _UpdateViewedPeoples implements PeopleDataEvent {
  const _UpdateViewedPeoples({required final  List<String> uids}): _uids = uids;
  

 final  List<String> _uids;
 List<String> get uids {
  if (_uids is EqualUnmodifiableListView) return _uids;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_uids);
}


/// Create a copy of PeopleDataEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UpdateViewedPeoplesCopyWith<_UpdateViewedPeoples> get copyWith => __$UpdateViewedPeoplesCopyWithImpl<_UpdateViewedPeoples>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UpdateViewedPeoples&&const DeepCollectionEquality().equals(other._uids, _uids));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_uids));

@override
String toString() {
  return 'PeopleDataEvent.updateViewedPeoples(uids: $uids)';
}


}

/// @nodoc
abstract mixin class _$UpdateViewedPeoplesCopyWith<$Res> implements $PeopleDataEventCopyWith<$Res> {
  factory _$UpdateViewedPeoplesCopyWith(_UpdateViewedPeoples value, $Res Function(_UpdateViewedPeoples) _then) = __$UpdateViewedPeoplesCopyWithImpl;
@useResult
$Res call({
 List<String> uids
});




}
/// @nodoc
class __$UpdateViewedPeoplesCopyWithImpl<$Res>
    implements _$UpdateViewedPeoplesCopyWith<$Res> {
  __$UpdateViewedPeoplesCopyWithImpl(this._self, this._then);

  final _UpdateViewedPeoples _self;
  final $Res Function(_UpdateViewedPeoples) _then;

/// Create a copy of PeopleDataEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? uids = null,}) {
  return _then(_UpdateViewedPeoples(
uids: null == uids ? _self._uids : uids // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}


}

/// @nodoc
mixin _$PeopleDataState {

 List<UserData> get users; List<String> get viewedUids; bool get initialized; EPeopleDataStatus get status; String get errorMessage;
/// Create a copy of PeopleDataState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PeopleDataStateCopyWith<PeopleDataState> get copyWith => _$PeopleDataStateCopyWithImpl<PeopleDataState>(this as PeopleDataState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PeopleDataState&&const DeepCollectionEquality().equals(other.users, users)&&const DeepCollectionEquality().equals(other.viewedUids, viewedUids)&&(identical(other.initialized, initialized) || other.initialized == initialized)&&(identical(other.status, status) || other.status == status)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(users),const DeepCollectionEquality().hash(viewedUids),initialized,status,errorMessage);

@override
String toString() {
  return 'PeopleDataState(users: $users, viewedUids: $viewedUids, initialized: $initialized, status: $status, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class $PeopleDataStateCopyWith<$Res>  {
  factory $PeopleDataStateCopyWith(PeopleDataState value, $Res Function(PeopleDataState) _then) = _$PeopleDataStateCopyWithImpl;
@useResult
$Res call({
 List<UserData> users, List<String> viewedUids, bool initialized, EPeopleDataStatus status, String errorMessage
});




}
/// @nodoc
class _$PeopleDataStateCopyWithImpl<$Res>
    implements $PeopleDataStateCopyWith<$Res> {
  _$PeopleDataStateCopyWithImpl(this._self, this._then);

  final PeopleDataState _self;
  final $Res Function(PeopleDataState) _then;

/// Create a copy of PeopleDataState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? users = null,Object? viewedUids = null,Object? initialized = null,Object? status = null,Object? errorMessage = null,}) {
  return _then(_self.copyWith(
users: null == users ? _self.users : users // ignore: cast_nullable_to_non_nullable
as List<UserData>,viewedUids: null == viewedUids ? _self.viewedUids : viewedUids // ignore: cast_nullable_to_non_nullable
as List<String>,initialized: null == initialized ? _self.initialized : initialized // ignore: cast_nullable_to_non_nullable
as bool,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as EPeopleDataStatus,errorMessage: null == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [PeopleDataState].
extension PeopleDataStatePatterns on PeopleDataState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PeopleDataState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PeopleDataState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PeopleDataState value)  $default,){
final _that = this;
switch (_that) {
case _PeopleDataState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PeopleDataState value)?  $default,){
final _that = this;
switch (_that) {
case _PeopleDataState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<UserData> users,  List<String> viewedUids,  bool initialized,  EPeopleDataStatus status,  String errorMessage)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PeopleDataState() when $default != null:
return $default(_that.users,_that.viewedUids,_that.initialized,_that.status,_that.errorMessage);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<UserData> users,  List<String> viewedUids,  bool initialized,  EPeopleDataStatus status,  String errorMessage)  $default,) {final _that = this;
switch (_that) {
case _PeopleDataState():
return $default(_that.users,_that.viewedUids,_that.initialized,_that.status,_that.errorMessage);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<UserData> users,  List<String> viewedUids,  bool initialized,  EPeopleDataStatus status,  String errorMessage)?  $default,) {final _that = this;
switch (_that) {
case _PeopleDataState() when $default != null:
return $default(_that.users,_that.viewedUids,_that.initialized,_that.status,_that.errorMessage);case _:
  return null;

}
}

}

/// @nodoc


class _PeopleDataState implements PeopleDataState {
  const _PeopleDataState({final  List<UserData> users = const [], final  List<String> viewedUids = const [], this.initialized = false, this.status = EPeopleDataStatus.loading, this.errorMessage = ''}): _users = users,_viewedUids = viewedUids;
  

 final  List<UserData> _users;
@override@JsonKey() List<UserData> get users {
  if (_users is EqualUnmodifiableListView) return _users;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_users);
}

 final  List<String> _viewedUids;
@override@JsonKey() List<String> get viewedUids {
  if (_viewedUids is EqualUnmodifiableListView) return _viewedUids;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_viewedUids);
}

@override@JsonKey() final  bool initialized;
@override@JsonKey() final  EPeopleDataStatus status;
@override@JsonKey() final  String errorMessage;

/// Create a copy of PeopleDataState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PeopleDataStateCopyWith<_PeopleDataState> get copyWith => __$PeopleDataStateCopyWithImpl<_PeopleDataState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PeopleDataState&&const DeepCollectionEquality().equals(other._users, _users)&&const DeepCollectionEquality().equals(other._viewedUids, _viewedUids)&&(identical(other.initialized, initialized) || other.initialized == initialized)&&(identical(other.status, status) || other.status == status)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_users),const DeepCollectionEquality().hash(_viewedUids),initialized,status,errorMessage);

@override
String toString() {
  return 'PeopleDataState(users: $users, viewedUids: $viewedUids, initialized: $initialized, status: $status, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class _$PeopleDataStateCopyWith<$Res> implements $PeopleDataStateCopyWith<$Res> {
  factory _$PeopleDataStateCopyWith(_PeopleDataState value, $Res Function(_PeopleDataState) _then) = __$PeopleDataStateCopyWithImpl;
@override @useResult
$Res call({
 List<UserData> users, List<String> viewedUids, bool initialized, EPeopleDataStatus status, String errorMessage
});




}
/// @nodoc
class __$PeopleDataStateCopyWithImpl<$Res>
    implements _$PeopleDataStateCopyWith<$Res> {
  __$PeopleDataStateCopyWithImpl(this._self, this._then);

  final _PeopleDataState _self;
  final $Res Function(_PeopleDataState) _then;

/// Create a copy of PeopleDataState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? users = null,Object? viewedUids = null,Object? initialized = null,Object? status = null,Object? errorMessage = null,}) {
  return _then(_PeopleDataState(
users: null == users ? _self._users : users // ignore: cast_nullable_to_non_nullable
as List<UserData>,viewedUids: null == viewedUids ? _self._viewedUids : viewedUids // ignore: cast_nullable_to_non_nullable
as List<String>,initialized: null == initialized ? _self.initialized : initialized // ignore: cast_nullable_to_non_nullable
as bool,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as EPeopleDataStatus,errorMessage: null == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
