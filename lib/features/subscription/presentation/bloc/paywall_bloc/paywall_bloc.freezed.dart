// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'paywall_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$PaywallEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PaywallEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'PaywallEvent()';
}


}

/// @nodoc
class $PaywallEventCopyWith<$Res>  {
$PaywallEventCopyWith(PaywallEvent _, $Res Function(PaywallEvent) __);
}


/// Adds pattern-matching-related methods to [PaywallEvent].
extension PaywallEventPatterns on PaywallEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _LoadPlans value)?  loadPlans,TResult Function( _SelectPlan value)?  selectPlan,TResult Function( _Purchase value)?  purchase,TResult Function( _Restore value)?  restore,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LoadPlans() when loadPlans != null:
return loadPlans(_that);case _SelectPlan() when selectPlan != null:
return selectPlan(_that);case _Purchase() when purchase != null:
return purchase(_that);case _Restore() when restore != null:
return restore(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _LoadPlans value)  loadPlans,required TResult Function( _SelectPlan value)  selectPlan,required TResult Function( _Purchase value)  purchase,required TResult Function( _Restore value)  restore,}){
final _that = this;
switch (_that) {
case _LoadPlans():
return loadPlans(_that);case _SelectPlan():
return selectPlan(_that);case _Purchase():
return purchase(_that);case _Restore():
return restore(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _LoadPlans value)?  loadPlans,TResult? Function( _SelectPlan value)?  selectPlan,TResult? Function( _Purchase value)?  purchase,TResult? Function( _Restore value)?  restore,}){
final _that = this;
switch (_that) {
case _LoadPlans() when loadPlans != null:
return loadPlans(_that);case _SelectPlan() when selectPlan != null:
return selectPlan(_that);case _Purchase() when purchase != null:
return purchase(_that);case _Restore() when restore != null:
return restore(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  loadPlans,TResult Function( String planId)?  selectPlan,TResult Function()?  purchase,TResult Function()?  restore,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LoadPlans() when loadPlans != null:
return loadPlans();case _SelectPlan() when selectPlan != null:
return selectPlan(_that.planId);case _Purchase() when purchase != null:
return purchase();case _Restore() when restore != null:
return restore();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  loadPlans,required TResult Function( String planId)  selectPlan,required TResult Function()  purchase,required TResult Function()  restore,}) {final _that = this;
switch (_that) {
case _LoadPlans():
return loadPlans();case _SelectPlan():
return selectPlan(_that.planId);case _Purchase():
return purchase();case _Restore():
return restore();case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  loadPlans,TResult? Function( String planId)?  selectPlan,TResult? Function()?  purchase,TResult? Function()?  restore,}) {final _that = this;
switch (_that) {
case _LoadPlans() when loadPlans != null:
return loadPlans();case _SelectPlan() when selectPlan != null:
return selectPlan(_that.planId);case _Purchase() when purchase != null:
return purchase();case _Restore() when restore != null:
return restore();case _:
  return null;

}
}

}

/// @nodoc


class _LoadPlans implements PaywallEvent {
  const _LoadPlans();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LoadPlans);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'PaywallEvent.loadPlans()';
}


}




/// @nodoc


class _SelectPlan implements PaywallEvent {
  const _SelectPlan({required this.planId});
  

 final  String planId;

/// Create a copy of PaywallEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SelectPlanCopyWith<_SelectPlan> get copyWith => __$SelectPlanCopyWithImpl<_SelectPlan>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SelectPlan&&(identical(other.planId, planId) || other.planId == planId));
}


@override
int get hashCode => Object.hash(runtimeType,planId);

@override
String toString() {
  return 'PaywallEvent.selectPlan(planId: $planId)';
}


}

/// @nodoc
abstract mixin class _$SelectPlanCopyWith<$Res> implements $PaywallEventCopyWith<$Res> {
  factory _$SelectPlanCopyWith(_SelectPlan value, $Res Function(_SelectPlan) _then) = __$SelectPlanCopyWithImpl;
@useResult
$Res call({
 String planId
});




}
/// @nodoc
class __$SelectPlanCopyWithImpl<$Res>
    implements _$SelectPlanCopyWith<$Res> {
  __$SelectPlanCopyWithImpl(this._self, this._then);

  final _SelectPlan _self;
  final $Res Function(_SelectPlan) _then;

/// Create a copy of PaywallEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? planId = null,}) {
  return _then(_SelectPlan(
planId: null == planId ? _self.planId : planId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _Purchase implements PaywallEvent {
  const _Purchase();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Purchase);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'PaywallEvent.purchase()';
}


}




/// @nodoc


class _Restore implements PaywallEvent {
  const _Restore();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Restore);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'PaywallEvent.restore()';
}


}




