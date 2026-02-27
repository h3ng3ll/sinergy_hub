// // GENERATED CODE - DO NOT MODIFY BY HAND
// // coverage:ignore-file
// // ignore_for_file: type=lint
// // ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark
//
// part of 'people_bloc.dart';
//
// // **************************************************************************
// // FreezedGenerator
// // **************************************************************************
//
// // dart format off
// T _$identity<T>(T value) => value;
// /// @nodoc
// mixin _$PeopleEvent {
//
//
//
//
//
// @override
// bool operator ==(Object other) {
//   return identical(this, other) || (other.runtimeType == runtimeType&&other is PeopleEvent);
// }
//
//
// @override
// int get hashCode => runtimeType.hashCode;
//
// @override
// String toString() {
//   return 'PeopleEvent()';
// }
//
//
// }
//
// /// @nodoc
// class $PeopleEventCopyWith<$Res>  {
// $PeopleEventCopyWith(PeopleEvent _, $Res Function(PeopleEvent) __);
// }
//
//
// /// Adds pattern-matching-related methods to [PeopleEvent].
// extension PeopleEventPatterns on PeopleEvent {
// /// A variant of `map` that fallback to returning `orElse`.
// ///
// /// It is equivalent to doing:
// /// ```dart
// /// switch (sealedClass) {
// ///   case final Subclass value:
// ///     return ...;
// ///   case _:
// ///     return orElse();
// /// }
// /// ```
//
// @optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _LoadAll value)?  loadAll,TResult Function( _GetUser value)?  getUser,required TResult orElse(),}){
// final _that = this;
// switch (_that) {
// case _LoadAll() when loadAll != null:
// return loadAll(_that);case _GetUser() when getUser != null:
// return getUser(_that);case _:
//   return orElse();
//
// }
// }
// /// A `switch`-like method, using callbacks.
// ///
// /// Callbacks receives the raw object, upcasted.
// /// It is equivalent to doing:
// /// ```dart
// /// switch (sealedClass) {
// ///   case final Subclass value:
// ///     return ...;
// ///   case final Subclass2 value:
// ///     return ...;
// /// }
// /// ```
//
// @optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _LoadAll value)  loadAll,required TResult Function( _GetUser value)  getUser,}){
// final _that = this;
// switch (_that) {
// case _LoadAll():
// return loadAll(_that);case _GetUser():
// return getUser(_that);case _:
//   throw StateError('Unexpected subclass');
//
// }
// }
// /// A variant of `map` that fallback to returning `null`.
// ///
// /// It is equivalent to doing:
// /// ```dart
// /// switch (sealedClass) {
// ///   case final Subclass value:
// ///     return ...;
// ///   case _:
// ///     return null;
// /// }
// /// ```
//
// @optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _LoadAll value)?  loadAll,TResult? Function( _GetUser value)?  getUser,}){
// final _that = this;
// switch (_that) {
// case _LoadAll() when loadAll != null:
// return loadAll(_that);case _GetUser() when getUser != null:
// return getUser(_that);case _:
//   return null;
//
// }
// }
// /// A variant of `when` that fallback to an `orElse` callback.
// ///
// /// It is equivalent to doing:
// /// ```dart
// /// switch (sealedClass) {
// ///   case Subclass(:final field):
// ///     return ...;
// ///   case _:
// ///     return orElse();
// /// }
// /// ```
//
// @optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( List<String> uids)?  loadAll,TResult Function( String uid)?  getUser,required TResult orElse(),}) {final _that = this;
// switch (_that) {
// case _LoadAll() when loadAll != null:
// return loadAll(_that.uids);case _GetUser() when getUser != null:
// return getUser(_that.uid);case _:
//   return orElse();
//
// }
// }
// /// A `switch`-like method, using callbacks.
// ///
// /// As opposed to `map`, this offers destructuring.
// /// It is equivalent to doing:
// /// ```dart
// /// switch (sealedClass) {
// ///   case Subclass(:final field):
// ///     return ...;
// ///   case Subclass2(:final field2):
// ///     return ...;
// /// }
// /// ```
//
// @optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( List<String> uids)  loadAll,required TResult Function( String uid)  getUser,}) {final _that = this;
// switch (_that) {
// case _LoadAll():
// return loadAll(_that.uids);case _GetUser():
// return getUser(_that.uid);case _:
//   throw StateError('Unexpected subclass');
//
// }
// }
// /// A variant of `when` that fallback to returning `null`
// ///
// /// It is equivalent to doing:
// /// ```dart
// /// switch (sealedClass) {
// ///   case Subclass(:final field):
// ///     return ...;
// ///   case _:
// ///     return null;
// /// }
// /// ```
//
// @optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( List<String> uids)?  loadAll,TResult? Function( String uid)?  getUser,}) {final _that = this;
// switch (_that) {
// case _LoadAll() when loadAll != null:
// return loadAll(_that.uids);case _GetUser() when getUser != null:
// return getUser(_that.uid);case _:
//   return null;
//
// }
// }
//
// }
//
// /// @nodoc
//
//
// class _LoadAll implements PeopleEvent {
//   const _LoadAll({required final  List<String> uids}): _uids = uids;
//
//
//  final  List<String> _uids;
//  List<String> get uids {
//   if (_uids is EqualUnmodifiableListView) return _uids;
//   // ignore: implicit_dynamic_type
//   return EqualUnmodifiableListView(_uids);
// }
//
//
// /// Create a copy of PeopleEvent
// /// with the given fields replaced by the non-null parameter values.
// @JsonKey(includeFromJson: false, includeToJson: false)
// @pragma('vm:prefer-inline')
// _$LoadAllCopyWith<_LoadAll> get copyWith => __$LoadAllCopyWithImpl<_LoadAll>(this, _$identity);
//
//
//
// @override
// bool operator ==(Object other) {
//   return identical(this, other) || (other.runtimeType == runtimeType&&other is _LoadAll&&const DeepCollectionEquality().equals(other._uids, _uids));
// }
//
//
// @override
// int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_uids));
//
// @override
// String toString() {
//   return 'PeopleEvent.loadAll(uids: $uids)';
// }
//
//
// }
//
// /// @nodoc
// abstract mixin class _$LoadAllCopyWith<$Res> implements $PeopleEventCopyWith<$Res> {
//   factory _$LoadAllCopyWith(_LoadAll value, $Res Function(_LoadAll) _then) = __$LoadAllCopyWithImpl;
// @useResult
// $Res call({
//  List<String> uids
// });
//
//
//
//
// }
// /// @nodoc
// class __$LoadAllCopyWithImpl<$Res>
//     implements _$LoadAllCopyWith<$Res> {
//   __$LoadAllCopyWithImpl(this._self, this._then);
//
//   final _LoadAll _self;
//   final $Res Function(_LoadAll) _then;
//
// /// Create a copy of PeopleEvent
// /// with the given fields replaced by the non-null parameter values.
// @pragma('vm:prefer-inline') $Res call({Object? uids = null,}) {
//   return _then(_LoadAll(
// uids: null == uids ? _self._uids : uids // ignore: cast_nullable_to_non_nullable
// as List<String>,
//   ));
// }
//
//
// }
//
// /// @nodoc
//
//
// class _GetUser implements PeopleEvent {
//   const _GetUser({required this.uid});
//
//
//  final  String uid;
//
// /// Create a copy of PeopleEvent
// /// with the given fields replaced by the non-null parameter values.
// @JsonKey(includeFromJson: false, includeToJson: false)
// @pragma('vm:prefer-inline')
// _$GetUserCopyWith<_GetUser> get copyWith => __$GetUserCopyWithImpl<_GetUser>(this, _$identity);
//
//
//
// @override
// bool operator ==(Object other) {
//   return identical(this, other) || (other.runtimeType == runtimeType&&other is _GetUser&&(identical(other.uid, uid) || other.uid == uid));
// }
//
//
// @override
// int get hashCode => Object.hash(runtimeType,uid);
//
// @override
// String toString() {
//   return 'PeopleEvent.getUser(uid: $uid)';
// }
//
//
// }
//
// /// @nodoc
// abstract mixin class _$GetUserCopyWith<$Res> implements $PeopleEventCopyWith<$Res> {
//   factory _$GetUserCopyWith(_GetUser value, $Res Function(_GetUser) _then) = __$GetUserCopyWithImpl;
// @useResult
// $Res call({
//  String uid
// });
//
//
//
//
// }
// /// @nodoc
// class __$GetUserCopyWithImpl<$Res>
//     implements _$GetUserCopyWith<$Res> {
//   __$GetUserCopyWithImpl(this._self, this._then);
//
//   final _GetUser _self;
//   final $Res Function(_GetUser) _then;
//
// /// Create a copy of PeopleEvent
// /// with the given fields replaced by the non-null parameter values.
// @pragma('vm:prefer-inline') $Res call({Object? uid = null,}) {
//   return _then(_GetUser(
// uid: null == uid ? _self.uid : uid // ignore: cast_nullable_to_non_nullable
// as String,
//   ));
// }
//
//
// }
//
// /// @nodoc
// mixin _$PeopleState {
//
//  Map<String, UserData> get users; PeopleStatus get status; String get errorMessage;
// /// Create a copy of PeopleState
// /// with the given fields replaced by the non-null parameter values.
// @JsonKey(includeFromJson: false, includeToJson: false)
// @pragma('vm:prefer-inline')
// $PeopleStateCopyWith<PeopleState> get copyWith => _$PeopleStateCopyWithImpl<PeopleState>(this as PeopleState, _$identity);
//
//
//
// @override
// bool operator ==(Object other) {
//   return identical(this, other) || (other.runtimeType == runtimeType&&other is PeopleState&&const DeepCollectionEquality().equals(other.users, users)&&(identical(other.status, status) || other.status == status)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
// }
//
//
// @override
// int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(users),status,errorMessage);
//
// @override
// String toString() {
//   return 'PeopleState(users: $users, status: $status, errorMessage: $errorMessage)';
// }
//
//
// }
//
// /// @nodoc
// abstract mixin class $PeopleStateCopyWith<$Res>  {
//   factory $PeopleStateCopyWith(PeopleState value, $Res Function(PeopleState) _then) = _$PeopleStateCopyWithImpl;
// @useResult
// $Res call({
//  Map<String, UserData> users, PeopleStatus status, String errorMessage
// });
//
//
//
//
// }
// /// @nodoc
// class _$PeopleStateCopyWithImpl<$Res>
//     implements $PeopleStateCopyWith<$Res> {
//   _$PeopleStateCopyWithImpl(this._self, this._then);
//
//   final PeopleState _self;
//   final $Res Function(PeopleState) _then;
//
// /// Create a copy of PeopleState
// /// with the given fields replaced by the non-null parameter values.
// @pragma('vm:prefer-inline') @override $Res call({Object? users = null,Object? status = null,Object? errorMessage = null,}) {
//   return _then(_self.copyWith(
// users: null == users ? _self.users : users // ignore: cast_nullable_to_non_nullable
// as Map<String, UserData>,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
// as PeopleStatus,errorMessage: null == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
// as String,
//   ));
// }
//
// }
//
//
// /// Adds pattern-matching-related methods to [PeopleState].
// extension PeopleStatePatterns on PeopleState {
// /// A variant of `map` that fallback to returning `orElse`.
// ///
// /// It is equivalent to doing:
// /// ```dart
// /// switch (sealedClass) {
// ///   case final Subclass value:
// ///     return ...;
// ///   case _:
// ///     return orElse();
// /// }
// /// ```
//
// @optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PeopleState value)?  $default,{required TResult orElse(),}){
// final _that = this;
// switch (_that) {
// case _PeopleState() when $default != null:
// return $default(_that);case _:
//   return orElse();
//
// }
// }
// /// A `switch`-like method, using callbacks.
// ///
// /// Callbacks receives the raw object, upcasted.
// /// It is equivalent to doing:
// /// ```dart
// /// switch (sealedClass) {
// ///   case final Subclass value:
// ///     return ...;
// ///   case final Subclass2 value:
// ///     return ...;
// /// }
// /// ```
//
// @optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PeopleState value)  $default,){
// final _that = this;
// switch (_that) {
// case _PeopleState():
// return $default(_that);}
// }
// /// A variant of `map` that fallback to returning `null`.
// ///
// /// It is equivalent to doing:
// /// ```dart
// /// switch (sealedClass) {
// ///   case final Subclass value:
// ///     return ...;
// ///   case _:
// ///     return null;
// /// }
// /// ```
//
// @optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PeopleState value)?  $default,){
// final _that = this;
// switch (_that) {
// case _PeopleState() when $default != null:
// return $default(_that);case _:
//   return null;
//
// }
// }
// /// A variant of `when` that fallback to an `orElse` callback.
// ///
// /// It is equivalent to doing:
// /// ```dart
// /// switch (sealedClass) {
// ///   case Subclass(:final field):
// ///     return ...;
// ///   case _:
// ///     return orElse();
// /// }
// /// ```
//
// @optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( Map<String, UserData> users,  PeopleStatus status,  String errorMessage)?  $default,{required TResult orElse(),}) {final _that = this;
// switch (_that) {
// case _PeopleState() when $default != null:
// return $default(_that.users,_that.status,_that.errorMessage);case _:
//   return orElse();
//
// }
// }
// /// A `switch`-like method, using callbacks.
// ///
// /// As opposed to `map`, this offers destructuring.
// /// It is equivalent to doing:
// /// ```dart
// /// switch (sealedClass) {
// ///   case Subclass(:final field):
// ///     return ...;
// ///   case Subclass2(:final field2):
// ///     return ...;
// /// }
// /// ```
//
// @optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( Map<String, UserData> users,  PeopleStatus status,  String errorMessage)  $default,) {final _that = this;
// switch (_that) {
// case _PeopleState():
// return $default(_that.users,_that.status,_that.errorMessage);}
// }
// /// A variant of `when` that fallback to returning `null`
// ///
// /// It is equivalent to doing:
// /// ```dart
// /// switch (sealedClass) {
// ///   case Subclass(:final field):
// ///     return ...;
// ///   case _:
// ///     return null;
// /// }
// /// ```
//
// @optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( Map<String, UserData> users,  PeopleStatus status,  String errorMessage)?  $default,) {final _that = this;
// switch (_that) {
// case _PeopleState() when $default != null:
// return $default(_that.users,_that.status,_that.errorMessage);case _:
//   return null;
//
// }
// }
//
// }
//
// /// @nodoc
//
//
// class _PeopleState implements PeopleState {
//   const _PeopleState({final  Map<String, UserData> users = const {}, this.status = PeopleStatus.initial, this.errorMessage = ''}): _users = users;
//
//
//  final  Map<String, UserData> _users;
// @override@JsonKey() Map<String, UserData> get users {
//   if (_users is EqualUnmodifiableMapView) return _users;
//   // ignore: implicit_dynamic_type
//   return EqualUnmodifiableMapView(_users);
// }
//
// @override@JsonKey() final  PeopleStatus status;
// @override@JsonKey() final  String errorMessage;
//
// /// Create a copy of PeopleState
// /// with the given fields replaced by the non-null parameter values.
// @override @JsonKey(includeFromJson: false, includeToJson: false)
// @pragma('vm:prefer-inline')
// _$PeopleStateCopyWith<_PeopleState> get copyWith => __$PeopleStateCopyWithImpl<_PeopleState>(this, _$identity);
//
//
//
// @override
// bool operator ==(Object other) {
//   return identical(this, other) || (other.runtimeType == runtimeType&&other is _PeopleState&&const DeepCollectionEquality().equals(other._users, _users)&&(identical(other.status, status) || other.status == status)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
// }
//
//
// @override
// int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_users),status,errorMessage);
//
// @override
// String toString() {
//   return 'PeopleState(users: $users, status: $status, errorMessage: $errorMessage)';
// }
//
//
// }
//
// /// @nodoc
// abstract mixin class _$PeopleStateCopyWith<$Res> implements $PeopleStateCopyWith<$Res> {
//   factory _$PeopleStateCopyWith(_PeopleState value, $Res Function(_PeopleState) _then) = __$PeopleStateCopyWithImpl;
// @override @useResult
// $Res call({
//  Map<String, UserData> users, PeopleStatus status, String errorMessage
// });
//
//
//
//
// }
// /// @nodoc
// class __$PeopleStateCopyWithImpl<$Res>
//     implements _$PeopleStateCopyWith<$Res> {
//   __$PeopleStateCopyWithImpl(this._self, this._then);
//
//   final _PeopleState _self;
//   final $Res Function(_PeopleState) _then;
//
// /// Create a copy of PeopleState
// /// with the given fields replaced by the non-null parameter values.
// @override @pragma('vm:prefer-inline') $Res call({Object? users = null,Object? status = null,Object? errorMessage = null,}) {
//   return _then(_PeopleState(
// users: null == users ? _self._users : users // ignore: cast_nullable_to_non_nullable
// as Map<String, UserData>,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
// as PeopleStatus,errorMessage: null == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
// as String,
//   ));
// }
//
//
// }
//
// // dart format on
