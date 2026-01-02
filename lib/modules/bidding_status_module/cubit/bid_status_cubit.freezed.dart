// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'bid_status_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$BidStatusState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BidStatusState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'BidStatusState()';
}


}

/// @nodoc
class $BidStatusStateCopyWith<$Res>  {
$BidStatusStateCopyWith(BidStatusState _, $Res Function(BidStatusState) __);
}


/// Adds pattern-matching-related methods to [BidStatusState].
extension BidStatusStatePatterns on BidStatusState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( BidStatusInitial value)?  initial,TResult Function( BidStatusLoading value)?  loading,TResult Function( BidStatusSuccess value)?  success,TResult Function( BidStatusError value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case BidStatusInitial() when initial != null:
return initial(_that);case BidStatusLoading() when loading != null:
return loading(_that);case BidStatusSuccess() when success != null:
return success(_that);case BidStatusError() when error != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( BidStatusInitial value)  initial,required TResult Function( BidStatusLoading value)  loading,required TResult Function( BidStatusSuccess value)  success,required TResult Function( BidStatusError value)  error,}){
final _that = this;
switch (_that) {
case BidStatusInitial():
return initial(_that);case BidStatusLoading():
return loading(_that);case BidStatusSuccess():
return success(_that);case BidStatusError():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( BidStatusInitial value)?  initial,TResult? Function( BidStatusLoading value)?  loading,TResult? Function( BidStatusSuccess value)?  success,TResult? Function( BidStatusError value)?  error,}){
final _that = this;
switch (_that) {
case BidStatusInitial() when initial != null:
return initial(_that);case BidStatusLoading() when loading != null:
return loading(_that);case BidStatusSuccess() when success != null:
return success(_that);case BidStatusError() when error != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( BidModel bid,  DeliveryRequestModel deliveryRequest)?  success,TResult Function( String message)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case BidStatusInitial() when initial != null:
return initial();case BidStatusLoading() when loading != null:
return loading();case BidStatusSuccess() when success != null:
return success(_that.bid,_that.deliveryRequest);case BidStatusError() when error != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( BidModel bid,  DeliveryRequestModel deliveryRequest)  success,required TResult Function( String message)  error,}) {final _that = this;
switch (_that) {
case BidStatusInitial():
return initial();case BidStatusLoading():
return loading();case BidStatusSuccess():
return success(_that.bid,_that.deliveryRequest);case BidStatusError():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( BidModel bid,  DeliveryRequestModel deliveryRequest)?  success,TResult? Function( String message)?  error,}) {final _that = this;
switch (_that) {
case BidStatusInitial() when initial != null:
return initial();case BidStatusLoading() when loading != null:
return loading();case BidStatusSuccess() when success != null:
return success(_that.bid,_that.deliveryRequest);case BidStatusError() when error != null:
return error(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class BidStatusInitial implements BidStatusState {
  const BidStatusInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BidStatusInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'BidStatusState.initial()';
}


}




/// @nodoc


class BidStatusLoading implements BidStatusState {
  const BidStatusLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BidStatusLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'BidStatusState.loading()';
}


}




/// @nodoc


class BidStatusSuccess implements BidStatusState {
  const BidStatusSuccess({required this.bid, required this.deliveryRequest});
  

 final  BidModel bid;
 final  DeliveryRequestModel deliveryRequest;

/// Create a copy of BidStatusState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BidStatusSuccessCopyWith<BidStatusSuccess> get copyWith => _$BidStatusSuccessCopyWithImpl<BidStatusSuccess>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BidStatusSuccess&&(identical(other.bid, bid) || other.bid == bid)&&(identical(other.deliveryRequest, deliveryRequest) || other.deliveryRequest == deliveryRequest));
}


@override
int get hashCode => Object.hash(runtimeType,bid,deliveryRequest);

@override
String toString() {
  return 'BidStatusState.success(bid: $bid, deliveryRequest: $deliveryRequest)';
}


}

/// @nodoc
abstract mixin class $BidStatusSuccessCopyWith<$Res> implements $BidStatusStateCopyWith<$Res> {
  factory $BidStatusSuccessCopyWith(BidStatusSuccess value, $Res Function(BidStatusSuccess) _then) = _$BidStatusSuccessCopyWithImpl;
@useResult
$Res call({
 BidModel bid, DeliveryRequestModel deliveryRequest
});




}
/// @nodoc
class _$BidStatusSuccessCopyWithImpl<$Res>
    implements $BidStatusSuccessCopyWith<$Res> {
  _$BidStatusSuccessCopyWithImpl(this._self, this._then);

  final BidStatusSuccess _self;
  final $Res Function(BidStatusSuccess) _then;

/// Create a copy of BidStatusState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? bid = null,Object? deliveryRequest = null,}) {
  return _then(BidStatusSuccess(
bid: null == bid ? _self.bid : bid // ignore: cast_nullable_to_non_nullable
as BidModel,deliveryRequest: null == deliveryRequest ? _self.deliveryRequest : deliveryRequest // ignore: cast_nullable_to_non_nullable
as DeliveryRequestModel,
  ));
}


}

/// @nodoc


class BidStatusError implements BidStatusState {
  const BidStatusError({required this.message});
  

 final  String message;

/// Create a copy of BidStatusState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BidStatusErrorCopyWith<BidStatusError> get copyWith => _$BidStatusErrorCopyWithImpl<BidStatusError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BidStatusError&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'BidStatusState.error(message: $message)';
}


}

/// @nodoc
abstract mixin class $BidStatusErrorCopyWith<$Res> implements $BidStatusStateCopyWith<$Res> {
  factory $BidStatusErrorCopyWith(BidStatusError value, $Res Function(BidStatusError) _then) = _$BidStatusErrorCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$BidStatusErrorCopyWithImpl<$Res>
    implements $BidStatusErrorCopyWith<$Res> {
  _$BidStatusErrorCopyWithImpl(this._self, this._then);

  final BidStatusError _self;
  final $Res Function(BidStatusError) _then;

/// Create a copy of BidStatusState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(BidStatusError(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
