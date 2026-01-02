// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'bargain_action_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$BargainActionEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BargainActionEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'BargainActionEvent()';
}


}

/// @nodoc
class $BargainActionEventCopyWith<$Res>  {
$BargainActionEventCopyWith(BargainActionEvent _, $Res Function(BargainActionEvent) __);
}


/// Adds pattern-matching-related methods to [BargainActionEvent].
extension BargainActionEventPatterns on BargainActionEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Started value)?  started,TResult Function( _AcceptBargain value)?  acceptBargain,TResult Function( _RejectBargain value)?  rejectBargain,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Started() when started != null:
return started(_that);case _AcceptBargain() when acceptBargain != null:
return acceptBargain(_that);case _RejectBargain() when rejectBargain != null:
return rejectBargain(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Started value)  started,required TResult Function( _AcceptBargain value)  acceptBargain,required TResult Function( _RejectBargain value)  rejectBargain,}){
final _that = this;
switch (_that) {
case _Started():
return started(_that);case _AcceptBargain():
return acceptBargain(_that);case _RejectBargain():
return rejectBargain(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Started value)?  started,TResult? Function( _AcceptBargain value)?  acceptBargain,TResult? Function( _RejectBargain value)?  rejectBargain,}){
final _that = this;
switch (_that) {
case _Started() when started != null:
return started(_that);case _AcceptBargain() when acceptBargain != null:
return acceptBargain(_that);case _RejectBargain() when rejectBargain != null:
return rejectBargain(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  started,TResult Function( String requestId,  String bidId,  double bargainAmount)?  acceptBargain,TResult Function( String requestId,  String bidId)?  rejectBargain,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Started() when started != null:
return started();case _AcceptBargain() when acceptBargain != null:
return acceptBargain(_that.requestId,_that.bidId,_that.bargainAmount);case _RejectBargain() when rejectBargain != null:
return rejectBargain(_that.requestId,_that.bidId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  started,required TResult Function( String requestId,  String bidId,  double bargainAmount)  acceptBargain,required TResult Function( String requestId,  String bidId)  rejectBargain,}) {final _that = this;
switch (_that) {
case _Started():
return started();case _AcceptBargain():
return acceptBargain(_that.requestId,_that.bidId,_that.bargainAmount);case _RejectBargain():
return rejectBargain(_that.requestId,_that.bidId);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  started,TResult? Function( String requestId,  String bidId,  double bargainAmount)?  acceptBargain,TResult? Function( String requestId,  String bidId)?  rejectBargain,}) {final _that = this;
switch (_that) {
case _Started() when started != null:
return started();case _AcceptBargain() when acceptBargain != null:
return acceptBargain(_that.requestId,_that.bidId,_that.bargainAmount);case _RejectBargain() when rejectBargain != null:
return rejectBargain(_that.requestId,_that.bidId);case _:
  return null;

}
}

}

/// @nodoc


class _Started implements BargainActionEvent {
  const _Started();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Started);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'BargainActionEvent.started()';
}


}




/// @nodoc


class _AcceptBargain implements BargainActionEvent {
  const _AcceptBargain({required this.requestId, required this.bidId, required this.bargainAmount});
  

 final  String requestId;
 final  String bidId;
 final  double bargainAmount;

/// Create a copy of BargainActionEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AcceptBargainCopyWith<_AcceptBargain> get copyWith => __$AcceptBargainCopyWithImpl<_AcceptBargain>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AcceptBargain&&(identical(other.requestId, requestId) || other.requestId == requestId)&&(identical(other.bidId, bidId) || other.bidId == bidId)&&(identical(other.bargainAmount, bargainAmount) || other.bargainAmount == bargainAmount));
}


@override
int get hashCode => Object.hash(runtimeType,requestId,bidId,bargainAmount);

@override
String toString() {
  return 'BargainActionEvent.acceptBargain(requestId: $requestId, bidId: $bidId, bargainAmount: $bargainAmount)';
}


}

