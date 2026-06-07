// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_temp_credentials.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AuthTempCredentials {

 String? get firstName; String? get lastName; String? get email;
/// Create a copy of AuthTempCredentials
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AuthTempCredentialsCopyWith<AuthTempCredentials> get copyWith => _$AuthTempCredentialsCopyWithImpl<AuthTempCredentials>(this as AuthTempCredentials, _$identity);

  /// Serializes this AuthTempCredentials to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthTempCredentials&&(identical(other.firstName, firstName) || other.firstName == firstName)&&(identical(other.lastName, lastName) || other.lastName == lastName)&&(identical(other.email, email) || other.email == email));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,firstName,lastName,email);

@override
String toString() {
  return 'AuthTempCredentials(firstName: $firstName, lastName: $lastName, email: $email)';
}


}

/// @nodoc
abstract mixin class $AuthTempCredentialsCopyWith<$Res>  {
  factory $AuthTempCredentialsCopyWith(AuthTempCredentials value, $Res Function(AuthTempCredentials) _then) = _$AuthTempCredentialsCopyWithImpl;
@useResult
$Res call({
 String? firstName, String? lastName, String? email
});




}
/// @nodoc
class _$AuthTempCredentialsCopyWithImpl<$Res>
    implements $AuthTempCredentialsCopyWith<$Res> {
  _$AuthTempCredentialsCopyWithImpl(this._self, this._then);

  final AuthTempCredentials _self;
  final $Res Function(AuthTempCredentials) _then;

/// Create a copy of AuthTempCredentials
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? firstName = freezed,Object? lastName = freezed,Object? email = freezed,}) {
  return _then(_self.copyWith(
firstName: freezed == firstName ? _self.firstName : firstName // ignore: cast_nullable_to_non_nullable
as String?,lastName: freezed == lastName ? _self.lastName : lastName // ignore: cast_nullable_to_non_nullable
as String?,email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [AuthTempCredentials].
extension AuthTempCredentialsPatterns on AuthTempCredentials {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AuthTempCredentials value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AuthTempCredentials() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AuthTempCredentials value)  $default,){
final _that = this;
switch (_that) {
case _AuthTempCredentials():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AuthTempCredentials value)?  $default,){
final _that = this;
switch (_that) {
case _AuthTempCredentials() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? firstName,  String? lastName,  String? email)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AuthTempCredentials() when $default != null:
return $default(_that.firstName,_that.lastName,_that.email);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? firstName,  String? lastName,  String? email)  $default,) {final _that = this;
switch (_that) {
case _AuthTempCredentials():
return $default(_that.firstName,_that.lastName,_that.email);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? firstName,  String? lastName,  String? email)?  $default,) {final _that = this;
switch (_that) {
case _AuthTempCredentials() when $default != null:
return $default(_that.firstName,_that.lastName,_that.email);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AuthTempCredentials extends AuthTempCredentials {
   _AuthTempCredentials({this.firstName, this.lastName, this.email}): super._();
  factory _AuthTempCredentials.fromJson(Map<String, dynamic> json) => _$AuthTempCredentialsFromJson(json);

@override final  String? firstName;
@override final  String? lastName;
@override final  String? email;

/// Create a copy of AuthTempCredentials
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AuthTempCredentialsCopyWith<_AuthTempCredentials> get copyWith => __$AuthTempCredentialsCopyWithImpl<_AuthTempCredentials>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AuthTempCredentialsToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AuthTempCredentials&&(identical(other.firstName, firstName) || other.firstName == firstName)&&(identical(other.lastName, lastName) || other.lastName == lastName)&&(identical(other.email, email) || other.email == email));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,firstName,lastName,email);

@override
String toString() {
  return 'AuthTempCredentials(firstName: $firstName, lastName: $lastName, email: $email)';
}


}

/// @nodoc
abstract mixin class _$AuthTempCredentialsCopyWith<$Res> implements $AuthTempCredentialsCopyWith<$Res> {
  factory _$AuthTempCredentialsCopyWith(_AuthTempCredentials value, $Res Function(_AuthTempCredentials) _then) = __$AuthTempCredentialsCopyWithImpl;
@override @useResult
$Res call({
 String? firstName, String? lastName, String? email
});




}
/// @nodoc
class __$AuthTempCredentialsCopyWithImpl<$Res>
    implements _$AuthTempCredentialsCopyWith<$Res> {
  __$AuthTempCredentialsCopyWithImpl(this._self, this._then);

  final _AuthTempCredentials _self;
  final $Res Function(_AuthTempCredentials) _then;

/// Create a copy of AuthTempCredentials
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? firstName = freezed,Object? lastName = freezed,Object? email = freezed,}) {
  return _then(_AuthTempCredentials(
firstName: freezed == firstName ? _self.firstName : firstName // ignore: cast_nullable_to_non_nullable
as String?,lastName: freezed == lastName ? _self.lastName : lastName // ignore: cast_nullable_to_non_nullable
as String?,email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
