// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'call_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$CallEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CallEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CallEvent()';
}


}

/// @nodoc
class $CallEventCopyWith<$Res>  {
$CallEventCopyWith(CallEvent _, $Res Function(CallEvent) __);
}


/// Adds pattern-matching-related methods to [CallEvent].
extension CallEventPatterns on CallEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _ListenCalls value)?  listenCalls,TResult Function( _ListenIceCandidates value)?  listenIceCandidates,TResult Function( _ListenRemoteMediaStream value)?  listenRemoteMediaStream,TResult Function( _Ring value)?  ring,TResult Function( _Accept value)?  accept,TResult Function( _Decline value)?  decline,TResult Function( _HangUp value)?  hangUp,TResult Function( _RemoteStream value)?  remoteStream,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ListenCalls() when listenCalls != null:
return listenCalls(_that);case _ListenIceCandidates() when listenIceCandidates != null:
return listenIceCandidates(_that);case _ListenRemoteMediaStream() when listenRemoteMediaStream != null:
return listenRemoteMediaStream(_that);case _Ring() when ring != null:
return ring(_that);case _Accept() when accept != null:
return accept(_that);case _Decline() when decline != null:
return decline(_that);case _HangUp() when hangUp != null:
return hangUp(_that);case _RemoteStream() when remoteStream != null:
return remoteStream(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _ListenCalls value)  listenCalls,required TResult Function( _ListenIceCandidates value)  listenIceCandidates,required TResult Function( _ListenRemoteMediaStream value)  listenRemoteMediaStream,required TResult Function( _Ring value)  ring,required TResult Function( _Accept value)  accept,required TResult Function( _Decline value)  decline,required TResult Function( _HangUp value)  hangUp,required TResult Function( _RemoteStream value)  remoteStream,}){
final _that = this;
switch (_that) {
case _ListenCalls():
return listenCalls(_that);case _ListenIceCandidates():
return listenIceCandidates(_that);case _ListenRemoteMediaStream():
return listenRemoteMediaStream(_that);case _Ring():
return ring(_that);case _Accept():
return accept(_that);case _Decline():
return decline(_that);case _HangUp():
return hangUp(_that);case _RemoteStream():
return remoteStream(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _ListenCalls value)?  listenCalls,TResult? Function( _ListenIceCandidates value)?  listenIceCandidates,TResult? Function( _ListenRemoteMediaStream value)?  listenRemoteMediaStream,TResult? Function( _Ring value)?  ring,TResult? Function( _Accept value)?  accept,TResult? Function( _Decline value)?  decline,TResult? Function( _HangUp value)?  hangUp,TResult? Function( _RemoteStream value)?  remoteStream,}){
final _that = this;
switch (_that) {
case _ListenCalls() when listenCalls != null:
return listenCalls(_that);case _ListenIceCandidates() when listenIceCandidates != null:
return listenIceCandidates(_that);case _ListenRemoteMediaStream() when listenRemoteMediaStream != null:
return listenRemoteMediaStream(_that);case _Ring() when ring != null:
return ring(_that);case _Accept() when accept != null:
return accept(_that);case _Decline() when decline != null:
return decline(_that);case _HangUp() when hangUp != null:
return hangUp(_that);case _RemoteStream() when remoteStream != null:
return remoteStream(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  listenCalls,TResult Function( String callId)?  listenIceCandidates,TResult Function()?  listenRemoteMediaStream,TResult Function( String calleeId)?  ring,TResult Function()?  accept,TResult Function()?  decline,TResult Function()?  hangUp,TResult Function( MediaStream stream)?  remoteStream,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ListenCalls() when listenCalls != null:
return listenCalls();case _ListenIceCandidates() when listenIceCandidates != null:
return listenIceCandidates(_that.callId);case _ListenRemoteMediaStream() when listenRemoteMediaStream != null:
return listenRemoteMediaStream();case _Ring() when ring != null:
return ring(_that.calleeId);case _Accept() when accept != null:
return accept();case _Decline() when decline != null:
return decline();case _HangUp() when hangUp != null:
return hangUp();case _RemoteStream() when remoteStream != null:
return remoteStream(_that.stream);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  listenCalls,required TResult Function( String callId)  listenIceCandidates,required TResult Function()  listenRemoteMediaStream,required TResult Function( String calleeId)  ring,required TResult Function()  accept,required TResult Function()  decline,required TResult Function()  hangUp,required TResult Function( MediaStream stream)  remoteStream,}) {final _that = this;
switch (_that) {
case _ListenCalls():
return listenCalls();case _ListenIceCandidates():
return listenIceCandidates(_that.callId);case _ListenRemoteMediaStream():
return listenRemoteMediaStream();case _Ring():
return ring(_that.calleeId);case _Accept():
return accept();case _Decline():
return decline();case _HangUp():
return hangUp();case _RemoteStream():
return remoteStream(_that.stream);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  listenCalls,TResult? Function( String callId)?  listenIceCandidates,TResult? Function()?  listenRemoteMediaStream,TResult? Function( String calleeId)?  ring,TResult? Function()?  accept,TResult? Function()?  decline,TResult? Function()?  hangUp,TResult? Function( MediaStream stream)?  remoteStream,}) {final _that = this;
switch (_that) {
case _ListenCalls() when listenCalls != null:
return listenCalls();case _ListenIceCandidates() when listenIceCandidates != null:
return listenIceCandidates(_that.callId);case _ListenRemoteMediaStream() when listenRemoteMediaStream != null:
return listenRemoteMediaStream();case _Ring() when ring != null:
return ring(_that.calleeId);case _Accept() when accept != null:
return accept();case _Decline() when decline != null:
return decline();case _HangUp() when hangUp != null:
return hangUp();case _RemoteStream() when remoteStream != null:
return remoteStream(_that.stream);case _:
  return null;

}
}

}

