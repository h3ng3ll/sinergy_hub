// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chats_filter_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ChatsFilterEvent {

 EChatFilter get filter;
/// Create a copy of ChatsFilterEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ChatsFilterEventCopyWith<ChatsFilterEvent> get copyWith => _$ChatsFilterEventCopyWithImpl<ChatsFilterEvent>(this as ChatsFilterEvent, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChatsFilterEvent&&(identical(other.filter, filter) || other.filter == filter));
}


@override
int get hashCode => Object.hash(runtimeType,filter);

@override
String toString() {
  return 'ChatsFilterEvent(filter: $filter)';
}


}

/// @nodoc
abstract mixin class $ChatsFilterEventCopyWith<$Res>  {
  factory $ChatsFilterEventCopyWith(ChatsFilterEvent value, $Res Function(ChatsFilterEvent) _then) = _$ChatsFilterEventCopyWithImpl;
@useResult
$Res call({
 EChatFilter filter
});




}
/// @nodoc
class _$ChatsFilterEventCopyWithImpl<$Res>
    implements $ChatsFilterEventCopyWith<$Res> {
  _$ChatsFilterEventCopyWithImpl(this._self, this._then);

  final ChatsFilterEvent _self;
  final $Res Function(ChatsFilterEvent) _then;

/// Create a copy of ChatsFilterEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? filter = null,}) {
  return _then(_self.copyWith(
filter: null == filter ? _self.filter : filter // ignore: cast_nullable_to_non_nullable
as EChatFilter,
  ));
}

}


/// Adds pattern-matching-related methods to [ChatsFilterEvent].
extension ChatsFilterEventPatterns on ChatsFilterEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _ApplyFilter value)?  applyFilter,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ApplyFilter() when applyFilter != null:
return applyFilter(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _ApplyFilter value)  applyFilter,}){
final _that = this;
switch (_that) {
case _ApplyFilter():
return applyFilter(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _ApplyFilter value)?  applyFilter,}){
final _that = this;
switch (_that) {
case _ApplyFilter() when applyFilter != null:
return applyFilter(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( EChatFilter filter)?  applyFilter,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ApplyFilter() when applyFilter != null:
return applyFilter(_that.filter);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( EChatFilter filter)  applyFilter,}) {final _that = this;
switch (_that) {
case _ApplyFilter():
return applyFilter(_that.filter);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( EChatFilter filter)?  applyFilter,}) {final _that = this;
switch (_that) {
case _ApplyFilter() when applyFilter != null:
return applyFilter(_that.filter);case _:
  return null;

}
}

}

/// @nodoc


class _ApplyFilter implements ChatsFilterEvent {
  const _ApplyFilter({required this.filter});
  

@override final  EChatFilter filter;

/// Create a copy of ChatsFilterEvent
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ApplyFilterCopyWith<_ApplyFilter> get copyWith => __$ApplyFilterCopyWithImpl<_ApplyFilter>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ApplyFilter&&(identical(other.filter, filter) || other.filter == filter));
}


@override
int get hashCode => Object.hash(runtimeType,filter);

@override
String toString() {
  return 'ChatsFilterEvent.applyFilter(filter: $filter)';
}


}

/// @nodoc
abstract mixin class _$ApplyFilterCopyWith<$Res> implements $ChatsFilterEventCopyWith<$Res> {
  factory _$ApplyFilterCopyWith(_ApplyFilter value, $Res Function(_ApplyFilter) _then) = __$ApplyFilterCopyWithImpl;
@override @useResult
$Res call({
 EChatFilter filter
});




}
/// @nodoc
class __$ApplyFilterCopyWithImpl<$Res>
    implements _$ApplyFilterCopyWith<$Res> {
  __$ApplyFilterCopyWithImpl(this._self, this._then);

  final _ApplyFilter _self;
  final $Res Function(_ApplyFilter) _then;

/// Create a copy of ChatsFilterEvent
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? filter = null,}) {
  return _then(_ApplyFilter(
filter: null == filter ? _self.filter : filter // ignore: cast_nullable_to_non_nullable
as EChatFilter,
  ));
}


}

