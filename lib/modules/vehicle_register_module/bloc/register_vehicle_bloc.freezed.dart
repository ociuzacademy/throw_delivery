// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'register_vehicle_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$RegisterVehicleEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RegisterVehicleEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'RegisterVehicleEvent()';
}


}

/// @nodoc
class $RegisterVehicleEventCopyWith<$Res>  {
$RegisterVehicleEventCopyWith(RegisterVehicleEvent _, $Res Function(RegisterVehicleEvent) __);
}


/// Adds pattern-matching-related methods to [RegisterVehicleEvent].
extension RegisterVehicleEventPatterns on RegisterVehicleEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Started value)?  started,TResult Function( _RegisterVehicle value)?  registerVehicle,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Started() when started != null:
return started(_that);case _RegisterVehicle() when registerVehicle != null:
return registerVehicle(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Started value)  started,required TResult Function( _RegisterVehicle value)  registerVehicle,}){
final _that = this;
switch (_that) {
case _Started():
return started(_that);case _RegisterVehicle():
return registerVehicle(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Started value)?  started,TResult? Function( _RegisterVehicle value)?  registerVehicle,}){
final _that = this;
switch (_that) {
case _Started() when started != null:
return started(_that);case _RegisterVehicle() when registerVehicle != null:
return registerVehicle(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  started,TResult Function( VehicleData vehicleData)?  registerVehicle,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Started() when started != null:
return started();case _RegisterVehicle() when registerVehicle != null:
return registerVehicle(_that.vehicleData);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  started,required TResult Function( VehicleData vehicleData)  registerVehicle,}) {final _that = this;
switch (_that) {
case _Started():
return started();case _RegisterVehicle():
return registerVehicle(_that.vehicleData);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  started,TResult? Function( VehicleData vehicleData)?  registerVehicle,}) {final _that = this;
switch (_that) {
case _Started() when started != null:
return started();case _RegisterVehicle() when registerVehicle != null:
return registerVehicle(_that.vehicleData);case _:
  return null;

}
}

}

/// @nodoc


class _Started implements RegisterVehicleEvent {
  const _Started();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Started);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'RegisterVehicleEvent.started()';
}


}




/// @nodoc


class _RegisterVehicle implements RegisterVehicleEvent {
  const _RegisterVehicle(this.vehicleData);
  

 final  VehicleData vehicleData;

/// Create a copy of RegisterVehicleEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RegisterVehicleCopyWith<_RegisterVehicle> get copyWith => __$RegisterVehicleCopyWithImpl<_RegisterVehicle>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RegisterVehicle&&(identical(other.vehicleData, vehicleData) || other.vehicleData == vehicleData));
}


@override
int get hashCode => Object.hash(runtimeType,vehicleData);

@override
String toString() {
  return 'RegisterVehicleEvent.registerVehicle(vehicleData: $vehicleData)';
}


}

/// @nodoc
abstract mixin class _$RegisterVehicleCopyWith<$Res> implements $RegisterVehicleEventCopyWith<$Res> {
  factory _$RegisterVehicleCopyWith(_RegisterVehicle value, $Res Function(_RegisterVehicle) _then) = __$RegisterVehicleCopyWithImpl;
@useResult
$Res call({
 VehicleData vehicleData
});




}
/// @nodoc
class __$RegisterVehicleCopyWithImpl<$Res>
    implements _$RegisterVehicleCopyWith<$Res> {
  __$RegisterVehicleCopyWithImpl(this._self, this._then);

  final _RegisterVehicle _self;
  final $Res Function(_RegisterVehicle) _then;

/// Create a copy of RegisterVehicleEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? vehicleData = null,}) {
  return _then(_RegisterVehicle(
null == vehicleData ? _self.vehicleData : vehicleData // ignore: cast_nullable_to_non_nullable
as VehicleData,
  ));
}


}

/// @nodoc
mixin _$RegisterVehicleState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RegisterVehicleState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'RegisterVehicleState()';
}


}

