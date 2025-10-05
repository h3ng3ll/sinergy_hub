// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'search_specialization_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$SearchSpecializationEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SearchSpecializationEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SearchSpecializationEvent()';
}


}

/// @nodoc
class $SearchSpecializationEventCopyWith<$Res>  {
$SearchSpecializationEventCopyWith(SearchSpecializationEvent _, $Res Function(SearchSpecializationEvent) __);
}


/// Adds pattern-matching-related methods to [SearchSpecializationEvent].
extension SearchSpecializationEventPatterns on SearchSpecializationEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Search value)?  search,TResult Function( _Fetch value)?  fetch,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Search() when search != null:
return search(_that);case _Fetch() when fetch != null:
return fetch(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Search value)  search,required TResult Function( _Fetch value)  fetch,}){
final _that = this;
switch (_that) {
case _Search():
return search(_that);case _Fetch():
return fetch(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Search value)?  search,TResult? Function( _Fetch value)?  fetch,}){
final _that = this;
switch (_that) {
case _Search() when search != null:
return search(_that);case _Fetch() when fetch != null:
return fetch(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String query)?  search,TResult Function()?  fetch,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Search() when search != null:
return search(_that.query);case _Fetch() when fetch != null:
return fetch();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String query)  search,required TResult Function()  fetch,}) {final _that = this;
switch (_that) {
case _Search():
return search(_that.query);case _Fetch():
return fetch();case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String query)?  search,TResult? Function()?  fetch,}) {final _that = this;
switch (_that) {
case _Search() when search != null:
return search(_that.query);case _Fetch() when fetch != null:
return fetch();case _:
  return null;

}
}

}

/// @nodoc


class _Search implements SearchSpecializationEvent {
  const _Search({required this.query});
  

 final  String query;

/// Create a copy of SearchSpecializationEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SearchCopyWith<_Search> get copyWith => __$SearchCopyWithImpl<_Search>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Search&&(identical(other.query, query) || other.query == query));
}


@override
int get hashCode => Object.hash(runtimeType,query);

@override
String toString() {
  return 'SearchSpecializationEvent.search(query: $query)';
}


}

/// @nodoc
abstract mixin class _$SearchCopyWith<$Res> implements $SearchSpecializationEventCopyWith<$Res> {
  factory _$SearchCopyWith(_Search value, $Res Function(_Search) _then) = __$SearchCopyWithImpl;
@useResult
$Res call({
 String query
});




}
/// @nodoc
class __$SearchCopyWithImpl<$Res>
    implements _$SearchCopyWith<$Res> {
  __$SearchCopyWithImpl(this._self, this._then);

  final _Search _self;
  final $Res Function(_Search) _then;

/// Create a copy of SearchSpecializationEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? query = null,}) {
  return _then(_Search(
query: null == query ? _self.query : query // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _Fetch implements SearchSpecializationEvent {
  const _Fetch();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Fetch);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SearchSpecializationEvent.fetch()';
}


}




/// @nodoc
mixin _$SearchSpecializationState {

 String get query; List<Specialization> get specializations;
/// Create a copy of SearchSpecializationState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SearchSpecializationStateCopyWith<SearchSpecializationState> get copyWith => _$SearchSpecializationStateCopyWithImpl<SearchSpecializationState>(this as SearchSpecializationState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SearchSpecializationState&&(identical(other.query, query) || other.query == query)&&const DeepCollectionEquality().equals(other.specializations, specializations));
}


@override
int get hashCode => Object.hash(runtimeType,query,const DeepCollectionEquality().hash(specializations));

@override
String toString() {
  return 'SearchSpecializationState(query: $query, specializations: $specializations)';
}


}

