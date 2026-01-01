// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'place_bid_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$PlaceBidEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PlaceBidEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'PlaceBidEvent()';
}


}

/// @nodoc
class $PlaceBidEventCopyWith<$Res>  {
$PlaceBidEventCopyWith(PlaceBidEvent _, $Res Function(PlaceBidEvent) __);
}


/// Adds pattern-matching-related methods to [PlaceBidEvent].
extension PlaceBidEventPatterns on PlaceBidEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Started value)?  started,TResult Function( _PlaceBid value)?  placeBid,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Started() when started != null:
return started(_that);case _PlaceBid() when placeBid != null:
return placeBid(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Started value)  started,required TResult Function( _PlaceBid value)  placeBid,}){
final _that = this;
switch (_that) {
case _Started():
return started(_that);case _PlaceBid():
return placeBid(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Started value)?  started,TResult? Function( _PlaceBid value)?  placeBid,}){
final _that = this;
switch (_that) {
case _Started() when started != null:
return started(_that);case _PlaceBid() when placeBid != null:
return placeBid(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  started,TResult Function( String requestId,  double bidAmount)?  placeBid,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Started() when started != null:
return started();case _PlaceBid() when placeBid != null:
return placeBid(_that.requestId,_that.bidAmount);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  started,required TResult Function( String requestId,  double bidAmount)  placeBid,}) {final _that = this;
switch (_that) {
case _Started():
return started();case _PlaceBid():
return placeBid(_that.requestId,_that.bidAmount);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  started,TResult? Function( String requestId,  double bidAmount)?  placeBid,}) {final _that = this;
switch (_that) {
case _Started() when started != null:
return started();case _PlaceBid() when placeBid != null:
return placeBid(_that.requestId,_that.bidAmount);case _:
  return null;

}
}

}

/// @nodoc


class _Started implements PlaceBidEvent {
  const _Started();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Started);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'PlaceBidEvent.started()';
}


}




/// @nodoc


class _PlaceBid implements PlaceBidEvent {
  const _PlaceBid({required this.requestId, required this.bidAmount});
  

 final  String requestId;
 final  double bidAmount;

/// Create a copy of PlaceBidEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PlaceBidCopyWith<_PlaceBid> get copyWith => __$PlaceBidCopyWithImpl<_PlaceBid>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PlaceBid&&(identical(other.requestId, requestId) || other.requestId == requestId)&&(identical(other.bidAmount, bidAmount) || other.bidAmount == bidAmount));
}


@override
int get hashCode => Object.hash(runtimeType,requestId,bidAmount);

@override
String toString() {
  return 'PlaceBidEvent.placeBid(requestId: $requestId, bidAmount: $bidAmount)';
}


}

