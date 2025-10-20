// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'home_tab_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$HomeTabEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HomeTabEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'HomeTabEvent()';
}


}

/// @nodoc
class $HomeTabEventCopyWith<$Res>  {
$HomeTabEventCopyWith(HomeTabEvent _, $Res Function(HomeTabEvent) __);
}


/// Adds pattern-matching-related methods to [HomeTabEvent].
extension HomeTabEventPatterns on HomeTabEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _LoadPeoples value)?  loadPeoples,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LoadPeoples() when loadPeoples != null:
return loadPeoples(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _LoadPeoples value)  loadPeoples,}){
final _that = this;
switch (_that) {
case _LoadPeoples():
return loadPeoples(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _LoadPeoples value)?  loadPeoples,}){
final _that = this;
switch (_that) {
case _LoadPeoples() when loadPeoples != null:
return loadPeoples(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  loadPeoples,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LoadPeoples() when loadPeoples != null:
return loadPeoples();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  loadPeoples,}) {final _that = this;
switch (_that) {
case _LoadPeoples():
return loadPeoples();case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  loadPeoples,}) {final _that = this;
switch (_that) {
case _LoadPeoples() when loadPeoples != null:
return loadPeoples();case _:
  return null;

}
}

}

/// @nodoc


class _LoadPeoples implements HomeTabEvent {
  const _LoadPeoples();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LoadPeoples);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'HomeTabEvent.loadPeoples()';
}


}




/// @nodoc
mixin _$HomeTabState {

 HomeTabStatus get status;
/// Create a copy of HomeTabState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HomeTabStateCopyWith<HomeTabState> get copyWith => _$HomeTabStateCopyWithImpl<HomeTabState>(this as HomeTabState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HomeTabState&&(identical(other.status, status) || other.status == status));
}


@override
int get hashCode => Object.hash(runtimeType,status);

@override
String toString() {
  return 'HomeTabState(status: $status)';
}


}

/// @nodoc
abstract mixin class $HomeTabStateCopyWith<$Res>  {
  factory $HomeTabStateCopyWith(HomeTabState value, $Res Function(HomeTabState) _then) = _$HomeTabStateCopyWithImpl;
@useResult
$Res call({
 HomeTabStatus status
});




}
/// @nodoc
class _$HomeTabStateCopyWithImpl<$Res>
    implements $HomeTabStateCopyWith<$Res> {
  _$HomeTabStateCopyWithImpl(this._self, this._then);

  final HomeTabState _self;
  final $Res Function(HomeTabState) _then;

/// Create a copy of HomeTabState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = null,}) {
  return _then(_self.copyWith(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as HomeTabStatus,
  ));
}

}


/// Adds pattern-matching-related methods to [HomeTabState].
extension HomeTabStatePatterns on HomeTabState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _HomeTabState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _HomeTabState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _HomeTabState value)  $default,){
final _that = this;
switch (_that) {
case _HomeTabState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _HomeTabState value)?  $default,){
final _that = this;
switch (_that) {
case _HomeTabState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( HomeTabStatus status)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _HomeTabState() when $default != null:
return $default(_that.status);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( HomeTabStatus status)  $default,) {final _that = this;
switch (_that) {
case _HomeTabState():
return $default(_that.status);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( HomeTabStatus status)?  $default,) {final _that = this;
switch (_that) {
case _HomeTabState() when $default != null:
return $default(_that.status);case _:
  return null;

}
}

}

/// @nodoc


class _HomeTabState implements HomeTabState {
  const _HomeTabState({this.status = HomeTabStatus.loading});
  

@override@JsonKey() final  HomeTabStatus status;

/// Create a copy of HomeTabState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$HomeTabStateCopyWith<_HomeTabState> get copyWith => __$HomeTabStateCopyWithImpl<_HomeTabState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _HomeTabState&&(identical(other.status, status) || other.status == status));
}


@override
int get hashCode => Object.hash(runtimeType,status);

@override
String toString() {
  return 'HomeTabState(status: $status)';
}


}

/// @nodoc
abstract mixin class _$HomeTabStateCopyWith<$Res> implements $HomeTabStateCopyWith<$Res> {
  factory _$HomeTabStateCopyWith(_HomeTabState value, $Res Function(_HomeTabState) _then) = __$HomeTabStateCopyWithImpl;
@override @useResult
$Res call({
 HomeTabStatus status
});




}
/// @nodoc
class __$HomeTabStateCopyWithImpl<$Res>
    implements _$HomeTabStateCopyWith<$Res> {
  __$HomeTabStateCopyWithImpl(this._self, this._then);

  final _HomeTabState _self;
  final $Res Function(_HomeTabState) _then;

/// Create a copy of HomeTabState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = null,}) {
  return _then(_HomeTabState(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as HomeTabStatus,
  ));
}


}

// dart format on
