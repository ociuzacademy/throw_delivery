// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'complete_delivery_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$CompleteDeliveryEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CompleteDeliveryEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CompleteDeliveryEvent()';
}


}

/// @nodoc
class $CompleteDeliveryEventCopyWith<$Res>  {
$CompleteDeliveryEventCopyWith(CompleteDeliveryEvent _, $Res Function(CompleteDeliveryEvent) __);
}


/// Adds pattern-matching-related methods to [CompleteDeliveryEvent].
extension CompleteDeliveryEventPatterns on CompleteDeliveryEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Started value)?  started,TResult Function( _VerifyingOtp value)?  verifyingOtp,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Started() when started != null:
return started(_that);case _VerifyingOtp() when verifyingOtp != null:
return verifyingOtp(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Started value)  started,required TResult Function( _VerifyingOtp value)  verifyingOtp,}){
final _that = this;
switch (_that) {
case _Started():
return started(_that);case _VerifyingOtp():
return verifyingOtp(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Started value)?  started,TResult? Function( _VerifyingOtp value)?  verifyingOtp,}){
final _that = this;
switch (_that) {
case _Started() when started != null:
return started(_that);case _VerifyingOtp() when verifyingOtp != null:
return verifyingOtp(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  started,TResult Function( String requestId,  String otp)?  verifyingOtp,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Started() when started != null:
return started();case _VerifyingOtp() when verifyingOtp != null:
return verifyingOtp(_that.requestId,_that.otp);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  started,required TResult Function( String requestId,  String otp)  verifyingOtp,}) {final _that = this;
switch (_that) {
case _Started():
return started();case _VerifyingOtp():
return verifyingOtp(_that.requestId,_that.otp);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  started,TResult? Function( String requestId,  String otp)?  verifyingOtp,}) {final _that = this;
switch (_that) {
case _Started() when started != null:
return started();case _VerifyingOtp() when verifyingOtp != null:
return verifyingOtp(_that.requestId,_that.otp);case _:
  return null;

}
}

}

/// @nodoc


class _Started implements CompleteDeliveryEvent {
  const _Started();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Started);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CompleteDeliveryEvent.started()';
}


}




/// @nodoc


class _VerifyingOtp implements CompleteDeliveryEvent {
  const _VerifyingOtp({required this.requestId, required this.otp});
  

 final  String requestId;
 final  String otp;

/// Create a copy of CompleteDeliveryEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$VerifyingOtpCopyWith<_VerifyingOtp> get copyWith => __$VerifyingOtpCopyWithImpl<_VerifyingOtp>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _VerifyingOtp&&(identical(other.requestId, requestId) || other.requestId == requestId)&&(identical(other.otp, otp) || other.otp == otp));
}


@override
int get hashCode => Object.hash(runtimeType,requestId,otp);

@override
String toString() {
  return 'CompleteDeliveryEvent.verifyingOtp(requestId: $requestId, otp: $otp)';
}


}