/// @nodoc
abstract mixin class _$PlaceBidCopyWith<$Res> implements $PlaceBidEventCopyWith<$Res> {
  factory _$PlaceBidCopyWith(_PlaceBid value, $Res Function(_PlaceBid) _then) = __$PlaceBidCopyWithImpl;
@useResult
$Res call({
 String requestId, double bidAmount
});




}
/// @nodoc
class __$PlaceBidCopyWithImpl<$Res>
    implements _$PlaceBidCopyWith<$Res> {
  __$PlaceBidCopyWithImpl(this._self, this._then);

  final _PlaceBid _self;
  final $Res Function(_PlaceBid) _then;

/// Create a copy of PlaceBidEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? requestId = null,Object? bidAmount = null,}) {
  return _then(_PlaceBid(
requestId: null == requestId ? _self.requestId : requestId // ignore: cast_nullable_to_non_nullable
as String,bidAmount: null == bidAmount ? _self.bidAmount : bidAmount // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}

/// @nodoc
mixin _$PlaceBidState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PlaceBidState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'PlaceBidState()';
}


}

/// @nodoc
class $PlaceBidStateCopyWith<$Res>  {
$PlaceBidStateCopyWith(PlaceBidState _, $Res Function(PlaceBidState) __);
}


/// Adds pattern-matching-related methods to [PlaceBidState].
extension PlaceBidStatePatterns on PlaceBidState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( PlaceBidInitial value)?  initial,TResult Function( PlaceBidLoading value)?  loading,TResult Function( PlaceBidSuccess value)?  success,TResult Function( PlaceBidError value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case PlaceBidInitial() when initial != null:
return initial(_that);case PlaceBidLoading() when loading != null:
return loading(_that);case PlaceBidSuccess() when success != null:
return success(_that);case PlaceBidError() when error != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( PlaceBidInitial value)  initial,required TResult Function( PlaceBidLoading value)  loading,required TResult Function( PlaceBidSuccess value)  success,required TResult Function( PlaceBidError value)  error,}){
final _that = this;
switch (_that) {
case PlaceBidInitial():
return initial(_that);case PlaceBidLoading():
return loading(_that);case PlaceBidSuccess():
return success(_that);case PlaceBidError():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( PlaceBidInitial value)?  initial,TResult? Function( PlaceBidLoading value)?  loading,TResult? Function( PlaceBidSuccess value)?  success,TResult? Function( PlaceBidError value)?  error,}){
final _that = this;
switch (_that) {
case PlaceBidInitial() when initial != null:
return initial(_that);case PlaceBidLoading() when loading != null:
return loading(_that);case PlaceBidSuccess() when success != null:
return success(_that);case PlaceBidError() when error != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( String bidId)?  success,TResult Function( String message)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case PlaceBidInitial() when initial != null:
return initial();case PlaceBidLoading() when loading != null:
return loading();case PlaceBidSuccess() when success != null:
return success(_that.bidId);case PlaceBidError() when error != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( String bidId)  success,required TResult Function( String message)  error,}) {final _that = this;
switch (_that) {
case PlaceBidInitial():
return initial();case PlaceBidLoading():
return loading();case PlaceBidSuccess():
return success(_that.bidId);case PlaceBidError():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( String bidId)?  success,TResult? Function( String message)?  error,}) {final _that = this;
switch (_that) {
case PlaceBidInitial() when initial != null:
return initial();case PlaceBidLoading() when loading != null:
return loading();case PlaceBidSuccess() when success != null:
return success(_that.bidId);case PlaceBidError() when error != null:
return error(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class PlaceBidInitial implements PlaceBidState {
  const PlaceBidInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PlaceBidInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'PlaceBidState.initial()';
}


}




/// @nodoc


class PlaceBidLoading implements PlaceBidState {
  const PlaceBidLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PlaceBidLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'PlaceBidState.loading()';
}


}




/// @nodoc


class PlaceBidSuccess implements PlaceBidState {
  const PlaceBidSuccess(this.bidId);
  

 final  String bidId;

/// Create a copy of PlaceBidState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PlaceBidSuccessCopyWith<PlaceBidSuccess> get copyWith => _$PlaceBidSuccessCopyWithImpl<PlaceBidSuccess>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PlaceBidSuccess&&(identical(other.bidId, bidId) || other.bidId == bidId));
}


@override
int get hashCode => Object.hash(runtimeType,bidId);

@override
String toString() {
  return 'PlaceBidState.success(bidId: $bidId)';
}


}

/// @nodoc
abstract mixin class $PlaceBidSuccessCopyWith<$Res> implements $PlaceBidStateCopyWith<$Res> {
  factory $PlaceBidSuccessCopyWith(PlaceBidSuccess value, $Res Function(PlaceBidSuccess) _then) = _$PlaceBidSuccessCopyWithImpl;
@useResult
$Res call({
 String bidId
});




}
/// @nodoc
class _$PlaceBidSuccessCopyWithImpl<$Res>
    implements $PlaceBidSuccessCopyWith<$Res> {
  _$PlaceBidSuccessCopyWithImpl(this._self, this._then);

  final PlaceBidSuccess _self;
  final $Res Function(PlaceBidSuccess) _then;

/// Create a copy of PlaceBidState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? bidId = null,}) {
  return _then(PlaceBidSuccess(
null == bidId ? _self.bidId : bidId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class PlaceBidError implements PlaceBidState {
  const PlaceBidError(this.message);
  

 final  String message;

/// Create a copy of PlaceBidState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PlaceBidErrorCopyWith<PlaceBidError> get copyWith => _$PlaceBidErrorCopyWithImpl<PlaceBidError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PlaceBidError&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'PlaceBidState.error(message: $message)';
}


}

/// @nodoc
abstract mixin class $PlaceBidErrorCopyWith<$Res> implements $PlaceBidStateCopyWith<$Res> {
  factory $PlaceBidErrorCopyWith(PlaceBidError value, $Res Function(PlaceBidError) _then) = _$PlaceBidErrorCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$PlaceBidErrorCopyWithImpl<$Res>
    implements $PlaceBidErrorCopyWith<$Res> {
  _$PlaceBidErrorCopyWithImpl(this._self, this._then);

  final PlaceBidError _self;
  final $Res Function(PlaceBidError) _then;

/// Create a copy of PlaceBidState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(PlaceBidError(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
