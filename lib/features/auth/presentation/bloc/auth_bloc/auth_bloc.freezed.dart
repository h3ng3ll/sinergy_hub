// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AuthEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AuthEvent()';
}


}

/// @nodoc
class $AuthEventCopyWith<$Res>  {
$AuthEventCopyWith(AuthEvent _, $Res Function(AuthEvent) __);
}


/// Adds pattern-matching-related methods to [AuthEvent].
extension AuthEventPatterns on AuthEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Init value)?  init,TResult Function( _Listen value)?  listen,TResult Function( _SignInViaGoogle value)?  signInViaGoogle,TResult Function( _SignInViaApple value)?  signInViaApple,TResult Function( _SignOut value)?  signOut,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Init() when init != null:
return init(_that);case _Listen() when listen != null:
return listen(_that);case _SignInViaGoogle() when signInViaGoogle != null:
return signInViaGoogle(_that);case _SignInViaApple() when signInViaApple != null:
return signInViaApple(_that);case _SignOut() when signOut != null:
return signOut(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Init value)  init,required TResult Function( _Listen value)  listen,required TResult Function( _SignInViaGoogle value)  signInViaGoogle,required TResult Function( _SignInViaApple value)  signInViaApple,required TResult Function( _SignOut value)  signOut,}){
final _that = this;
switch (_that) {
case _Init():
return init(_that);case _Listen():
return listen(_that);case _SignInViaGoogle():
return signInViaGoogle(_that);case _SignInViaApple():
return signInViaApple(_that);case _SignOut():
return signOut(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Init value)?  init,TResult? Function( _Listen value)?  listen,TResult? Function( _SignInViaGoogle value)?  signInViaGoogle,TResult? Function( _SignInViaApple value)?  signInViaApple,TResult? Function( _SignOut value)?  signOut,}){
final _that = this;
switch (_that) {
case _Init() when init != null:
return init(_that);case _Listen() when listen != null:
return listen(_that);case _SignInViaGoogle() when signInViaGoogle != null:
return signInViaGoogle(_that);case _SignInViaApple() when signInViaApple != null:
return signInViaApple(_that);case _SignOut() when signOut != null:
return signOut(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  init,TResult Function()?  listen,TResult Function()?  signInViaGoogle,TResult Function()?  signInViaApple,TResult Function()?  signOut,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Init() when init != null:
return init();case _Listen() when listen != null:
return listen();case _SignInViaGoogle() when signInViaGoogle != null:
return signInViaGoogle();case _SignInViaApple() when signInViaApple != null:
return signInViaApple();case _SignOut() when signOut != null:
return signOut();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  init,required TResult Function()  listen,required TResult Function()  signInViaGoogle,required TResult Function()  signInViaApple,required TResult Function()  signOut,}) {final _that = this;
switch (_that) {
case _Init():
return init();case _Listen():
return listen();case _SignInViaGoogle():
return signInViaGoogle();case _SignInViaApple():
return signInViaApple();case _SignOut():
return signOut();case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  init,TResult? Function()?  listen,TResult? Function()?  signInViaGoogle,TResult? Function()?  signInViaApple,TResult? Function()?  signOut,}) {final _that = this;
switch (_that) {
case _Init() when init != null:
return init();case _Listen() when listen != null:
return listen();case _SignInViaGoogle() when signInViaGoogle != null:
return signInViaGoogle();case _SignInViaApple() when signInViaApple != null:
return signInViaApple();case _SignOut() when signOut != null:
return signOut();case _:
  return null;

}
}

}

/// @nodoc


class _Init implements AuthEvent {
  const _Init();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Init);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AuthEvent.init()';
}


}




/// @nodoc


class _Listen implements AuthEvent {
  const _Listen();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Listen);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AuthEvent.listen()';
}


}




/// @nodoc


class _SignInViaGoogle implements AuthEvent {
  const _SignInViaGoogle();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SignInViaGoogle);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AuthEvent.signInViaGoogle()';
}


}




/// @nodoc


class _SignInViaApple implements AuthEvent {
  const _SignInViaApple();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SignInViaApple);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AuthEvent.signInViaApple()';
}


}




/// @nodoc