/// @nodoc


class _ListenCalls implements CallEvent {
  const _ListenCalls();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ListenCalls);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CallEvent.listenCalls()';
}


}




/// @nodoc


class _ListenIceCandidates implements CallEvent {
  const _ListenIceCandidates({required this.callId});
  

 final  String callId;

/// Create a copy of CallEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ListenIceCandidatesCopyWith<_ListenIceCandidates> get copyWith => __$ListenIceCandidatesCopyWithImpl<_ListenIceCandidates>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ListenIceCandidates&&(identical(other.callId, callId) || other.callId == callId));
}


@override
int get hashCode => Object.hash(runtimeType,callId);

@override
String toString() {
  return 'CallEvent.listenIceCandidates(callId: $callId)';
}


}

/// @nodoc
abstract mixin class _$ListenIceCandidatesCopyWith<$Res> implements $CallEventCopyWith<$Res> {
  factory _$ListenIceCandidatesCopyWith(_ListenIceCandidates value, $Res Function(_ListenIceCandidates) _then) = __$ListenIceCandidatesCopyWithImpl;
@useResult
$Res call({
 String callId
});




}
/// @nodoc
class __$ListenIceCandidatesCopyWithImpl<$Res>
    implements _$ListenIceCandidatesCopyWith<$Res> {
  __$ListenIceCandidatesCopyWithImpl(this._self, this._then);

  final _ListenIceCandidates _self;
  final $Res Function(_ListenIceCandidates) _then;

/// Create a copy of CallEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? callId = null,}) {
  return _then(_ListenIceCandidates(
callId: null == callId ? _self.callId : callId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _ListenRemoteMediaStream implements CallEvent {
  const _ListenRemoteMediaStream();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ListenRemoteMediaStream);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CallEvent.listenRemoteMediaStream()';
}


}




/// @nodoc


class _Ring implements CallEvent {
  const _Ring({required this.calleeId});
  

 final  String calleeId;

/// Create a copy of CallEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RingCopyWith<_Ring> get copyWith => __$RingCopyWithImpl<_Ring>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Ring&&(identical(other.calleeId, calleeId) || other.calleeId == calleeId));
}


@override
int get hashCode => Object.hash(runtimeType,calleeId);

@override
String toString() {
  return 'CallEvent.ring(calleeId: $calleeId)';
}


}

/// @nodoc
abstract mixin class _$RingCopyWith<$Res> implements $CallEventCopyWith<$Res> {
  factory _$RingCopyWith(_Ring value, $Res Function(_Ring) _then) = __$RingCopyWithImpl;
@useResult
$Res call({
 String calleeId
});




}
/// @nodoc
class __$RingCopyWithImpl<$Res>
    implements _$RingCopyWith<$Res> {
  __$RingCopyWithImpl(this._self, this._then);

  final _Ring _self;
  final $Res Function(_Ring) _then;

/// Create a copy of CallEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? calleeId = null,}) {
  return _then(_Ring(
calleeId: null == calleeId ? _self.calleeId : calleeId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _Accept implements CallEvent {
  const _Accept();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Accept);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CallEvent.accept()';
}


}




/// @nodoc


class _Decline implements CallEvent {
  const _Decline();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Decline);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CallEvent.decline()';
}


}




