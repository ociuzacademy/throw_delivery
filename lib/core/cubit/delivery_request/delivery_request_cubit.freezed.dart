// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'delivery_request_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$DeliveryRequestState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DeliveryRequestState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'DeliveryRequestState()';
}


}

/// @nodoc
class $DeliveryRequestStateCopyWith<$Res>  {
$DeliveryRequestStateCopyWith(DeliveryRequestState _, $Res Function(DeliveryRequestState) __);
}


/// Adds pattern-matching-related methods to [DeliveryRequestState].
extension DeliveryRequestStatePatterns on DeliveryRequestState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( DeliveryRequestInitial value)?  initial,TResult Function( DeliveryRequestLoading value)?  loading,TResult Function( DeliveryRequestDetailsLoaded value)?  deliveryRequestDetailsLoaded,TResult Function( DeliveryRequestError value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case DeliveryRequestInitial() when initial != null:
return initial(_that);case DeliveryRequestLoading() when loading != null:
return loading(_that);case DeliveryRequestDetailsLoaded() when deliveryRequestDetailsLoaded != null:
return deliveryRequestDetailsLoaded(_that);case DeliveryRequestError() when error != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( DeliveryRequestInitial value)  initial,required TResult Function( DeliveryRequestLoading value)  loading,required TResult Function( DeliveryRequestDetailsLoaded value)  deliveryRequestDetailsLoaded,required TResult Function( DeliveryRequestError value)  error,}){
final _that = this;
switch (_that) {
case DeliveryRequestInitial():
return initial(_that);case DeliveryRequestLoading():
return loading(_that);case DeliveryRequestDetailsLoaded():
return deliveryRequestDetailsLoaded(_that);case DeliveryRequestError():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( DeliveryRequestInitial value)?  initial,TResult? Function( DeliveryRequestLoading value)?  loading,TResult? Function( DeliveryRequestDetailsLoaded value)?  deliveryRequestDetailsLoaded,TResult? Function( DeliveryRequestError value)?  error,}){
final _that = this;
switch (_that) {
case DeliveryRequestInitial() when initial != null:
return initial(_that);case DeliveryRequestLoading() when loading != null:
return loading(_that);case DeliveryRequestDetailsLoaded() when deliveryRequestDetailsLoaded != null:
return deliveryRequestDetailsLoaded(_that);case DeliveryRequestError() when error != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( DeliveryRequestModel deliveryRequestDetails)?  deliveryRequestDetailsLoaded,TResult Function( String message)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case DeliveryRequestInitial() when initial != null:
return initial();case DeliveryRequestLoading() when loading != null:
return loading();case DeliveryRequestDetailsLoaded() when deliveryRequestDetailsLoaded != null:
return deliveryRequestDetailsLoaded(_that.deliveryRequestDetails);case DeliveryRequestError() when error != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( DeliveryRequestModel deliveryRequestDetails)  deliveryRequestDetailsLoaded,required TResult Function( String message)  error,}) {final _that = this;
switch (_that) {
case DeliveryRequestInitial():
return initial();case DeliveryRequestLoading():
return loading();case DeliveryRequestDetailsLoaded():
return deliveryRequestDetailsLoaded(_that.deliveryRequestDetails);case DeliveryRequestError():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( DeliveryRequestModel deliveryRequestDetails)?  deliveryRequestDetailsLoaded,TResult? Function( String message)?  error,}) {final _that = this;
switch (_that) {
case DeliveryRequestInitial() when initial != null:
return initial();case DeliveryRequestLoading() when loading != null:
return loading();case DeliveryRequestDetailsLoaded() when deliveryRequestDetailsLoaded != null:
return deliveryRequestDetailsLoaded(_that.deliveryRequestDetails);case DeliveryRequestError() when error != null:
return error(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class DeliveryRequestInitial implements DeliveryRequestState {
  const DeliveryRequestInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DeliveryRequestInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'DeliveryRequestState.initial()';
}


}




/// @nodoc


class DeliveryRequestLoading implements DeliveryRequestState {
  const DeliveryRequestLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DeliveryRequestLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'DeliveryRequestState.loading()';
}


}




/// @nodoc


class DeliveryRequestDetailsLoaded implements DeliveryRequestState {
  const DeliveryRequestDetailsLoaded(this.deliveryRequestDetails);
  

 final  DeliveryRequestModel deliveryRequestDetails;

/// Create a copy of DeliveryRequestState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DeliveryRequestDetailsLoadedCopyWith<DeliveryRequestDetailsLoaded> get copyWith => _$DeliveryRequestDetailsLoadedCopyWithImpl<DeliveryRequestDetailsLoaded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DeliveryRequestDetailsLoaded&&(identical(other.deliveryRequestDetails, deliveryRequestDetails) || other.deliveryRequestDetails == deliveryRequestDetails));
}


@override
int get hashCode => Object.hash(runtimeType,deliveryRequestDetails);

@override
String toString() {
  return 'DeliveryRequestState.deliveryRequestDetailsLoaded(deliveryRequestDetails: $deliveryRequestDetails)';
}


}

/// @nodoc
abstract mixin class $DeliveryRequestDetailsLoadedCopyWith<$Res> implements $DeliveryRequestStateCopyWith<$Res> {
  factory $DeliveryRequestDetailsLoadedCopyWith(DeliveryRequestDetailsLoaded value, $Res Function(DeliveryRequestDetailsLoaded) _then) = _$DeliveryRequestDetailsLoadedCopyWithImpl;
@useResult
$Res call({
 DeliveryRequestModel deliveryRequestDetails
});




}
/// @nodoc
class _$DeliveryRequestDetailsLoadedCopyWithImpl<$Res>
    implements $DeliveryRequestDetailsLoadedCopyWith<$Res> {
  _$DeliveryRequestDetailsLoadedCopyWithImpl(this._self, this._then);

  final DeliveryRequestDetailsLoaded _self;
  final $Res Function(DeliveryRequestDetailsLoaded) _then;

/// Create a copy of DeliveryRequestState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? deliveryRequestDetails = null,}) {
  return _then(DeliveryRequestDetailsLoaded(
null == deliveryRequestDetails ? _self.deliveryRequestDetails : deliveryRequestDetails // ignore: cast_nullable_to_non_nullable
as DeliveryRequestModel,
  ));
}


}

/// @nodoc


class DeliveryRequestError implements DeliveryRequestState {
  const DeliveryRequestError(this.message);
  

 final  String message;

/// Create a copy of DeliveryRequestState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DeliveryRequestErrorCopyWith<DeliveryRequestError> get copyWith => _$DeliveryRequestErrorCopyWithImpl<DeliveryRequestError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DeliveryRequestError&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'DeliveryRequestState.error(message: $message)';
}


}

/// @nodoc
abstract mixin class $DeliveryRequestErrorCopyWith<$Res> implements $DeliveryRequestStateCopyWith<$Res> {
  factory $DeliveryRequestErrorCopyWith(DeliveryRequestError value, $Res Function(DeliveryRequestError) _then) = _$DeliveryRequestErrorCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$DeliveryRequestErrorCopyWithImpl<$Res>
    implements $DeliveryRequestErrorCopyWith<$Res> {
  _$DeliveryRequestErrorCopyWithImpl(this._self, this._then);

  final DeliveryRequestError _self;
  final $Res Function(DeliveryRequestError) _then;

/// Create a copy of DeliveryRequestState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(DeliveryRequestError(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