/// @nodoc
mixin _$PaywallState {

 EPaywallStatus get status; List<SubscriptionPlan> get plans; String? get selectedPlanId; String get errorMessage;
/// Create a copy of PaywallState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PaywallStateCopyWith<PaywallState> get copyWith => _$PaywallStateCopyWithImpl<PaywallState>(this as PaywallState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PaywallState&&(identical(other.status, status) || other.status == status)&&const DeepCollectionEquality().equals(other.plans, plans)&&(identical(other.selectedPlanId, selectedPlanId) || other.selectedPlanId == selectedPlanId)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,status,const DeepCollectionEquality().hash(plans),selectedPlanId,errorMessage);

@override
String toString() {
  return 'PaywallState(status: $status, plans: $plans, selectedPlanId: $selectedPlanId, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class $PaywallStateCopyWith<$Res>  {
  factory $PaywallStateCopyWith(PaywallState value, $Res Function(PaywallState) _then) = _$PaywallStateCopyWithImpl;
@useResult
$Res call({
 EPaywallStatus status, List<SubscriptionPlan> plans, String? selectedPlanId, String errorMessage
});




}
/// @nodoc
class _$PaywallStateCopyWithImpl<$Res>
    implements $PaywallStateCopyWith<$Res> {
  _$PaywallStateCopyWithImpl(this._self, this._then);

  final PaywallState _self;
  final $Res Function(PaywallState) _then;

/// Create a copy of PaywallState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = null,Object? plans = null,Object? selectedPlanId = freezed,Object? errorMessage = null,}) {
  return _then(_self.copyWith(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as EPaywallStatus,plans: null == plans ? _self.plans : plans // ignore: cast_nullable_to_non_nullable
as List<SubscriptionPlan>,selectedPlanId: freezed == selectedPlanId ? _self.selectedPlanId : selectedPlanId // ignore: cast_nullable_to_non_nullable
as String?,errorMessage: null == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [PaywallState].
extension PaywallStatePatterns on PaywallState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PaywallState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PaywallState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PaywallState value)  $default,){
final _that = this;
switch (_that) {
case _PaywallState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PaywallState value)?  $default,){
final _that = this;
switch (_that) {
case _PaywallState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( EPaywallStatus status,  List<SubscriptionPlan> plans,  String? selectedPlanId,  String errorMessage)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PaywallState() when $default != null:
return $default(_that.status,_that.plans,_that.selectedPlanId,_that.errorMessage);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( EPaywallStatus status,  List<SubscriptionPlan> plans,  String? selectedPlanId,  String errorMessage)  $default,) {final _that = this;
switch (_that) {
case _PaywallState():
return $default(_that.status,_that.plans,_that.selectedPlanId,_that.errorMessage);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( EPaywallStatus status,  List<SubscriptionPlan> plans,  String? selectedPlanId,  String errorMessage)?  $default,) {final _that = this;
switch (_that) {
case _PaywallState() when $default != null:
return $default(_that.status,_that.plans,_that.selectedPlanId,_that.errorMessage);case _:
  return null;

}
}

}

/// @nodoc


class _PaywallState implements PaywallState {
  const _PaywallState({this.status = EPaywallStatus.initial, final  List<SubscriptionPlan> plans = const <SubscriptionPlan>[], this.selectedPlanId, this.errorMessage = ''}): _plans = plans;
  

@override@JsonKey() final  EPaywallStatus status;
 final  List<SubscriptionPlan> _plans;
@override@JsonKey() List<SubscriptionPlan> get plans {
  if (_plans is EqualUnmodifiableListView) return _plans;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_plans);
}

@override final  String? selectedPlanId;
@override@JsonKey() final  String errorMessage;

/// Create a copy of PaywallState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PaywallStateCopyWith<_PaywallState> get copyWith => __$PaywallStateCopyWithImpl<_PaywallState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PaywallState&&(identical(other.status, status) || other.status == status)&&const DeepCollectionEquality().equals(other._plans, _plans)&&(identical(other.selectedPlanId, selectedPlanId) || other.selectedPlanId == selectedPlanId)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,status,const DeepCollectionEquality().hash(_plans),selectedPlanId,errorMessage);

@override
String toString() {
  return 'PaywallState(status: $status, plans: $plans, selectedPlanId: $selectedPlanId, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class _$PaywallStateCopyWith<$Res> implements $PaywallStateCopyWith<$Res> {
  factory _$PaywallStateCopyWith(_PaywallState value, $Res Function(_PaywallState) _then) = __$PaywallStateCopyWithImpl;
@override @useResult
$Res call({
 EPaywallStatus status, List<SubscriptionPlan> plans, String? selectedPlanId, String errorMessage
});




}
/// @nodoc
class __$PaywallStateCopyWithImpl<$Res>
    implements _$PaywallStateCopyWith<$Res> {
  __$PaywallStateCopyWithImpl(this._self, this._then);

  final _PaywallState _self;
  final $Res Function(_PaywallState) _then;

/// Create a copy of PaywallState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = null,Object? plans = null,Object? selectedPlanId = freezed,Object? errorMessage = null,}) {
  return _then(_PaywallState(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as EPaywallStatus,plans: null == plans ? _self._plans : plans // ignore: cast_nullable_to_non_nullable
as List<SubscriptionPlan>,selectedPlanId: freezed == selectedPlanId ? _self.selectedPlanId : selectedPlanId // ignore: cast_nullable_to_non_nullable
as String?,errorMessage: null == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
