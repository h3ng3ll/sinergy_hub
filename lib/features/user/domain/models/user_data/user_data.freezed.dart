// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$UserData {

 String get uid; String? get avatarUrl; String? get avatarPath; String? get firstName; String? get lastName; int? get age; String? get aboutMe; UserProfiler get profiler;@TimestampConverter() DateTime get createdAt; bool get isOnline;@TimestampConverter() DateTime get lastSeen;
/// Create a copy of UserData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserDataCopyWith<UserData> get copyWith => _$UserDataCopyWithImpl<UserData>(this as UserData, _$identity);

  /// Serializes this UserData to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserData&&(identical(other.uid, uid) || other.uid == uid)&&(identical(other.avatarUrl, avatarUrl) || other.avatarUrl == avatarUrl)&&(identical(other.avatarPath, avatarPath) || other.avatarPath == avatarPath)&&(identical(other.firstName, firstName) || other.firstName == firstName)&&(identical(other.lastName, lastName) || other.lastName == lastName)&&(identical(other.age, age) || other.age == age)&&(identical(other.aboutMe, aboutMe) || other.aboutMe == aboutMe)&&(identical(other.profiler, profiler) || other.profiler == profiler)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.isOnline, isOnline) || other.isOnline == isOnline)&&(identical(other.lastSeen, lastSeen) || other.lastSeen == lastSeen));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,uid,avatarUrl,avatarPath,firstName,lastName,age,aboutMe,profiler,createdAt,isOnline,lastSeen);



}

