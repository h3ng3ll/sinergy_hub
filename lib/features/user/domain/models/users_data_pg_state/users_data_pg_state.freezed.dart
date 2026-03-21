// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'users_data_pg_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$UserDataPgState {

 int get startIndex; int get pageSize; bool get hasMore;/// Firebase field
 DocumentSnapshot? get lastDocument; Set<String> get excludedUids; List<UserData> get items;
/// Create a copy of UserDataPgState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserDataPgStateCopyWith<UserDataPgState> get copyWith => _$UserDataPgStateCopyWithImpl<UserDataPgState>(this as UserDataPgState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserDataPgState&&(identical(other.startIndex, startIndex) || other.startIndex == startIndex)&&(identical(other.pageSize, pageSize) || other.pageSize == pageSize)&&(identical(other.hasMore, hasMore) || other.hasMore == hasMore)&&(identical(other.lastDocument, lastDocument) || other.lastDocument == lastDocument)&&const DeepCollectionEquality().equals(other.excludedUids, excludedUids)&&const DeepCollectionEquality().equals(other.items, items));
}


@override
int get hashCode => Object.hash(runtimeType,startIndex,pageSize,hasMore,lastDocument,const DeepCollectionEquality().hash(excludedUids),const DeepCollectionEquality().hash(items));

@override
String toString() {
  return 'UserDataPgState(startIndex: $startIndex, pageSize: $pageSize, hasMore: $hasMore, lastDocument: $lastDocument, excludedUids: $excludedUids, items: $items)';
}


}

/// @nodoc
abstract mixin class $UserDataPgStateCopyWith<$Res>  {
  factory $UserDataPgStateCopyWith(UserDataPgState value, $Res Function(UserDataPgState) _then) = _$UserDataPgStateCopyWithImpl;
@useResult
$Res call({
 int startIndex, int pageSize, bool hasMore, DocumentSnapshot? lastDocument, Set<String> excludedUids, List<UserData> items
});




}
/// @nodoc
class _$UserDataPgStateCopyWithImpl<$Res>
    implements $UserDataPgStateCopyWith<$Res> {
  _$UserDataPgStateCopyWithImpl(this._self, this._then);

  final UserDataPgState _self;
  final $Res Function(UserDataPgState) _then;

/// Create a copy of UserDataPgState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? startIndex = null,Object? pageSize = null,Object? hasMore = null,Object? lastDocument = freezed,Object? excludedUids = null,Object? items = null,}) {
  return _then(_self.copyWith(
startIndex: null == startIndex ? _self.startIndex : startIndex // ignore: cast_nullable_to_non_nullable
as int,pageSize: null == pageSize ? _self.pageSize : pageSize // ignore: cast_nullable_to_non_nullable
as int,hasMore: null == hasMore ? _self.hasMore : hasMore // ignore: cast_nullable_to_non_nullable
as bool,lastDocument: freezed == lastDocument ? _self.lastDocument : lastDocument // ignore: cast_nullable_to_non_nullable
as DocumentSnapshot?,excludedUids: null == excludedUids ? _self.excludedUids : excludedUids // ignore: cast_nullable_to_non_nullable
as Set<String>,items: null == items ? _self.items : items // ignore: cast_nullable_to_non_nullable
as List<UserData>,
  ));
}

}


/// Adds pattern-matching-related methods to [UserDataPgState].
extension UserDataPgStatePatterns on UserDataPgState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UsersDataPgState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UsersDataPgState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UsersDataPgState value)  $default,){
final _that = this;
switch (_that) {
case _UsersDataPgState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UsersDataPgState value)?  $default,){
final _that = this;
switch (_that) {
case _UsersDataPgState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int startIndex,  int pageSize,  bool hasMore,  DocumentSnapshot? lastDocument,  Set<String> excludedUids,  List<UserData> items)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UsersDataPgState() when $default != null:
return $default(_that.startIndex,_that.pageSize,_that.hasMore,_that.lastDocument,_that.excludedUids,_that.items);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int startIndex,  int pageSize,  bool hasMore,  DocumentSnapshot? lastDocument,  Set<String> excludedUids,  List<UserData> items)  $default,) {final _that = this;
switch (_that) {
case _UsersDataPgState():
return $default(_that.startIndex,_that.pageSize,_that.hasMore,_that.lastDocument,_that.excludedUids,_that.items);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int startIndex,  int pageSize,  bool hasMore,  DocumentSnapshot? lastDocument,  Set<String> excludedUids,  List<UserData> items)?  $default,) {final _that = this;
switch (_that) {
case _UsersDataPgState() when $default != null:
return $default(_that.startIndex,_that.pageSize,_that.hasMore,_that.lastDocument,_that.excludedUids,_that.items);case _:
  return null;

}
}

}