/// @nodoc
abstract mixin class _$AcceptBargainCopyWith<$Res> implements $BargainActionEventCopyWith<$Res> {
  factory _$AcceptBargainCopyWith(_AcceptBargain value, $Res Function(_AcceptBargain) _then) = __$AcceptBargainCopyWithImpl;
@useResult
$Res call({
 String requestId, String bidId, double bargainAmount
});




}
/// @nodoc
class __$AcceptBargainCopyWithImpl<$Res>
    implements _$AcceptBargainCopyWith<$Res> {
  __$AcceptBargainCopyWithImpl(this._self, this._then);

  final _AcceptBargain _self;
  final $Res Function(_AcceptBargain) _then;

/// Create a copy of BargainActionEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? requestId = null,Object? bidId = null,Object? bargainAmount = null,}) {
  return _then(_AcceptBargain(
requestId: null == requestId ? _self.requestId : requestId // ignore: cast_nullable_to_non_nullable
as String,bidId: null == bidId ? _self.bidId : bidId // ignore: cast_nullable_to_non_nullable
as String,bargainAmount: null == bargainAmount ? _self.bargainAmount : bargainAmount // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}

/// @nodoc


class _RejectBargain implements BargainActionEvent {
  const _RejectBargain({required this.requestId, required this.bidId});
  

 final  String requestId;
 final  String bidId;

/// Create a copy of BargainActionEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RejectBargainCopyWith<_RejectBargain> get copyWith => __$RejectBargainCopyWithImpl<_RejectBargain>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RejectBargain&&(identical(other.requestId, requestId) || other.requestId == requestId)&&(identical(other.bidId, bidId) || other.bidId == bidId));
}


@override
int get hashCode => Object.hash(runtimeType,requestId,bidId);

@override
String toString() {
  return 'BargainActionEvent.rejectBargain(requestId: $requestId, bidId: $bidId)';
}


}

/// @nodoc
abstract mixin class _$RejectBargainCopyWith<$Res> implements $BargainActionEventCopyWith<$Res> {
  factory _$RejectBargainCopyWith(_RejectBargain value, $Res Function(_RejectBargain) _then) = __$RejectBargainCopyWithImpl;
@useResult
$Res call({
 String requestId, String bidId
});




}
/// @nodoc
class __$RejectBargainCopyWithImpl<$Res>
    implements _$RejectBargainCopyWith<$Res> {
  __$RejectBargainCopyWithImpl(this._self, this._then);

  final _RejectBargain _self;
  final $Res Function(_RejectBargain) _then;

/// Create a copy of BargainActionEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? requestId = null,Object? bidId = null,}) {
  return _then(_RejectBargain(
requestId: null == requestId ? _self.requestId : requestId // ignore: cast_nullable_to_non_nullable
as String,bidId: null == bidId ? _self.bidId : bidId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc
mixin _$BargainActionState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BargainActionState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'BargainActionState()';
}


}

/// @nodoc
class $BargainActionStateCopyWith<$Res>  {
$BargainActionStateCopyWith(BargainActionState _, $Res Function(BargainActionState) __);
}


/// Adds pattern-matching-related methods to [BargainActionState].
extension BargainActionStatePatterns on BargainActionState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( BargainActionInitial value)?  initial,TResult Function( BargainActionLoading value)?  loading,TResult Function( AcceptBargainSuccess value)?  acceptBargainSuccess,TResult Function( RejectBargainSuccess value)?  rejectBargainSuccess,TResult Function( BargainActionError value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case BargainActionInitial() when initial != null:
return initial(_that);case BargainActionLoading() when loading != null:
return loading(_that);case AcceptBargainSuccess() when acceptBargainSuccess != null:
return acceptBargainSuccess(_that);case RejectBargainSuccess() when rejectBargainSuccess != null:
return rejectBargainSuccess(_that);case BargainActionError() when error != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( BargainActionInitial value)  initial,required TResult Function( BargainActionLoading value)  loading,required TResult Function( AcceptBargainSuccess value)  acceptBargainSuccess,required TResult Function( RejectBargainSuccess value)  rejectBargainSuccess,required TResult Function( BargainActionError value)  error,}){
final _that = this;
switch (_that) {
case BargainActionInitial():
return initial(_that);case BargainActionLoading():
return loading(_that);case AcceptBargainSuccess():
return acceptBargainSuccess(_that);case RejectBargainSuccess():
return rejectBargainSuccess(_that);case BargainActionError():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( BargainActionInitial value)?  initial,TResult? Function( BargainActionLoading value)?  loading,TResult? Function( AcceptBargainSuccess value)?  acceptBargainSuccess,TResult? Function( RejectBargainSuccess value)?  rejectBargainSuccess,TResult? Function( BargainActionError value)?  error,}){
final _that = this;
switch (_that) {
case BargainActionInitial() when initial != null:
return initial(_that);case BargainActionLoading() when loading != null:
return loading(_that);case AcceptBargainSuccess() when acceptBargainSuccess != null:
return acceptBargainSuccess(_that);case RejectBargainSuccess() when rejectBargainSuccess != null:
return rejectBargainSuccess(_that);case BargainActionError() when error != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function( String message)?  loading,TResult Function()?  acceptBargainSuccess,TResult Function()?  rejectBargainSuccess,TResult Function( String message)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case BargainActionInitial() when initial != null:
return initial();case BargainActionLoading() when loading != null:
return loading(_that.message);case AcceptBargainSuccess() when acceptBargainSuccess != null:
return acceptBargainSuccess();case RejectBargainSuccess() when rejectBargainSuccess != null:
return rejectBargainSuccess();case BargainActionError() when error != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function( String message)  loading,required TResult Function()  acceptBargainSuccess,required TResult Function()  rejectBargainSuccess,required TResult Function( String message)  error,}) {final _that = this;
switch (_that) {
case BargainActionInitial():
return initial();case BargainActionLoading():
return loading(_that.message);case AcceptBargainSuccess():
return acceptBargainSuccess();case RejectBargainSuccess():
return rejectBargainSuccess();case BargainActionError():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function( String message)?  loading,TResult? Function()?  acceptBargainSuccess,TResult? Function()?  rejectBargainSuccess,TResult? Function( String message)?  error,}) {final _that = this;
switch (_that) {
case BargainActionInitial() when initial != null:
return initial();case BargainActionLoading() when loading != null:
return loading(_that.message);case AcceptBargainSuccess() when acceptBargainSuccess != null:
return acceptBargainSuccess();case RejectBargainSuccess() when rejectBargainSuccess != null:
return rejectBargainSuccess();case BargainActionError() when error != null:
return error(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class BargainActionInitial implements BargainActionState {
  const BargainActionInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BargainActionInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'BargainActionState.initial()';
}


}




/// @nodoc


class BargainActionLoading implements BargainActionState {
  const BargainActionLoading(this.message);
  

 final  String message;

/// Create a copy of BargainActionState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BargainActionLoadingCopyWith<BargainActionLoading> get copyWith => _$BargainActionLoadingCopyWithImpl<BargainActionLoading>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BargainActionLoading&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'BargainActionState.loading(message: $message)';
}


}

/// @nodoc
abstract mixin class $BargainActionLoadingCopyWith<$Res> implements $BargainActionStateCopyWith<$Res> {
  factory $BargainActionLoadingCopyWith(BargainActionLoading value, $Res Function(BargainActionLoading) _then) = _$BargainActionLoadingCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$BargainActionLoadingCopyWithImpl<$Res>
    implements $BargainActionLoadingCopyWith<$Res> {
  _$BargainActionLoadingCopyWithImpl(this._self, this._then);

  final BargainActionLoading _self;
  final $Res Function(BargainActionLoading) _then;

/// Create a copy of BargainActionState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(BargainActionLoading(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class AcceptBargainSuccess implements BargainActionState {
  const AcceptBargainSuccess();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AcceptBargainSuccess);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'BargainActionState.acceptBargainSuccess()';
}


}




/// @nodoc


class RejectBargainSuccess implements BargainActionState {
  const RejectBargainSuccess();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RejectBargainSuccess);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'BargainActionState.rejectBargainSuccess()';
}


}




/// @nodoc


class BargainActionError implements BargainActionState {
  const BargainActionError(this.message);
  

 final  String message;

/// Create a copy of BargainActionState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BargainActionErrorCopyWith<BargainActionError> get copyWith => _$BargainActionErrorCopyWithImpl<BargainActionError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BargainActionError&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'BargainActionState.error(message: $message)';
}


}

/// @nodoc
abstract mixin class $BargainActionErrorCopyWith<$Res> implements $BargainActionStateCopyWith<$Res> {
  factory $BargainActionErrorCopyWith(BargainActionError value, $Res Function(BargainActionError) _then) = _$BargainActionErrorCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$BargainActionErrorCopyWithImpl<$Res>
    implements $BargainActionErrorCopyWith<$Res> {
  _$BargainActionErrorCopyWithImpl(this._self, this._then);

  final BargainActionError _self;
  final $Res Function(BargainActionError) _then;

/// Create a copy of BargainActionState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(BargainActionError(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
