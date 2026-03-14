// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chat_config_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ChatConfigDto {

 List<String> get archived; List<String> get favorite;
/// Create a copy of ChatConfigDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ChatConfigDtoCopyWith<ChatConfigDto> get copyWith => _$ChatConfigDtoCopyWithImpl<ChatConfigDto>(this as ChatConfigDto, _$identity);

  /// Serializes this ChatConfigDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChatConfigDto&&const DeepCollectionEquality().equals(other.archived, archived)&&const DeepCollectionEquality().equals(other.favorite, favorite));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(archived),const DeepCollectionEquality().hash(favorite));

@override
String toString() {
  return 'ChatConfigDto(archived: $archived, favorite: $favorite)';
}


}

/// @nodoc
abstract mixin class $ChatConfigDtoCopyWith<$Res>  {
  factory $ChatConfigDtoCopyWith(ChatConfigDto value, $Res Function(ChatConfigDto) _then) = _$ChatConfigDtoCopyWithImpl;
@useResult
$Res call({
 List<String> archived, List<String> favorite
});




}
/// @nodoc
class _$ChatConfigDtoCopyWithImpl<$Res>
    implements $ChatConfigDtoCopyWith<$Res> {
  _$ChatConfigDtoCopyWithImpl(this._self, this._then);

  final ChatConfigDto _self;
  final $Res Function(ChatConfigDto) _then;

/// Create a copy of ChatConfigDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? archived = null,Object? favorite = null,}) {
  return _then(_self.copyWith(
archived: null == archived ? _self.archived : archived // ignore: cast_nullable_to_non_nullable
as List<String>,favorite: null == favorite ? _self.favorite : favorite // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}

}


/// Adds pattern-matching-related methods to [ChatConfigDto].
extension ChatConfigDtoPatterns on ChatConfigDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ChatConfigDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ChatConfigDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ChatConfigDto value)  $default,){
final _that = this;
switch (_that) {
case _ChatConfigDto():
return $default(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ChatConfigDto value)?  $default,){
final _that = this;
switch (_that) {
case _ChatConfigDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<String> archived,  List<String> favorite)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ChatConfigDto() when $default != null:
return $default(_that.archived,_that.favorite);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<String> archived,  List<String> favorite)  $default,) {final _that = this;
switch (_that) {
case _ChatConfigDto():
return $default(_that.archived,_that.favorite);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<String> archived,  List<String> favorite)?  $default,) {final _that = this;
switch (_that) {
case _ChatConfigDto() when $default != null:
return $default(_that.archived,_that.favorite);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ChatConfigDto extends ChatConfigDto {
  const _ChatConfigDto({final  List<String> archived = const [], final  List<String> favorite = const []}): _archived = archived,_favorite = favorite,super._();
  factory _ChatConfigDto.fromJson(Map<String, dynamic> json) => _$ChatConfigDtoFromJson(json);

 final  List<String> _archived;
@override@JsonKey() List<String> get archived {
  if (_archived is EqualUnmodifiableListView) return _archived;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_archived);
}

 final  List<String> _favorite;
@override@JsonKey() List<String> get favorite {
  if (_favorite is EqualUnmodifiableListView) return _favorite;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_favorite);
}


/// Create a copy of ChatConfigDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ChatConfigDtoCopyWith<_ChatConfigDto> get copyWith => __$ChatConfigDtoCopyWithImpl<_ChatConfigDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ChatConfigDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ChatConfigDto&&const DeepCollectionEquality().equals(other._archived, _archived)&&const DeepCollectionEquality().equals(other._favorite, _favorite));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_archived),const DeepCollectionEquality().hash(_favorite));

@override
String toString() {
  return 'ChatConfigDto(archived: $archived, favorite: $favorite)';
}


}

/// @nodoc
abstract mixin class _$ChatConfigDtoCopyWith<$Res> implements $ChatConfigDtoCopyWith<$Res> {
  factory _$ChatConfigDtoCopyWith(_ChatConfigDto value, $Res Function(_ChatConfigDto) _then) = __$ChatConfigDtoCopyWithImpl;
@override @useResult
$Res call({
 List<String> archived, List<String> favorite
});




}
/// @nodoc
class __$ChatConfigDtoCopyWithImpl<$Res>
    implements _$ChatConfigDtoCopyWith<$Res> {
  __$ChatConfigDtoCopyWithImpl(this._self, this._then);

  final _ChatConfigDto _self;
  final $Res Function(_ChatConfigDto) _then;

/// Create a copy of ChatConfigDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? archived = null,Object? favorite = null,}) {
  return _then(_ChatConfigDto(
archived: null == archived ? _self._archived : archived // ignore: cast_nullable_to_non_nullable
as List<String>,favorite: null == favorite ? _self._favorite : favorite // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}


}

// dart format on