/// @nodoc
mixin _$ChatsFilterState {

 ChatsFilterStatus get status; EChatFilter get filter; dynamic get errorMessage;
/// Create a copy of ChatsFilterState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ChatsFilterStateCopyWith<ChatsFilterState> get copyWith => _$ChatsFilterStateCopyWithImpl<ChatsFilterState>(this as ChatsFilterState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChatsFilterState&&(identical(other.status, status) || other.status == status)&&(identical(other.filter, filter) || other.filter == filter)&&const DeepCollectionEquality().equals(other.errorMessage, errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,status,filter,const DeepCollectionEquality().hash(errorMessage));

@override
String toString() {
  return 'ChatsFilterState(status: $status, filter: $filter, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class $ChatsFilterStateCopyWith<$Res>  {
  factory $ChatsFilterStateCopyWith(ChatsFilterState value, $Res Function(ChatsFilterState) _then) = _$ChatsFilterStateCopyWithImpl;
@useResult
$Res call({
 ChatsFilterStatus status, EChatFilter filter, dynamic errorMessage
});




}
/// @nodoc
class _$ChatsFilterStateCopyWithImpl<$Res>
    implements $ChatsFilterStateCopyWith<$Res> {
  _$ChatsFilterStateCopyWithImpl(this._self, this._then);

  final ChatsFilterState _self;
  final $Res Function(ChatsFilterState) _then;

/// Create a copy of ChatsFilterState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = null,Object? filter = null,Object? errorMessage = freezed,}) {
  return _then(_self.copyWith(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as ChatsFilterStatus,filter: null == filter ? _self.filter : filter // ignore: cast_nullable_to_non_nullable
as EChatFilter,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as dynamic,
  ));
}

}


/// Adds pattern-matching-related methods to [ChatsFilterState].
extension ChatsFilterStatePatterns on ChatsFilterState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ChatsFilterState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ChatsFilterState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ChatsFilterState value)  $default,){
final _that = this;
switch (_that) {
case _ChatsFilterState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ChatsFilterState value)?  $default,){
final _that = this;
switch (_that) {
case _ChatsFilterState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( ChatsFilterStatus status,  EChatFilter filter,  dynamic errorMessage)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ChatsFilterState() when $default != null:
return $default(_that.status,_that.filter,_that.errorMessage);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( ChatsFilterStatus status,  EChatFilter filter,  dynamic errorMessage)  $default,) {final _that = this;
switch (_that) {
case _ChatsFilterState():
return $default(_that.status,_that.filter,_that.errorMessage);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( ChatsFilterStatus status,  EChatFilter filter,  dynamic errorMessage)?  $default,) {final _that = this;
switch (_that) {
case _ChatsFilterState() when $default != null:
return $default(_that.status,_that.filter,_that.errorMessage);case _:
  return null;

}
}

}

/// @nodoc


class _ChatsFilterState implements ChatsFilterState {
  const _ChatsFilterState({this.status = ChatsFilterStatus.initial, this.filter = EChatFilter.recent, this.errorMessage = ''});
  

@override@JsonKey() final  ChatsFilterStatus status;
@override@JsonKey() final  EChatFilter filter;
@override@JsonKey() final  dynamic errorMessage;

/// Create a copy of ChatsFilterState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ChatsFilterStateCopyWith<_ChatsFilterState> get copyWith => __$ChatsFilterStateCopyWithImpl<_ChatsFilterState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ChatsFilterState&&(identical(other.status, status) || other.status == status)&&(identical(other.filter, filter) || other.filter == filter)&&const DeepCollectionEquality().equals(other.errorMessage, errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,status,filter,const DeepCollectionEquality().hash(errorMessage));

@override
String toString() {
  return 'ChatsFilterState(status: $status, filter: $filter, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class _$ChatsFilterStateCopyWith<$Res> implements $ChatsFilterStateCopyWith<$Res> {
  factory _$ChatsFilterStateCopyWith(_ChatsFilterState value, $Res Function(_ChatsFilterState) _then) = __$ChatsFilterStateCopyWithImpl;
@override @useResult
$Res call({
 ChatsFilterStatus status, EChatFilter filter, dynamic errorMessage
});




}
/// @nodoc
class __$ChatsFilterStateCopyWithImpl<$Res>
    implements _$ChatsFilterStateCopyWith<$Res> {
  __$ChatsFilterStateCopyWithImpl(this._self, this._then);

  final _ChatsFilterState _self;
  final $Res Function(_ChatsFilterState) _then;

/// Create a copy of ChatsFilterState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = null,Object? filter = null,Object? errorMessage = freezed,}) {
  return _then(_ChatsFilterState(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as ChatsFilterStatus,filter: null == filter ? _self.filter : filter // ignore: cast_nullable_to_non_nullable
as EChatFilter,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as dynamic,
  ));
}


}

// dart format on
