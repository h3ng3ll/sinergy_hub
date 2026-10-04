// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'liked_you_feed_update.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$LikedYouFeedUpdate {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LikedYouFeedUpdate);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'LikedYouFeedUpdate()';
}


}

/// @nodoc
class $LikedYouFeedUpdateCopyWith<$Res>  {
$LikedYouFeedUpdateCopyWith(LikedYouFeedUpdate _, $Res Function(LikedYouFeedUpdate) __);
}


/// Adds pattern-matching-related methods to [LikedYouFeedUpdate].
extension LikedYouFeedUpdatePatterns on LikedYouFeedUpdate {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( LikedYouFeedPage value)?  page,TResult Function( LikedYouFeedSynced value)?  synced,TResult Function( LikedYouFeedFailed value)?  failed,required TResult orElse(),}){
final _that = this;
switch (_that) {
case LikedYouFeedPage() when page != null:
return page(_that);case LikedYouFeedSynced() when synced != null:
return synced(_that);case LikedYouFeedFailed() when failed != null:
return failed(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( LikedYouFeedPage value)  page,required TResult Function( LikedYouFeedSynced value)  synced,required TResult Function( LikedYouFeedFailed value)  failed,}){
final _that = this;
switch (_that) {
case LikedYouFeedPage():
return page(_that);case LikedYouFeedSynced():
return synced(_that);case LikedYouFeedFailed():
return failed(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( LikedYouFeedPage value)?  page,TResult? Function( LikedYouFeedSynced value)?  synced,TResult? Function( LikedYouFeedFailed value)?  failed,}){
final _that = this;
switch (_that) {
case LikedYouFeedPage() when page != null:
return page(_that);case LikedYouFeedSynced() when synced != null:
return synced(_that);case LikedYouFeedFailed() when failed != null:
return failed(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( LikedYouPgState page)?  page,TResult Function()?  synced,TResult Function( Exceptions failure)?  failed,required TResult orElse(),}) {final _that = this;
switch (_that) {
case LikedYouFeedPage() when page != null:
return page(_that.page);case LikedYouFeedSynced() when synced != null:
return synced();case LikedYouFeedFailed() when failed != null:
return failed(_that.failure);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( LikedYouPgState page)  page,required TResult Function()  synced,required TResult Function( Exceptions failure)  failed,}) {final _that = this;
switch (_that) {
case LikedYouFeedPage():
return page(_that.page);case LikedYouFeedSynced():
return synced();case LikedYouFeedFailed():
return failed(_that.failure);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( LikedYouPgState page)?  page,TResult? Function()?  synced,TResult? Function( Exceptions failure)?  failed,}) {final _that = this;
switch (_that) {
case LikedYouFeedPage() when page != null:
return page(_that.page);case LikedYouFeedSynced() when synced != null:
return synced();case LikedYouFeedFailed() when failed != null:
return failed(_that.failure);case _:
  return null;

}
}

}

/// @nodoc


class LikedYouFeedPage implements LikedYouFeedUpdate {
  const LikedYouFeedPage(this.page);
  

 final  LikedYouPgState page;

/// Create a copy of LikedYouFeedUpdate
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LikedYouFeedPageCopyWith<LikedYouFeedPage> get copyWith => _$LikedYouFeedPageCopyWithImpl<LikedYouFeedPage>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LikedYouFeedPage&&(identical(other.page, page) || other.page == page));
}


@override
int get hashCode => Object.hash(runtimeType,page);

@override
String toString() {
  return 'LikedYouFeedUpdate.page(page: $page)';
}


}

/// @nodoc
abstract mixin class $LikedYouFeedPageCopyWith<$Res> implements $LikedYouFeedUpdateCopyWith<$Res> {
  factory $LikedYouFeedPageCopyWith(LikedYouFeedPage value, $Res Function(LikedYouFeedPage) _then) = _$LikedYouFeedPageCopyWithImpl;
@useResult
$Res call({
 LikedYouPgState page
});


$LikedYouPgStateCopyWith<$Res> get page;

}
/// @nodoc
class _$LikedYouFeedPageCopyWithImpl<$Res>
    implements $LikedYouFeedPageCopyWith<$Res> {
  _$LikedYouFeedPageCopyWithImpl(this._self, this._then);

  final LikedYouFeedPage _self;
  final $Res Function(LikedYouFeedPage) _then;

/// Create a copy of LikedYouFeedUpdate
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? page = null,}) {
  return _then(LikedYouFeedPage(
null == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as LikedYouPgState,
  ));
}

/// Create a copy of LikedYouFeedUpdate
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LikedYouPgStateCopyWith<$Res> get page {
  
  return $LikedYouPgStateCopyWith<$Res>(_self.page, (value) {
    return _then(_self.copyWith(page: value));
  });
}
}

/// @nodoc


class LikedYouFeedSynced implements LikedYouFeedUpdate {
  const LikedYouFeedSynced();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LikedYouFeedSynced);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'LikedYouFeedUpdate.synced()';
}


}




/// @nodoc


class LikedYouFeedFailed implements LikedYouFeedUpdate {
  const LikedYouFeedFailed(this.failure);
  

 final  Exceptions failure;

/// Create a copy of LikedYouFeedUpdate
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LikedYouFeedFailedCopyWith<LikedYouFeedFailed> get copyWith => _$LikedYouFeedFailedCopyWithImpl<LikedYouFeedFailed>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LikedYouFeedFailed&&(identical(other.failure, failure) || other.failure == failure));
}


@override
int get hashCode => Object.hash(runtimeType,failure);

@override
String toString() {
  return 'LikedYouFeedUpdate.failed(failure: $failure)';
}


}

/// @nodoc
abstract mixin class $LikedYouFeedFailedCopyWith<$Res> implements $LikedYouFeedUpdateCopyWith<$Res> {
  factory $LikedYouFeedFailedCopyWith(LikedYouFeedFailed value, $Res Function(LikedYouFeedFailed) _then) = _$LikedYouFeedFailedCopyWithImpl;
@useResult
$Res call({
 Exceptions failure
});




}
/// @nodoc
class _$LikedYouFeedFailedCopyWithImpl<$Res>
    implements $LikedYouFeedFailedCopyWith<$Res> {
  _$LikedYouFeedFailedCopyWithImpl(this._self, this._then);

  final LikedYouFeedFailed _self;
  final $Res Function(LikedYouFeedFailed) _then;

/// Create a copy of LikedYouFeedUpdate
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? failure = null,}) {
  return _then(LikedYouFeedFailed(
null == failure ? _self.failure : failure // ignore: cast_nullable_to_non_nullable
as Exceptions,
  ));
}


}

// dart format on