/// @nodoc


class _HangUp implements CallEvent {
  const _HangUp();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _HangUp);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CallEvent.hangUp()';
}


}




/// @nodoc


class _RemoteStream implements CallEvent {
  const _RemoteStream({required this.stream});
  

 final  MediaStream stream;

/// Create a copy of CallEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RemoteStreamCopyWith<_RemoteStream> get copyWith => __$RemoteStreamCopyWithImpl<_RemoteStream>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RemoteStream&&(identical(other.stream, stream) || other.stream == stream));
}


@override
int get hashCode => Object.hash(runtimeType,stream);

@override
String toString() {
  return 'CallEvent.remoteStream(stream: $stream)';
}


}

/// @nodoc
abstract mixin class _$RemoteStreamCopyWith<$Res> implements $CallEventCopyWith<$Res> {
  factory _$RemoteStreamCopyWith(_RemoteStream value, $Res Function(_RemoteStream) _then) = __$RemoteStreamCopyWithImpl;
@useResult
$Res call({
 MediaStream stream
});




}
/// @nodoc
class __$RemoteStreamCopyWithImpl<$Res>
    implements _$RemoteStreamCopyWith<$Res> {
  __$RemoteStreamCopyWithImpl(this._self, this._then);

  final _RemoteStream _self;
  final $Res Function(_RemoteStream) _then;

/// Create a copy of CallEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? stream = null,}) {
  return _then(_RemoteStream(
stream: null == stream ? _self.stream : stream // ignore: cast_nullable_to_non_nullable
as MediaStream,
  ));
}


}

/// @nodoc
mixin _$CallState {

 MediaStream? get localStream; MediaStream? get remoteStream; Call? get aCall; bool get isConnected; ECallStatus get status; String get errorMessage;
/// Create a copy of CallState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CallStateCopyWith<CallState> get copyWith => _$CallStateCopyWithImpl<CallState>(this as CallState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CallState&&(identical(other.localStream, localStream) || other.localStream == localStream)&&(identical(other.remoteStream, remoteStream) || other.remoteStream == remoteStream)&&(identical(other.aCall, aCall) || other.aCall == aCall)&&(identical(other.isConnected, isConnected) || other.isConnected == isConnected)&&(identical(other.status, status) || other.status == status)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,localStream,remoteStream,aCall,isConnected,status,errorMessage);

@override
String toString() {
  return 'CallState(localStream: $localStream, remoteStream: $remoteStream, aCall: $aCall, isConnected: $isConnected, status: $status, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class $CallStateCopyWith<$Res>  {
  factory $CallStateCopyWith(CallState value, $Res Function(CallState) _then) = _$CallStateCopyWithImpl;
@useResult
$Res call({
 MediaStream? localStream, MediaStream? remoteStream, Call? aCall, bool isConnected, ECallStatus status, String errorMessage
});


$CallCopyWith<$Res>? get aCall;

}
/// @nodoc
class _$CallStateCopyWithImpl<$Res>
    implements $CallStateCopyWith<$Res> {
  _$CallStateCopyWithImpl(this._self, this._then);

  final CallState _self;
  final $Res Function(CallState) _then;

/// Create a copy of CallState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? localStream = freezed,Object? remoteStream = freezed,Object? aCall = freezed,Object? isConnected = null,Object? status = null,Object? errorMessage = null,}) {
  return _then(_self.copyWith(
localStream: freezed == localStream ? _self.localStream : localStream // ignore: cast_nullable_to_non_nullable
as MediaStream?,remoteStream: freezed == remoteStream ? _self.remoteStream : remoteStream // ignore: cast_nullable_to_non_nullable
as MediaStream?,aCall: freezed == aCall ? _self.aCall : aCall // ignore: cast_nullable_to_non_nullable
as Call?,isConnected: null == isConnected ? _self.isConnected : isConnected // ignore: cast_nullable_to_non_nullable
as bool,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as ECallStatus,errorMessage: null == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String,
  ));
}
/// Create a copy of CallState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CallCopyWith<$Res>? get aCall {
    if (_self.aCall == null) {
    return null;
  }

  return $CallCopyWith<$Res>(_self.aCall!, (value) {
    return _then(_self.copyWith(aCall: value));
  });
}
}