class _SignOut implements AuthEvent {
  const _SignOut();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SignOut);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AuthEvent.signOut()';
}


}




/// @nodoc
mixin _$AuthState {

 AuthStatus get status; User? get user; String get errorMessage; String get loadingMessage; AuthCredential? get authCredential; dynamic get isEmailVerified;/// verificationPart
 String? get verificationId; int? get resendToken;
/// Create a copy of AuthState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AuthStateCopyWith<AuthState> get copyWith => _$AuthStateCopyWithImpl<AuthState>(this as AuthState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthState&&(identical(other.status, status) || other.status == status)&&(identical(other.user, user) || other.user == user)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage)&&(identical(other.loadingMessage, loadingMessage) || other.loadingMessage == loadingMessage)&&(identical(other.authCredential, authCredential) || other.authCredential == authCredential)&&const DeepCollectionEquality().equals(other.isEmailVerified, isEmailVerified)&&(identical(other.verificationId, verificationId) || other.verificationId == verificationId)&&(identical(other.resendToken, resendToken) || other.resendToken == resendToken));
}


@override
int get hashCode => Object.hash(runtimeType,status,user,errorMessage,loadingMessage,authCredential,const DeepCollectionEquality().hash(isEmailVerified),verificationId,resendToken);

@override
String toString() {
  return 'AuthState(status: $status, user: $user, errorMessage: $errorMessage, loadingMessage: $loadingMessage, authCredential: $authCredential, isEmailVerified: $isEmailVerified, verificationId: $verificationId, resendToken: $resendToken)';
}


}

