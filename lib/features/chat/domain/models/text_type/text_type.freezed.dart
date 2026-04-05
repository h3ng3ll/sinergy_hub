// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'text_type.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$TextType {

 String get value;
/// Create a copy of TextType
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TextTypeCopyWith<TextType> get copyWith => _$TextTypeCopyWithImpl<TextType>(this as TextType, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TextType&&(identical(other.value, value) || other.value == value));
}


@override
int get hashCode => Object.hash(runtimeType,value);

@override
String toString() {
  return 'TextType(value: $value)';
}


}

/// @nodoc
abstract mixin class $TextTypeCopyWith<$Res>  {
  factory $TextTypeCopyWith(TextType value, $Res Function(TextType) _then) = _$TextTypeCopyWithImpl;
@useResult
$Res call({
 String value
});




}
/// @nodoc
class _$TextTypeCopyWithImpl<$Res>
    implements $TextTypeCopyWith<$Res> {
  _$TextTypeCopyWithImpl(this._self, this._then);

  final TextType _self;
  final $Res Function(TextType) _then;

/// Create a copy of TextType
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? value = null,}) {
  return _then(_self.copyWith(
value: null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [TextType].
extension TextTypePatterns on TextType {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( TextPlain value)?  text,TResult Function( TextUrl value)?  url,TResult Function( TextEmail value)?  email,required TResult orElse(),}){
final _that = this;
switch (_that) {
case TextPlain() when text != null:
return text(_that);case TextUrl() when url != null:
return url(_that);case TextEmail() when email != null:
return email(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( TextPlain value)  text,required TResult Function( TextUrl value)  url,required TResult Function( TextEmail value)  email,}){
final _that = this;
switch (_that) {
case TextPlain():
return text(_that);case TextUrl():
return url(_that);case TextEmail():
return email(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( TextPlain value)?  text,TResult? Function( TextUrl value)?  url,TResult? Function( TextEmail value)?  email,}){
final _that = this;
switch (_that) {
case TextPlain() when text != null:
return text(_that);case TextUrl() when url != null:
return url(_that);case TextEmail() when email != null:
return email(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String value)?  text,TResult Function( String value)?  url,TResult Function( String value)?  email,required TResult orElse(),}) {final _that = this;
switch (_that) {
case TextPlain() when text != null:
return text(_that.value);case TextUrl() when url != null:
return url(_that.value);case TextEmail() when email != null:
return email(_that.value);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String value)  text,required TResult Function( String value)  url,required TResult Function( String value)  email,}) {final _that = this;
switch (_that) {
case TextPlain():
return text(_that.value);case TextUrl():
return url(_that.value);case TextEmail():
return email(_that.value);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String value)?  text,TResult? Function( String value)?  url,TResult? Function( String value)?  email,}) {final _that = this;
switch (_that) {
case TextPlain() when text != null:
return text(_that.value);case TextUrl() when url != null:
return url(_that.value);case TextEmail() when email != null:
return email(_that.value);case _:
  return null;

}
}

}

/// @nodoc


class TextPlain implements TextType {
  const TextPlain(this.value);
  

@override final  String value;

/// Create a copy of TextType
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TextPlainCopyWith<TextPlain> get copyWith => _$TextPlainCopyWithImpl<TextPlain>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TextPlain&&(identical(other.value, value) || other.value == value));
}


@override
int get hashCode => Object.hash(runtimeType,value);

@override
String toString() {
  return 'TextType.text(value: $value)';
}


}

/// @nodoc
abstract mixin class $TextPlainCopyWith<$Res> implements $TextTypeCopyWith<$Res> {
  factory $TextPlainCopyWith(TextPlain value, $Res Function(TextPlain) _then) = _$TextPlainCopyWithImpl;
@override @useResult
$Res call({
 String value
});




}
/// @nodoc
class _$TextPlainCopyWithImpl<$Res>
    implements $TextPlainCopyWith<$Res> {
  _$TextPlainCopyWithImpl(this._self, this._then);

  final TextPlain _self;
  final $Res Function(TextPlain) _then;

/// Create a copy of TextType
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? value = null,}) {
  return _then(TextPlain(
null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class TextUrl implements TextType {
  const TextUrl(this.value);
  

@override final  String value;

/// Create a copy of TextType
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TextUrlCopyWith<TextUrl> get copyWith => _$TextUrlCopyWithImpl<TextUrl>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TextUrl&&(identical(other.value, value) || other.value == value));
}


@override
int get hashCode => Object.hash(runtimeType,value);

@override
String toString() {
  return 'TextType.url(value: $value)';
}


}

/// @nodoc
abstract mixin class $TextUrlCopyWith<$Res> implements $TextTypeCopyWith<$Res> {
  factory $TextUrlCopyWith(TextUrl value, $Res Function(TextUrl) _then) = _$TextUrlCopyWithImpl;
@override @useResult
$Res call({
 String value
});




}
/// @nodoc
class _$TextUrlCopyWithImpl<$Res>
    implements $TextUrlCopyWith<$Res> {
  _$TextUrlCopyWithImpl(this._self, this._then);

  final TextUrl _self;
  final $Res Function(TextUrl) _then;

/// Create a copy of TextType
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? value = null,}) {
  return _then(TextUrl(
null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class TextEmail implements TextType {
  const TextEmail(this.value);
  

@override final  String value;

/// Create a copy of TextType
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TextEmailCopyWith<TextEmail> get copyWith => _$TextEmailCopyWithImpl<TextEmail>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TextEmail&&(identical(other.value, value) || other.value == value));
}


@override
int get hashCode => Object.hash(runtimeType,value);

@override
String toString() {
  return 'TextType.email(value: $value)';
}


}

/// @nodoc
abstract mixin class $TextEmailCopyWith<$Res> implements $TextTypeCopyWith<$Res> {
  factory $TextEmailCopyWith(TextEmail value, $Res Function(TextEmail) _then) = _$TextEmailCopyWithImpl;
@override @useResult
$Res call({
 String value
});




}
/// @nodoc
class _$TextEmailCopyWithImpl<$Res>
    implements $TextEmailCopyWith<$Res> {
  _$TextEmailCopyWithImpl(this._self, this._then);

  final TextEmail _self;
  final $Res Function(TextEmail) _then;

/// Create a copy of TextType
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? value = null,}) {
  return _then(TextEmail(
null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