/// @nodoc
abstract mixin class $SearchSpecializationStateCopyWith<$Res>  {
  factory $SearchSpecializationStateCopyWith(SearchSpecializationState value, $Res Function(SearchSpecializationState) _then) = _$SearchSpecializationStateCopyWithImpl;
@useResult
$Res call({
 String query, List<Specialization> specializations
});




}
/// @nodoc
class _$SearchSpecializationStateCopyWithImpl<$Res>
    implements $SearchSpecializationStateCopyWith<$Res> {
  _$SearchSpecializationStateCopyWithImpl(this._self, this._then);

  final SearchSpecializationState _self;
  final $Res Function(SearchSpecializationState) _then;

/// Create a copy of SearchSpecializationState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? query = null,Object? specializations = null,}) {
  return _then(_self.copyWith(
query: null == query ? _self.query : query // ignore: cast_nullable_to_non_nullable
as String,specializations: null == specializations ? _self.specializations : specializations // ignore: cast_nullable_to_non_nullable
as List<Specialization>,
  ));
}

}


/// Adds pattern-matching-related methods to [SearchSpecializationState].
extension SearchSpecializationStatePatterns on SearchSpecializationState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SearchSpecializationState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SearchSpecializationState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SearchSpecializationState value)  $default,){
final _that = this;
switch (_that) {
case _SearchSpecializationState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SearchSpecializationState value)?  $default,){
final _that = this;
switch (_that) {
case _SearchSpecializationState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String query,  List<Specialization> specializations)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SearchSpecializationState() when $default != null:
return $default(_that.query,_that.specializations);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String query,  List<Specialization> specializations)  $default,) {final _that = this;
switch (_that) {
case _SearchSpecializationState():
return $default(_that.query,_that.specializations);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String query,  List<Specialization> specializations)?  $default,) {final _that = this;
switch (_that) {
case _SearchSpecializationState() when $default != null:
return $default(_that.query,_that.specializations);case _:
  return null;

}
}

}

/// @nodoc


class _SearchSpecializationState implements SearchSpecializationState {
  const _SearchSpecializationState({this.query = '', final  List<Specialization> specializations = const []}): _specializations = specializations;
  

@override@JsonKey() final  String query;
 final  List<Specialization> _specializations;
@override@JsonKey() List<Specialization> get specializations {
  if (_specializations is EqualUnmodifiableListView) return _specializations;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_specializations);
}


/// Create a copy of SearchSpecializationState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SearchSpecializationStateCopyWith<_SearchSpecializationState> get copyWith => __$SearchSpecializationStateCopyWithImpl<_SearchSpecializationState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SearchSpecializationState&&(identical(other.query, query) || other.query == query)&&const DeepCollectionEquality().equals(other._specializations, _specializations));
}


@override
int get hashCode => Object.hash(runtimeType,query,const DeepCollectionEquality().hash(_specializations));

@override
String toString() {
  return 'SearchSpecializationState(query: $query, specializations: $specializations)';
}


}

/// @nodoc
abstract mixin class _$SearchSpecializationStateCopyWith<$Res> implements $SearchSpecializationStateCopyWith<$Res> {
  factory _$SearchSpecializationStateCopyWith(_SearchSpecializationState value, $Res Function(_SearchSpecializationState) _then) = __$SearchSpecializationStateCopyWithImpl;
@override @useResult
$Res call({
 String query, List<Specialization> specializations
});




}
/// @nodoc
class __$SearchSpecializationStateCopyWithImpl<$Res>
    implements _$SearchSpecializationStateCopyWith<$Res> {
  __$SearchSpecializationStateCopyWithImpl(this._self, this._then);

  final _SearchSpecializationState _self;
  final $Res Function(_SearchSpecializationState) _then;

/// Create a copy of SearchSpecializationState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? query = null,Object? specializations = null,}) {
  return _then(_SearchSpecializationState(
query: null == query ? _self.query : query // ignore: cast_nullable_to_non_nullable
as String,specializations: null == specializations ? _self._specializations : specializations // ignore: cast_nullable_to_non_nullable
as List<Specialization>,
  ));
}


}

// dart format on