/// @nodoc
abstract mixin class $AuthStateCopyWith<$Res>  {
  factory $AuthStateCopyWith(AuthState value, $Res Function(AuthState) _then) = _$AuthStateCopyWithImpl;
@useResult
$Res call({
 AuthStatus status, User? user, String errorMessage, String loadingMessage, AuthCredential? authCredential, dynamic isEmailVerified, String? verificationId, int? resendToken
});




}
/// @nodoc
class _$AuthStateCopyWithImpl<$Res>
    implements $AuthStateCopyWith<$Res> {
  _$AuthStateCopyWithImpl(this._self, this._then);

  final AuthState _self;
  final $Res Function(AuthState) _then;

/// Create a copy of AuthState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = null,Object? user = freezed,Object? errorMessage = null,Object? loadingMessage = null,Object? authCredential = freezed,Object? isEmailVerified = freezed,Object? verificationId = freezed,Object? resendToken = freezed,}) {
  return _then(_self.copyWith(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as AuthStatus,user: freezed == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as User?,errorMessage: null == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String,loadingMessage: null == loadingMessage ? _self.loadingMessage : loadingMessage // ignore: cast_nullable_to_non_nullable
as String,authCredential: freezed == authCredential ? _self.authCredential : authCredential // ignore: cast_nullable_to_non_nullable
as AuthCredential?,isEmailVerified: freezed == isEmailVerified ? _self.isEmailVerified : isEmailVerified // ignore: cast_nullable_to_non_nullable
as dynamic,verificationId: freezed == verificationId ? _self.verificationId : verificationId // ignore: cast_nullable_to_non_nullable
as String?,resendToken: freezed == resendToken ? _self.resendToken : resendToken // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// Adds pattern-matching-related methods to [AuthState].
extension AuthStatePatterns on AuthState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AuthState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AuthState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AuthState value)  $default,){
final _that = this;
switch (_that) {
case _AuthState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AuthState value)?  $default,){
final _that = this;
switch (_that) {
case _AuthState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( AuthStatus status,  User? user,  String errorMessage,  String loadingMessage,  AuthCredential? authCredential,  dynamic isEmailVerified,  String? verificationId,  int? resendToken)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AuthState() when $default != null:
return $default(_that.status,_that.user,_that.errorMessage,_that.loadingMessage,_that.authCredential,_that.isEmailVerified,_that.verificationId,_that.resendToken);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( AuthStatus status,  User? user,  String errorMessage,  String loadingMessage,  AuthCredential? authCredential,  dynamic isEmailVerified,  String? verificationId,  int? resendToken)  $default,) {final _that = this;
switch (_that) {
case _AuthState():
return $default(_that.status,_that.user,_that.errorMessage,_that.loadingMessage,_that.authCredential,_that.isEmailVerified,_that.verificationId,_that.resendToken);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( AuthStatus status,  User? user,  String errorMessage,  String loadingMessage,  AuthCredential? authCredential,  dynamic isEmailVerified,  String? verificationId,  int? resendToken)?  $default,) {final _that = this;
switch (_that) {
case _AuthState() when $default != null:
return $default(_that.status,_that.user,_that.errorMessage,_that.loadingMessage,_that.authCredential,_that.isEmailVerified,_that.verificationId,_that.resendToken);case _:
  return null;

}
}

}

/// @nodoc


class _AuthState implements AuthState {
  const _AuthState({this.status = AuthStatus.initial, this.user, this.errorMessage = '', this.loadingMessage = '', this.authCredential, this.isEmailVerified = false, this.verificationId, this.resendToken});
  

@override@JsonKey() final  AuthStatus status;
@override final  User? user;
@override@JsonKey() final  String errorMessage;
@override@JsonKey() final  String loadingMessage;
@override final  AuthCredential? authCredential;
@override@JsonKey() final  dynamic isEmailVerified;
/// verificationPart
@override final  String? verificationId;
@override final  int? resendToken;

/// Create a copy of AuthState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AuthStateCopyWith<_AuthState> get copyWith => __$AuthStateCopyWithImpl<_AuthState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AuthState&&(identical(other.status, status) || other.status == status)&&(identical(other.user, user) || other.user == user)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage)&&(identical(other.loadingMessage, loadingMessage) || other.loadingMessage == loadingMessage)&&(identical(other.authCredential, authCredential) || other.authCredential == authCredential)&&const DeepCollectionEquality().equals(other.isEmailVerified, isEmailVerified)&&(identical(other.verificationId, verificationId) || other.verificationId == verificationId)&&(identical(other.resendToken, resendToken) || other.resendToken == resendToken));
}


@override
int get hashCode => Object.hash(runtimeType,status,user,errorMessage,loadingMessage,authCredential,const DeepCollectionEquality().hash(isEmailVerified),verificationId,resendToken);

@override
String toString() {
  return 'AuthState(status: $status, user: $user, errorMessage: $errorMessage, loadingMessage: $loadingMessage, authCredential: $authCredential, isEmailVerified: $isEmailVerified, verificationId: $verificationId, resendToken: $resendToken)';
}


}

/// @nodoc
abstract mixin class _$AuthStateCopyWith<$Res> implements $AuthStateCopyWith<$Res> {
  factory _$AuthStateCopyWith(_AuthState value, $Res Function(_AuthState) _then) = __$AuthStateCopyWithImpl;
@override @useResult
$Res call({
 AuthStatus status, User? user, String errorMessage, String loadingMessage, AuthCredential? authCredential, dynamic isEmailVerified, String? verificationId, int? resendToken
});




}
/// @nodoc
class __$AuthStateCopyWithImpl<$Res>
    implements _$AuthStateCopyWith<$Res> {
  __$AuthStateCopyWithImpl(this._self, this._then);

  final _AuthState _self;
  final $Res Function(_AuthState) _then;

/// Create a copy of AuthState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = null,Object? user = freezed,Object? errorMessage = null,Object? loadingMessage = null,Object? authCredential = freezed,Object? isEmailVerified = freezed,Object? verificationId = freezed,Object? resendToken = freezed,}) {
  return _then(_AuthState(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as AuthStatus,user: freezed == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as User?,errorMessage: null == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String,loadingMessage: null == loadingMessage ? _self.loadingMessage : loadingMessage // ignore: cast_nullable_to_non_nullable
as String,authCredential: freezed == authCredential ? _self.authCredential : authCredential // ignore: cast_nullable_to_non_nullable
as AuthCredential?,isEmailVerified: freezed == isEmailVerified ? _self.isEmailVerified : isEmailVerified // ignore: cast_nullable_to_non_nullable
as dynamic,verificationId: freezed == verificationId ? _self.verificationId : verificationId // ignore: cast_nullable_to_non_nullable
as String?,resendToken: freezed == resendToken ? _self.resendToken : resendToken // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}

// dart format on
