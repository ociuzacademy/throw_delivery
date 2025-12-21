// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'delivery_agent_profile_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$DeliveryAgentProfileState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DeliveryAgentProfileState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'DeliveryAgentProfileState()';
}


}

/// @nodoc
class $DeliveryAgentProfileStateCopyWith<$Res>  {
$DeliveryAgentProfileStateCopyWith(DeliveryAgentProfileState _, $Res Function(DeliveryAgentProfileState) __);
}


/// Adds pattern-matching-related methods to [DeliveryAgentProfileState].
extension DeliveryAgentProfileStatePatterns on DeliveryAgentProfileState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( DeliveryAgentProfileInitial value)?  initial,TResult Function( DeliveryAgentProfileLoading value)?  loading,TResult Function( DeliveryAgentProfileSuccess value)?  success,TResult Function( DeliveryAgentProfileError value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case DeliveryAgentProfileInitial() when initial != null:
return initial(_that);case DeliveryAgentProfileLoading() when loading != null:
return loading(_that);case DeliveryAgentProfileSuccess() when success != null:
return success(_that);case DeliveryAgentProfileError() when error != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( DeliveryAgentProfileInitial value)  initial,required TResult Function( DeliveryAgentProfileLoading value)  loading,required TResult Function( DeliveryAgentProfileSuccess value)  success,required TResult Function( DeliveryAgentProfileError value)  error,}){
final _that = this;
switch (_that) {
case DeliveryAgentProfileInitial():
return initial(_that);case DeliveryAgentProfileLoading():
return loading(_that);case DeliveryAgentProfileSuccess():
return success(_that);case DeliveryAgentProfileError():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( DeliveryAgentProfileInitial value)?  initial,TResult? Function( DeliveryAgentProfileLoading value)?  loading,TResult? Function( DeliveryAgentProfileSuccess value)?  success,TResult? Function( DeliveryAgentProfileError value)?  error,}){
final _that = this;
switch (_that) {
case DeliveryAgentProfileInitial() when initial != null:
return initial(_that);case DeliveryAgentProfileLoading() when loading != null:
return loading(_that);case DeliveryAgentProfileSuccess() when success != null:
return success(_that);case DeliveryAgentProfileError() when error != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( DeliveryAgentModel deliveryAgent)?  success,TResult Function( String message)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case DeliveryAgentProfileInitial() when initial != null:
return initial();case DeliveryAgentProfileLoading() when loading != null:
return loading();case DeliveryAgentProfileSuccess() when success != null:
return success(_that.deliveryAgent);case DeliveryAgentProfileError() when error != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( DeliveryAgentModel deliveryAgent)  success,required TResult Function( String message)  error,}) {final _that = this;
switch (_that) {
case DeliveryAgentProfileInitial():
return initial();case DeliveryAgentProfileLoading():
return loading();case DeliveryAgentProfileSuccess():
return success(_that.deliveryAgent);case DeliveryAgentProfileError():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( DeliveryAgentModel deliveryAgent)?  success,TResult? Function( String message)?  error,}) {final _that = this;
switch (_that) {
case DeliveryAgentProfileInitial() when initial != null:
return initial();case DeliveryAgentProfileLoading() when loading != null:
return loading();case DeliveryAgentProfileSuccess() when success != null:
return success(_that.deliveryAgent);case DeliveryAgentProfileError() when error != null:
return error(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class DeliveryAgentProfileInitial implements DeliveryAgentProfileState {
  const DeliveryAgentProfileInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DeliveryAgentProfileInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'DeliveryAgentProfileState.initial()';
}


}




/// @nodoc


class DeliveryAgentProfileLoading implements DeliveryAgentProfileState {
  const DeliveryAgentProfileLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DeliveryAgentProfileLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'DeliveryAgentProfileState.loading()';
}


}




/// @nodoc


class DeliveryAgentProfileSuccess implements DeliveryAgentProfileState {
  const DeliveryAgentProfileSuccess(this.deliveryAgent);
  

 final  DeliveryAgentModel deliveryAgent;

/// Create a copy of DeliveryAgentProfileState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DeliveryAgentProfileSuccessCopyWith<DeliveryAgentProfileSuccess> get copyWith => _$DeliveryAgentProfileSuccessCopyWithImpl<DeliveryAgentProfileSuccess>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DeliveryAgentProfileSuccess&&(identical(other.deliveryAgent, deliveryAgent) || other.deliveryAgent == deliveryAgent));
}


@override
int get hashCode => Object.hash(runtimeType,deliveryAgent);

@override
String toString() {
  return 'DeliveryAgentProfileState.success(deliveryAgent: $deliveryAgent)';
}


}

/// @nodoc
abstract mixin class $DeliveryAgentProfileSuccessCopyWith<$Res> implements $DeliveryAgentProfileStateCopyWith<$Res> {
  factory $DeliveryAgentProfileSuccessCopyWith(DeliveryAgentProfileSuccess value, $Res Function(DeliveryAgentProfileSuccess) _then) = _$DeliveryAgentProfileSuccessCopyWithImpl;
@useResult
$Res call({
 DeliveryAgentModel deliveryAgent
});




}
/// @nodoc
class _$DeliveryAgentProfileSuccessCopyWithImpl<$Res>
    implements $DeliveryAgentProfileSuccessCopyWith<$Res> {
  _$DeliveryAgentProfileSuccessCopyWithImpl(this._self, this._then);

  final DeliveryAgentProfileSuccess _self;
  final $Res Function(DeliveryAgentProfileSuccess) _then;

/// Create a copy of DeliveryAgentProfileState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? deliveryAgent = null,}) {
  return _then(DeliveryAgentProfileSuccess(
null == deliveryAgent ? _self.deliveryAgent : deliveryAgent // ignore: cast_nullable_to_non_nullable
as DeliveryAgentModel,
  ));
}


}

/// @nodoc


class DeliveryAgentProfileError implements DeliveryAgentProfileState {
  const DeliveryAgentProfileError(this.message);
  

 final  String message;

/// Create a copy of DeliveryAgentProfileState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DeliveryAgentProfileErrorCopyWith<DeliveryAgentProfileError> get copyWith => _$DeliveryAgentProfileErrorCopyWithImpl<DeliveryAgentProfileError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DeliveryAgentProfileError&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'DeliveryAgentProfileState.error(message: $message)';
}


}

/// @nodoc
abstract mixin class $DeliveryAgentProfileErrorCopyWith<$Res> implements $DeliveryAgentProfileStateCopyWith<$Res> {
  factory $DeliveryAgentProfileErrorCopyWith(DeliveryAgentProfileError value, $Res Function(DeliveryAgentProfileError) _then) = _$DeliveryAgentProfileErrorCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$DeliveryAgentProfileErrorCopyWithImpl<$Res>
    implements $DeliveryAgentProfileErrorCopyWith<$Res> {
  _$DeliveryAgentProfileErrorCopyWithImpl(this._self, this._then);

  final DeliveryAgentProfileError _self;
  final $Res Function(DeliveryAgentProfileError) _then;

/// Create a copy of DeliveryAgentProfileState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(DeliveryAgentProfileError(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
