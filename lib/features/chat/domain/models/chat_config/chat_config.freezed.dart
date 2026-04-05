// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chat_config.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ChatConfig {

/// Fix to check if web don't broke and
/// it properly accept List<bool> data
@JsonKey(fromJson: _listFromJson) List<String> get archived;@JsonKey(fromJson: _listFromJson) List<String> get favorite;
/// Create a copy of ChatConfig
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ChatConfigCopyWith<ChatConfig> get copyWith => _$ChatConfigCopyWithImpl<ChatConfig>(this as ChatConfig, _$identity);

  /// Serializes this ChatConfig to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChatConfig&&const DeepCollectionEquality().equals(other.archived, archived)&&const DeepCollectionEquality().equals(other.favorite, favorite));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(archived),const DeepCollectionEquality().hash(favorite));

@override
String toString() {
  return 'ChatConfig(archived: $archived, favorite: $favorite)';
}


}

/// @nodoc
abstract mixin class $ChatConfigCopyWith<$Res>  {
  factory $ChatConfigCopyWith(ChatConfig value, $Res Function(ChatConfig) _then) = _$ChatConfigCopyWithImpl;
@useResult
$Res call({
@JsonKey(fromJson: _listFromJson) List<String> archived,@JsonKey(fromJson: _listFromJson) List<String> favorite
});




}
/// @nodoc
class _$ChatConfigCopyWithImpl<$Res>
    implements $ChatConfigCopyWith<$Res> {
  _$ChatConfigCopyWithImpl(this._self, this._then);

  final ChatConfig _self;
  final $Res Function(ChatConfig) _then;

/// Create a copy of ChatConfig
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? archived = null,Object? favorite = null,}) {
  return _then(_self.copyWith(
archived: null == archived ? _self.archived : archived // ignore: cast_nullable_to_non_nullable
as List<String>,favorite: null == favorite ? _self.favorite : favorite // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}

}


/// Adds pattern-matching-related methods to [ChatConfig].
extension ChatConfigPatterns on ChatConfig {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ChatConfig value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ChatConfig() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ChatConfig value)  $default,){
final _that = this;
switch (_that) {
case _ChatConfig():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ChatConfig value)?  $default,){
final _that = this;
switch (_that) {
case _ChatConfig() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(fromJson: _listFromJson)  List<String> archived, @JsonKey(fromJson: _listFromJson)  List<String> favorite)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ChatConfig() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(fromJson: _listFromJson)  List<String> archived, @JsonKey(fromJson: _listFromJson)  List<String> favorite)  $default,) {final _that = this;
switch (_that) {
case _ChatConfig():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(fromJson: _listFromJson)  List<String> archived, @JsonKey(fromJson: _listFromJson)  List<String> favorite)?  $default,) {final _that = this;
switch (_that) {
case _ChatConfig() when $default != null:
return $default(_that.archived,_that.favorite);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ChatConfig implements ChatConfig {
  const _ChatConfig({@JsonKey(fromJson: _listFromJson) final  List<String> archived = const [], @JsonKey(fromJson: _listFromJson) final  List<String> favorite = const []}): _archived = archived,_favorite = favorite;
  factory _ChatConfig.fromJson(Map<String, dynamic> json) => _$ChatConfigFromJson(json);

/// Fix to check if web don't broke and
/// it properly accept List<bool> data
 final  List<String> _archived;
/// Fix to check if web don't broke and
/// it properly accept List<bool> data
@override@JsonKey(fromJson: _listFromJson) List<String> get archived {
  if (_archived is EqualUnmodifiableListView) return _archived;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_archived);
}

 final  List<String> _favorite;
@override@JsonKey(fromJson: _listFromJson) List<String> get favorite {
  if (_favorite is EqualUnmodifiableListView) return _favorite;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_favorite);
}


/// Create a copy of ChatConfig
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ChatConfigCopyWith<_ChatConfig> get copyWith => __$ChatConfigCopyWithImpl<_ChatConfig>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ChatConfigToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ChatConfig&&const DeepCollectionEquality().equals(other._archived, _archived)&&const DeepCollectionEquality().equals(other._favorite, _favorite));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_archived),const DeepCollectionEquality().hash(_favorite));

@override
String toString() {
  return 'ChatConfig(archived: $archived, favorite: $favorite)';
}


}

/// @nodoc
abstract mixin class _$ChatConfigCopyWith<$Res> implements $ChatConfigCopyWith<$Res> {
  factory _$ChatConfigCopyWith(_ChatConfig value, $Res Function(_ChatConfig) _then) = __$ChatConfigCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(fromJson: _listFromJson) List<String> archived,@JsonKey(fromJson: _listFromJson) List<String> favorite
});




}
/// @nodoc
class __$ChatConfigCopyWithImpl<$Res>
    implements _$ChatConfigCopyWith<$Res> {
  __$ChatConfigCopyWithImpl(this._self, this._then);

  final _ChatConfig _self;
  final $Res Function(_ChatConfig) _then;

/// Create a copy of ChatConfig
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? archived = null,Object? favorite = null,}) {
  return _then(_ChatConfig(
archived: null == archived ? _self._archived : archived // ignore: cast_nullable_to_non_nullable
as List<String>,favorite: null == favorite ? _self._favorite : favorite // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}


}

// dart format on