/// @nodoc
class $RegisterVehicleStateCopyWith<$Res>  {
$RegisterVehicleStateCopyWith(RegisterVehicleState _, $Res Function(RegisterVehicleState) __);
}


/// Adds pattern-matching-related methods to [RegisterVehicleState].
extension RegisterVehicleStatePatterns on RegisterVehicleState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( RegisterVehicleInitial value)?  initial,TResult Function( RegisterVehicleLoading value)?  loading,TResult Function( RegisterVehicleSuccess value)?  success,TResult Function( RegisterVehicleError value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case RegisterVehicleInitial() when initial != null:
return initial(_that);case RegisterVehicleLoading() when loading != null:
return loading(_that);case RegisterVehicleSuccess() when success != null:
return success(_that);case RegisterVehicleError() when error != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( RegisterVehicleInitial value)  initial,required TResult Function( RegisterVehicleLoading value)  loading,required TResult Function( RegisterVehicleSuccess value)  success,required TResult Function( RegisterVehicleError value)  error,}){
final _that = this;
switch (_that) {
case RegisterVehicleInitial():
return initial(_that);case RegisterVehicleLoading():
return loading(_that);case RegisterVehicleSuccess():
return success(_that);case RegisterVehicleError():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( RegisterVehicleInitial value)?  initial,TResult? Function( RegisterVehicleLoading value)?  loading,TResult? Function( RegisterVehicleSuccess value)?  success,TResult? Function( RegisterVehicleError value)?  error,}){
final _that = this;
switch (_that) {
case RegisterVehicleInitial() when initial != null:
return initial(_that);case RegisterVehicleLoading() when loading != null:
return loading(_that);case RegisterVehicleSuccess() when success != null:
return success(_that);case RegisterVehicleError() when error != null:
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
case RegisterVehicleInitial() when initial != null:
return initial();case RegisterVehicleLoading() when loading != null:
return loading();case RegisterVehicleSuccess() when success != null:
return success();case RegisterVehicleError() when error != null:
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
case RegisterVehicleInitial():
return initial();case RegisterVehicleLoading():
return loading();case RegisterVehicleSuccess():
return success();case RegisterVehicleError():
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
case RegisterVehicleInitial() when initial != null:
return initial();case RegisterVehicleLoading() when loading != null:
return loading();case RegisterVehicleSuccess() when success != null:
return success();case RegisterVehicleError() when error != null:
return error(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class RegisterVehicleInitial implements RegisterVehicleState {
  const RegisterVehicleInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RegisterVehicleInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'RegisterVehicleState.initial()';
}


}




/// @nodoc


class RegisterVehicleLoading implements RegisterVehicleState {
  const RegisterVehicleLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RegisterVehicleLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'RegisterVehicleState.loading()';
}


}




/// @nodoc


class RegisterVehicleSuccess implements RegisterVehicleState {
  const RegisterVehicleSuccess();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RegisterVehicleSuccess);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'RegisterVehicleState.success()';
}


}




/// @nodoc


class RegisterVehicleError implements RegisterVehicleState {
  const RegisterVehicleError(this.message);
  

 final  String message;

/// Create a copy of RegisterVehicleState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RegisterVehicleErrorCopyWith<RegisterVehicleError> get copyWith => _$RegisterVehicleErrorCopyWithImpl<RegisterVehicleError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RegisterVehicleError&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'RegisterVehicleState.error(message: $message)';
}


}

/// @nodoc
abstract mixin class $RegisterVehicleErrorCopyWith<$Res> implements $RegisterVehicleStateCopyWith<$Res> {
  factory $RegisterVehicleErrorCopyWith(RegisterVehicleError value, $Res Function(RegisterVehicleError) _then) = _$RegisterVehicleErrorCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$RegisterVehicleErrorCopyWithImpl<$Res>
    implements $RegisterVehicleErrorCopyWith<$Res> {
  _$RegisterVehicleErrorCopyWithImpl(this._self, this._then);

  final RegisterVehicleError _self;
  final $Res Function(RegisterVehicleError) _then;

/// Create a copy of RegisterVehicleState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(RegisterVehicleError(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