/// @nodoc


class _UsersDataPgState implements UserDataPgState {
  const _UsersDataPgState({this.startIndex = 0, this.pageSize = 10, this.hasMore = true, this.lastDocument, final  Set<String> excludedUids = const {}, final  List<UserData> items = const []}): _excludedUids = excludedUids,_items = items;
  

@override@JsonKey() final  int startIndex;
@override@JsonKey() final  int pageSize;
@override@JsonKey() final  bool hasMore;
/// Firebase field
@override final  DocumentSnapshot? lastDocument;
 final  Set<String> _excludedUids;
@override@JsonKey() Set<String> get excludedUids {
  if (_excludedUids is EqualUnmodifiableSetView) return _excludedUids;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableSetView(_excludedUids);
}

 final  List<UserData> _items;
@override@JsonKey() List<UserData> get items {
  if (_items is EqualUnmodifiableListView) return _items;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_items);
}


/// Create a copy of UserDataPgState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UsersDataPgStateCopyWith<_UsersDataPgState> get copyWith => __$UsersDataPgStateCopyWithImpl<_UsersDataPgState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UsersDataPgState&&(identical(other.startIndex, startIndex) || other.startIndex == startIndex)&&(identical(other.pageSize, pageSize) || other.pageSize == pageSize)&&(identical(other.hasMore, hasMore) || other.hasMore == hasMore)&&(identical(other.lastDocument, lastDocument) || other.lastDocument == lastDocument)&&const DeepCollectionEquality().equals(other._excludedUids, _excludedUids)&&const DeepCollectionEquality().equals(other._items, _items));
}


@override
int get hashCode => Object.hash(runtimeType,startIndex,pageSize,hasMore,lastDocument,const DeepCollectionEquality().hash(_excludedUids),const DeepCollectionEquality().hash(_items));

@override
String toString() {
  return 'UserDataPgState(startIndex: $startIndex, pageSize: $pageSize, hasMore: $hasMore, lastDocument: $lastDocument, excludedUids: $excludedUids, items: $items)';
}


}

/// @nodoc
abstract mixin class _$UsersDataPgStateCopyWith<$Res> implements $UserDataPgStateCopyWith<$Res> {
  factory _$UsersDataPgStateCopyWith(_UsersDataPgState value, $Res Function(_UsersDataPgState) _then) = __$UsersDataPgStateCopyWithImpl;
@override @useResult
$Res call({
 int startIndex, int pageSize, bool hasMore, DocumentSnapshot? lastDocument, Set<String> excludedUids, List<UserData> items
});




}
/// @nodoc
class __$UsersDataPgStateCopyWithImpl<$Res>
    implements _$UsersDataPgStateCopyWith<$Res> {
  __$UsersDataPgStateCopyWithImpl(this._self, this._then);

  final _UsersDataPgState _self;
  final $Res Function(_UsersDataPgState) _then;

/// Create a copy of UserDataPgState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? startIndex = null,Object? pageSize = null,Object? hasMore = null,Object? lastDocument = freezed,Object? excludedUids = null,Object? items = null,}) {
  return _then(_UsersDataPgState(
startIndex: null == startIndex ? _self.startIndex : startIndex // ignore: cast_nullable_to_non_nullable
as int,pageSize: null == pageSize ? _self.pageSize : pageSize // ignore: cast_nullable_to_non_nullable
as int,hasMore: null == hasMore ? _self.hasMore : hasMore // ignore: cast_nullable_to_non_nullable
as bool,lastDocument: freezed == lastDocument ? _self.lastDocument : lastDocument // ignore: cast_nullable_to_non_nullable
as DocumentSnapshot?,excludedUids: null == excludedUids ? _self._excludedUids : excludedUids // ignore: cast_nullable_to_non_nullable
as Set<String>,items: null == items ? _self._items : items // ignore: cast_nullable_to_non_nullable
as List<UserData>,
  ));
}


}

// dart format on
