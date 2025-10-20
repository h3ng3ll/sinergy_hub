// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'tinder_card_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$TinderCardState {

 Offset get position; dynamic get isDragging; double get rotation; Size get cardSize; TinderCardStatus get status;
/// Create a copy of TinderCardState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TinderCardStateCopyWith<TinderCardState> get copyWith => _$TinderCardStateCopyWithImpl<TinderCardState>(this as TinderCardState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TinderCardState&&(identical(other.position, position) || other.position == position)&&const DeepCollectionEquality().equals(other.isDragging, isDragging)&&(identical(other.rotation, rotation) || other.rotation == rotation)&&(identical(other.cardSize, cardSize) || other.cardSize == cardSize)&&(identical(other.status, status) || other.status == status));
}


@override
int get hashCode => Object.hash(runtimeType,position,const DeepCollectionEquality().hash(isDragging),rotation,cardSize,status);

@override
String toString() {
  return 'TinderCardState(position: $position, isDragging: $isDragging, rotation: $rotation, cardSize: $cardSize, status: $status)';
}


}

/// @nodoc
abstract mixin class $TinderCardStateCopyWith<$Res>  {
  factory $TinderCardStateCopyWith(TinderCardState value, $Res Function(TinderCardState) _then) = _$TinderCardStateCopyWithImpl;
@useResult
$Res call({
 Offset position, dynamic isDragging, double rotation, Size cardSize, TinderCardStatus status
});




}
/// @nodoc
class _$TinderCardStateCopyWithImpl<$Res>
    implements $TinderCardStateCopyWith<$Res> {
  _$TinderCardStateCopyWithImpl(this._self, this._then);

  final TinderCardState _self;
  final $Res Function(TinderCardState) _then;

/// Create a copy of TinderCardState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? position = null,Object? isDragging = freezed,Object? rotation = null,Object? cardSize = null,Object? status = null,}) {
  return _then(_self.copyWith(
position: null == position ? _self.position : position // ignore: cast_nullable_to_non_nullable
as Offset,isDragging: freezed == isDragging ? _self.isDragging : isDragging // ignore: cast_nullable_to_non_nullable
as dynamic,rotation: null == rotation ? _self.rotation : rotation // ignore: cast_nullable_to_non_nullable
as double,cardSize: null == cardSize ? _self.cardSize : cardSize // ignore: cast_nullable_to_non_nullable
as Size,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as TinderCardStatus,
  ));
}

}


/// Adds pattern-matching-related methods to [TinderCardState].
extension TinderCardStatePatterns on TinderCardState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TinderCardState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TinderCardState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TinderCardState value)  $default,){
final _that = this;
switch (_that) {
case _TinderCardState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TinderCardState value)?  $default,){
final _that = this;
switch (_that) {
case _TinderCardState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( Offset position,  dynamic isDragging,  double rotation,  Size cardSize,  TinderCardStatus status)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TinderCardState() when $default != null:
return $default(_that.position,_that.isDragging,_that.rotation,_that.cardSize,_that.status);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( Offset position,  dynamic isDragging,  double rotation,  Size cardSize,  TinderCardStatus status)  $default,) {final _that = this;
switch (_that) {
case _TinderCardState():
return $default(_that.position,_that.isDragging,_that.rotation,_that.cardSize,_that.status);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( Offset position,  dynamic isDragging,  double rotation,  Size cardSize,  TinderCardStatus status)?  $default,) {final _that = this;
switch (_that) {
case _TinderCardState() when $default != null:
return $default(_that.position,_that.isDragging,_that.rotation,_that.cardSize,_that.status);case _:
  return null;

}
}

}

/// @nodoc


class _TinderCardState implements TinderCardState {
  const _TinderCardState({this.position = Offset.zero, this.isDragging = false, this.rotation = 0.0, this.cardSize = Size.zero, this.status = TinderCardStatus.none});
  

@override@JsonKey() final  Offset position;
@override@JsonKey() final  dynamic isDragging;
@override@JsonKey() final  double rotation;
@override@JsonKey() final  Size cardSize;
@override@JsonKey() final  TinderCardStatus status;

/// Create a copy of TinderCardState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TinderCardStateCopyWith<_TinderCardState> get copyWith => __$TinderCardStateCopyWithImpl<_TinderCardState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TinderCardState&&(identical(other.position, position) || other.position == position)&&const DeepCollectionEquality().equals(other.isDragging, isDragging)&&(identical(other.rotation, rotation) || other.rotation == rotation)&&(identical(other.cardSize, cardSize) || other.cardSize == cardSize)&&(identical(other.status, status) || other.status == status));
}


@override
int get hashCode => Object.hash(runtimeType,position,const DeepCollectionEquality().hash(isDragging),rotation,cardSize,status);

@override
String toString() {
  return 'TinderCardState(position: $position, isDragging: $isDragging, rotation: $rotation, cardSize: $cardSize, status: $status)';
}


}

/// @nodoc
abstract mixin class _$TinderCardStateCopyWith<$Res> implements $TinderCardStateCopyWith<$Res> {
  factory _$TinderCardStateCopyWith(_TinderCardState value, $Res Function(_TinderCardState) _then) = __$TinderCardStateCopyWithImpl;
@override @useResult
$Res call({
 Offset position, dynamic isDragging, double rotation, Size cardSize, TinderCardStatus status
});




}
/// @nodoc
class __$TinderCardStateCopyWithImpl<$Res>
    implements _$TinderCardStateCopyWith<$Res> {
  __$TinderCardStateCopyWithImpl(this._self, this._then);

  final _TinderCardState _self;
  final $Res Function(_TinderCardState) _then;

/// Create a copy of TinderCardState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? position = null,Object? isDragging = freezed,Object? rotation = null,Object? cardSize = null,Object? status = null,}) {
  return _then(_TinderCardState(
position: null == position ? _self.position : position // ignore: cast_nullable_to_non_nullable
as Offset,isDragging: freezed == isDragging ? _self.isDragging : isDragging // ignore: cast_nullable_to_non_nullable
as dynamic,rotation: null == rotation ? _self.rotation : rotation // ignore: cast_nullable_to_non_nullable
as double,cardSize: null == cardSize ? _self.cardSize : cardSize // ignore: cast_nullable_to_non_nullable
as Size,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as TinderCardStatus,
  ));
}


}

// dart format on