/// @nodoc
abstract mixin class $UserDataCopyWith<$Res>  {
  factory $UserDataCopyWith(UserData value, $Res Function(UserData) _then) = _$UserDataCopyWithImpl;
@useResult
$Res call({
 String uid, String? avatarUrl, String? avatarPath, String? firstName, String? lastName, int? age, String? aboutMe, UserProfiler profiler,@TimestampConverter() DateTime createdAt, bool isOnline,@TimestampConverter() DateTime lastSeen
});


$UserProfilerCopyWith<$Res> get profiler;

}
/// @nodoc
class _$UserDataCopyWithImpl<$Res>
    implements $UserDataCopyWith<$Res> {
  _$UserDataCopyWithImpl(this._self, this._then);

  final UserData _self;
  final $Res Function(UserData) _then;

/// Create a copy of UserData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? uid = null,Object? avatarUrl = freezed,Object? avatarPath = freezed,Object? firstName = freezed,Object? lastName = freezed,Object? age = freezed,Object? aboutMe = freezed,Object? profiler = null,Object? createdAt = null,Object? isOnline = null,Object? lastSeen = null,}) {
  return _then(_self.copyWith(
uid: null == uid ? _self.uid : uid // ignore: cast_nullable_to_non_nullable
as String,avatarUrl: freezed == avatarUrl ? _self.avatarUrl : avatarUrl // ignore: cast_nullable_to_non_nullable
as String?,avatarPath: freezed == avatarPath ? _self.avatarPath : avatarPath // ignore: cast_nullable_to_non_nullable
as String?,firstName: freezed == firstName ? _self.firstName : firstName // ignore: cast_nullable_to_non_nullable
as String?,lastName: freezed == lastName ? _self.lastName : lastName // ignore: cast_nullable_to_non_nullable
as String?,age: freezed == age ? _self.age : age // ignore: cast_nullable_to_non_nullable
as int?,aboutMe: freezed == aboutMe ? _self.aboutMe : aboutMe // ignore: cast_nullable_to_non_nullable
as String?,profiler: null == profiler ? _self.profiler : profiler // ignore: cast_nullable_to_non_nullable
as UserProfiler,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,isOnline: null == isOnline ? _self.isOnline : isOnline // ignore: cast_nullable_to_non_nullable
as bool,lastSeen: null == lastSeen ? _self.lastSeen : lastSeen // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}
/// Create a copy of UserData
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserProfilerCopyWith<$Res> get profiler {
  
  return $UserProfilerCopyWith<$Res>(_self.profiler, (value) {
    return _then(_self.copyWith(profiler: value));
  });
}
}


/// Adds pattern-matching-related methods to [UserData].
extension UserDataPatterns on UserData {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UserData value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UserData() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UserData value)  $default,){
final _that = this;
switch (_that) {
case _UserData():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UserData value)?  $default,){
final _that = this;
switch (_that) {
case _UserData() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String uid,  String? avatarUrl,  String? avatarPath,  String? firstName,  String? lastName,  int? age,  String? aboutMe,  UserProfiler profiler, @TimestampConverter()  DateTime createdAt,  bool isOnline, @TimestampConverter()  DateTime lastSeen)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UserData() when $default != null:
return $default(_that.uid,_that.avatarUrl,_that.avatarPath,_that.firstName,_that.lastName,_that.age,_that.aboutMe,_that.profiler,_that.createdAt,_that.isOnline,_that.lastSeen);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String uid,  String? avatarUrl,  String? avatarPath,  String? firstName,  String? lastName,  int? age,  String? aboutMe,  UserProfiler profiler, @TimestampConverter()  DateTime createdAt,  bool isOnline, @TimestampConverter()  DateTime lastSeen)  $default,) {final _that = this;
switch (_that) {
case _UserData():
return $default(_that.uid,_that.avatarUrl,_that.avatarPath,_that.firstName,_that.lastName,_that.age,_that.aboutMe,_that.profiler,_that.createdAt,_that.isOnline,_that.lastSeen);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String uid,  String? avatarUrl,  String? avatarPath,  String? firstName,  String? lastName,  int? age,  String? aboutMe,  UserProfiler profiler, @TimestampConverter()  DateTime createdAt,  bool isOnline, @TimestampConverter()  DateTime lastSeen)?  $default,) {final _that = this;
switch (_that) {
case _UserData() when $default != null:
return $default(_that.uid,_that.avatarUrl,_that.avatarPath,_that.firstName,_that.lastName,_that.age,_that.aboutMe,_that.profiler,_that.createdAt,_that.isOnline,_that.lastSeen);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _UserData extends UserData {
  const _UserData({required this.uid, this.avatarUrl, this.avatarPath, this.firstName, this.lastName, this.age, this.aboutMe, required this.profiler, @TimestampConverter() required this.createdAt, this.isOnline = false, @TimestampConverter() required this.lastSeen}): super._();
  factory _UserData.fromJson(Map<String, dynamic> json) => _$UserDataFromJson(json);

@override final  String uid;
@override final  String? avatarUrl;
@override final  String? avatarPath;
@override final  String? firstName;
@override final  String? lastName;
@override final  int? age;
@override final  String? aboutMe;
@override final  UserProfiler profiler;
@override@TimestampConverter() final  DateTime createdAt;
@override@JsonKey() final  bool isOnline;
@override@TimestampConverter() final  DateTime lastSeen;

/// Create a copy of UserData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UserDataCopyWith<_UserData> get copyWith => __$UserDataCopyWithImpl<_UserData>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UserDataToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UserData&&(identical(other.uid, uid) || other.uid == uid)&&(identical(other.avatarUrl, avatarUrl) || other.avatarUrl == avatarUrl)&&(identical(other.avatarPath, avatarPath) || other.avatarPath == avatarPath)&&(identical(other.firstName, firstName) || other.firstName == firstName)&&(identical(other.lastName, lastName) || other.lastName == lastName)&&(identical(other.age, age) || other.age == age)&&(identical(other.aboutMe, aboutMe) || other.aboutMe == aboutMe)&&(identical(other.profiler, profiler) || other.profiler == profiler)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.isOnline, isOnline) || other.isOnline == isOnline)&&(identical(other.lastSeen, lastSeen) || other.lastSeen == lastSeen));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,uid,avatarUrl,avatarPath,firstName,lastName,age,aboutMe,profiler,createdAt,isOnline,lastSeen);



}

/// @nodoc
abstract mixin class _$UserDataCopyWith<$Res> implements $UserDataCopyWith<$Res> {
  factory _$UserDataCopyWith(_UserData value, $Res Function(_UserData) _then) = __$UserDataCopyWithImpl;
@override @useResult
$Res call({
 String uid, String? avatarUrl, String? avatarPath, String? firstName, String? lastName, int? age, String? aboutMe, UserProfiler profiler,@TimestampConverter() DateTime createdAt, bool isOnline,@TimestampConverter() DateTime lastSeen
});


@override $UserProfilerCopyWith<$Res> get profiler;

}
/// @nodoc
class __$UserDataCopyWithImpl<$Res>
    implements _$UserDataCopyWith<$Res> {
  __$UserDataCopyWithImpl(this._self, this._then);

  final _UserData _self;
  final $Res Function(_UserData) _then;

/// Create a copy of UserData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? uid = null,Object? avatarUrl = freezed,Object? avatarPath = freezed,Object? firstName = freezed,Object? lastName = freezed,Object? age = freezed,Object? aboutMe = freezed,Object? profiler = null,Object? createdAt = null,Object? isOnline = null,Object? lastSeen = null,}) {
  return _then(_UserData(
uid: null == uid ? _self.uid : uid // ignore: cast_nullable_to_non_nullable
as String,avatarUrl: freezed == avatarUrl ? _self.avatarUrl : avatarUrl // ignore: cast_nullable_to_non_nullable
as String?,avatarPath: freezed == avatarPath ? _self.avatarPath : avatarPath // ignore: cast_nullable_to_non_nullable
as String?,firstName: freezed == firstName ? _self.firstName : firstName // ignore: cast_nullable_to_non_nullable
as String?,lastName: freezed == lastName ? _self.lastName : lastName // ignore: cast_nullable_to_non_nullable
as String?,age: freezed == age ? _self.age : age // ignore: cast_nullable_to_non_nullable
as int?,aboutMe: freezed == aboutMe ? _self.aboutMe : aboutMe // ignore: cast_nullable_to_non_nullable
as String?,profiler: null == profiler ? _self.profiler : profiler // ignore: cast_nullable_to_non_nullable
as UserProfiler,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,isOnline: null == isOnline ? _self.isOnline : isOnline // ignore: cast_nullable_to_non_nullable
as bool,lastSeen: null == lastSeen ? _self.lastSeen : lastSeen // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

/// Create a copy of UserData
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserProfilerCopyWith<$Res> get profiler {
  
  return $UserProfilerCopyWith<$Res>(_self.profiler, (value) {
    return _then(_self.copyWith(profiler: value));
  });
}
}

// dart format on