/// Adds pattern-matching-related methods to [CallState].
extension CallStatePatterns on CallState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CallState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CallState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CallState value)  $default,){
final _that = this;
switch (_that) {
case _CallState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CallState value)?  $default,){
final _that = this;
switch (_that) {
case _CallState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( MediaStream? localStream,  MediaStream? remoteStream,  Call? aCall,  bool isConnected,  ECallStatus status,  String errorMessage)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CallState() when $default != null:
return $default(_that.localStream,_that.remoteStream,_that.aCall,_that.isConnected,_that.status,_that.errorMessage);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( MediaStream? localStream,  MediaStream? remoteStream,  Call? aCall,  bool isConnected,  ECallStatus status,  String errorMessage)  $default,) {final _that = this;
switch (_that) {
case _CallState():
return $default(_that.localStream,_that.remoteStream,_that.aCall,_that.isConnected,_that.status,_that.errorMessage);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( MediaStream? localStream,  MediaStream? remoteStream,  Call? aCall,  bool isConnected,  ECallStatus status,  String errorMessage)?  $default,) {final _that = this;
switch (_that) {
case _CallState() when $default != null:
return $default(_that.localStream,_that.remoteStream,_that.aCall,_that.isConnected,_that.status,_that.errorMessage);case _:
  return null;

}
}

}

/// @nodoc


class _CallState implements CallState {
  const _CallState({this.localStream, this.remoteStream, this.aCall, this.isConnected = false, this.status = ECallStatus.idle, this.errorMessage = ''});
  

@override final  MediaStream? localStream;
@override final  MediaStream? remoteStream;
@override final  Call? aCall;
@override@JsonKey() final  bool isConnected;
@override@JsonKey() final  ECallStatus status;
@override@JsonKey() final  String errorMessage;

/// Create a copy of CallState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CallStateCopyWith<_CallState> get copyWith => __$CallStateCopyWithImpl<_CallState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CallState&&(identical(other.localStream, localStream) || other.localStream == localStream)&&(identical(other.remoteStream, remoteStream) || other.remoteStream == remoteStream)&&(identical(other.aCall, aCall) || other.aCall == aCall)&&(identical(other.isConnected, isConnected) || other.isConnected == isConnected)&&(identical(other.status, status) || other.status == status)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,localStream,remoteStream,aCall,isConnected,status,errorMessage);

@override
String toString() {
  return 'CallState(localStream: $localStream, remoteStream: $remoteStream, aCall: $aCall, isConnected: $isConnected, status: $status, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class _$CallStateCopyWith<$Res> implements $CallStateCopyWith<$Res> {
  factory _$CallStateCopyWith(_CallState value, $Res Function(_CallState) _then) = __$CallStateCopyWithImpl;
@override @useResult
$Res call({
 MediaStream? localStream, MediaStream? remoteStream, Call? aCall, bool isConnected, ECallStatus status, String errorMessage
});


@override $CallCopyWith<$Res>? get aCall;

}
/// @nodoc
class __$CallStateCopyWithImpl<$Res>
    implements _$CallStateCopyWith<$Res> {
  __$CallStateCopyWithImpl(this._self, this._then);

  final _CallState _self;
  final $Res Function(_CallState) _then;

/// Create a copy of CallState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? localStream = freezed,Object? remoteStream = freezed,Object? aCall = freezed,Object? isConnected = null,Object? status = null,Object? errorMessage = null,}) {
  return _then(_CallState(
localStream: freezed == localStream ? _self.localStream : localStream // ignore: cast_nullable_to_non_nullable
as MediaStream?,remoteStream: freezed == remoteStream ? _self.remoteStream : remoteStream // ignore: cast_nullable_to_non_nullable
as MediaStream?,aCall: freezed == aCall ? _self.aCall : aCall // ignore: cast_nullable_to_non_nullable
as Call?,isConnected: null == isConnected ? _self.isConnected : isConnected // ignore: cast_nullable_to_non_nullable
as bool,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as ECallStatus,errorMessage: null == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

/// Create a copy of CallState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CallCopyWith<$Res>? get aCall {
    if (_self.aCall == null) {
    return null;
  }

  return $CallCopyWith<$Res>(_self.aCall!, (value) {
    return _then(_self.copyWith(aCall: value));
  });
}
}

// dart format on