/// @nodoc
abstract mixin class _$VerifyingOtpCopyWith<$Res> implements $CompleteDeliveryEventCopyWith<$Res> {
  factory _$VerifyingOtpCopyWith(_VerifyingOtp value, $Res Function(_VerifyingOtp) _then) = __$VerifyingOtpCopyWithImpl;
@useResult
$Res call({
 String requestId, String otp
});




}
/// @nodoc
class __$VerifyingOtpCopyWithImpl<$Res>
    implements _$VerifyingOtpCopyWith<$Res> {
  __$VerifyingOtpCopyWithImpl(this._self, this._then);

  final _VerifyingOtp _self;
  final $Res Function(_VerifyingOtp) _then;

/// Create a copy of CompleteDeliveryEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? requestId = null,Object? otp = null,}) {
  return _then(_VerifyingOtp(
requestId: null == requestId ? _self.requestId : requestId // ignore: cast_nullable_to_non_nullable
as String,otp: null == otp ? _self.otp : otp // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc
mixin _$CompleteDeliveryState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CompleteDeliveryState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CompleteDeliveryState()';
}


}

/// @nodoc
class $CompleteDeliveryStateCopyWith<$Res>  {
$CompleteDeliveryStateCopyWith(CompleteDeliveryState _, $Res Function(CompleteDeliveryState) __);
}


/// Adds pattern-matching-related methods to [CompleteDeliveryState].
extension CompleteDeliveryStatePatterns on CompleteDeliveryState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( CompleteDeliveryInitial value)?  initial,TResult Function( CompleteDeliveryLoading value)?  loading,TResult Function( CompleteDeliverySuccess value)?  success,TResult Function( CompleteDeliveryError value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case CompleteDeliveryInitial() when initial != null:
return initial(_that);case CompleteDeliveryLoading() when loading != null:
return loading(_that);case CompleteDeliverySuccess() when success != null:
return success(_that);case CompleteDeliveryError() when error != null:
return error(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( CompleteDeliveryInitial value)  initial,required TResult Function( CompleteDeliveryLoading value)  loading,required TResult Function( CompleteDeliverySuccess value)  success,required TResult Function( CompleteDeliveryError value)  error,}){
final _that = this;
switch (_that) {
case CompleteDeliveryInitial():
return initial(_that);case CompleteDeliveryLoading():
return loading(_that);case CompleteDeliverySuccess():
return success(_that);case CompleteDeliveryError():
return error(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( CompleteDeliveryInitial value)?  initial,TResult? Function( CompleteDeliveryLoading value)?  loading,TResult? Function( CompleteDeliverySuccess value)?  success,TResult? Function( CompleteDeliveryError value)?  error,}){
final _that = this;
switch (_that) {
case CompleteDeliveryInitial() when initial != null:
return initial(_that);case CompleteDeliveryLoading() when loading != null:
return loading(_that);case CompleteDeliverySuccess() when success != null:
return success(_that);case CompleteDeliveryError() when error != null:
return error(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function()?  success,TResult Function( String message)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case CompleteDeliveryInitial() when initial != null:
return initial();case CompleteDeliveryLoading() when loading != null:
return loading();case CompleteDeliverySuccess() when success != null:
return success();case CompleteDeliveryError() when error != null:
return error(_that.message);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function()  success,required TResult Function( String message)  error,}) {final _that = this;
switch (_that) {
case CompleteDeliveryInitial():
return initial();case CompleteDeliveryLoading():
return loading();case CompleteDeliverySuccess():
return success();case CompleteDeliveryError():
return error(_that.message);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function()?  success,TResult? Function( String message)?  error,}) {final _that = this;
switch (_that) {
case CompleteDeliveryInitial() when initial != null:
return initial();case CompleteDeliveryLoading() when loading != null:
return loading();case CompleteDeliverySuccess() when success != null:
return success();case CompleteDeliveryError() when error != null:
return error(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class CompleteDeliveryInitial implements CompleteDeliveryState {
  const CompleteDeliveryInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CompleteDeliveryInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CompleteDeliveryState.initial()';
}


}




/// @nodoc


class CompleteDeliveryLoading implements CompleteDeliveryState {
  const CompleteDeliveryLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CompleteDeliveryLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CompleteDeliveryState.loading()';
}


}




/// @nodoc


class CompleteDeliverySuccess implements CompleteDeliveryState {
  const CompleteDeliverySuccess();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CompleteDeliverySuccess);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CompleteDeliveryState.success()';
}


}




/// @nodoc


class CompleteDeliveryError implements CompleteDeliveryState {
  const CompleteDeliveryError(this.message);
  

 final  String message;

/// Create a copy of CompleteDeliveryState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CompleteDeliveryErrorCopyWith<CompleteDeliveryError> get copyWith => _$CompleteDeliveryErrorCopyWithImpl<CompleteDeliveryError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CompleteDeliveryError&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'CompleteDeliveryState.error(message: $message)';
}


}

/// @nodoc
abstract mixin class $CompleteDeliveryErrorCopyWith<$Res> implements $CompleteDeliveryStateCopyWith<$Res> {
  factory $CompleteDeliveryErrorCopyWith(CompleteDeliveryError value, $Res Function(CompleteDeliveryError) _then) = _$CompleteDeliveryErrorCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$CompleteDeliveryErrorCopyWithImpl<$Res>
    implements $CompleteDeliveryErrorCopyWith<$Res> {
  _$CompleteDeliveryErrorCopyWithImpl(this._self, this._then);

  final CompleteDeliveryError _self;
  final $Res Function(CompleteDeliveryError) _then;

/// Create a copy of CompleteDeliveryState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(CompleteDeliveryError(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
