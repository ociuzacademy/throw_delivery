// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'agent_delivery_list_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AgentDeliveryListState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AgentDeliveryListState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AgentDeliveryListState()';
}


}

/// @nodoc
class $AgentDeliveryListStateCopyWith<$Res>  {
$AgentDeliveryListStateCopyWith(AgentDeliveryListState _, $Res Function(AgentDeliveryListState) __);
}


/// Adds pattern-matching-related methods to [AgentDeliveryListState].
extension AgentDeliveryListStatePatterns on AgentDeliveryListState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( AgentDeliveryListInitial value)?  initial,TResult Function( AgentDeliveryListLoading value)?  loading,TResult Function( AgentDeliveryListLoaded value)?  loaded,TResult Function( AgentDeliveryListEmpty value)?  empty,TResult Function( AgentDeliveryListError value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case AgentDeliveryListInitial() when initial != null:
return initial(_that);case AgentDeliveryListLoading() when loading != null:
return loading(_that);case AgentDeliveryListLoaded() when loaded != null:
return loaded(_that);case AgentDeliveryListEmpty() when empty != null:
return empty(_that);case AgentDeliveryListError() when error != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( AgentDeliveryListInitial value)  initial,required TResult Function( AgentDeliveryListLoading value)  loading,required TResult Function( AgentDeliveryListLoaded value)  loaded,required TResult Function( AgentDeliveryListEmpty value)  empty,required TResult Function( AgentDeliveryListError value)  error,}){
final _that = this;
switch (_that) {
case AgentDeliveryListInitial():
return initial(_that);case AgentDeliveryListLoading():
return loading(_that);case AgentDeliveryListLoaded():
return loaded(_that);case AgentDeliveryListEmpty():
return empty(_that);case AgentDeliveryListError():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( AgentDeliveryListInitial value)?  initial,TResult? Function( AgentDeliveryListLoading value)?  loading,TResult? Function( AgentDeliveryListLoaded value)?  loaded,TResult? Function( AgentDeliveryListEmpty value)?  empty,TResult? Function( AgentDeliveryListError value)?  error,}){
final _that = this;
switch (_that) {
case AgentDeliveryListInitial() when initial != null:
return initial(_that);case AgentDeliveryListLoading() when loading != null:
return loading(_that);case AgentDeliveryListLoaded() when loaded != null:
return loaded(_that);case AgentDeliveryListEmpty() when empty != null:
return empty(_that);case AgentDeliveryListError() when error != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( List<DeliveryRequestModel> deliveryRequests)?  loaded,TResult Function()?  empty,TResult Function( String message)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case AgentDeliveryListInitial() when initial != null:
return initial();case AgentDeliveryListLoading() when loading != null:
return loading();case AgentDeliveryListLoaded() when loaded != null:
return loaded(_that.deliveryRequests);case AgentDeliveryListEmpty() when empty != null:
return empty();case AgentDeliveryListError() when error != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( List<DeliveryRequestModel> deliveryRequests)  loaded,required TResult Function()  empty,required TResult Function( String message)  error,}) {final _that = this;
switch (_that) {
case AgentDeliveryListInitial():
return initial();case AgentDeliveryListLoading():
return loading();case AgentDeliveryListLoaded():
return loaded(_that.deliveryRequests);case AgentDeliveryListEmpty():
return empty();case AgentDeliveryListError():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( List<DeliveryRequestModel> deliveryRequests)?  loaded,TResult? Function()?  empty,TResult? Function( String message)?  error,}) {final _that = this;
switch (_that) {
case AgentDeliveryListInitial() when initial != null:
return initial();case AgentDeliveryListLoading() when loading != null:
return loading();case AgentDeliveryListLoaded() when loaded != null:
return loaded(_that.deliveryRequests);case AgentDeliveryListEmpty() when empty != null:
return empty();case AgentDeliveryListError() when error != null:
return error(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class AgentDeliveryListInitial implements AgentDeliveryListState {
  const AgentDeliveryListInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AgentDeliveryListInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AgentDeliveryListState.initial()';
}


}




/// @nodoc


class AgentDeliveryListLoading implements AgentDeliveryListState {
  const AgentDeliveryListLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AgentDeliveryListLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AgentDeliveryListState.loading()';
}


}




/// @nodoc


class AgentDeliveryListLoaded implements AgentDeliveryListState {
  const AgentDeliveryListLoaded(final  List<DeliveryRequestModel> deliveryRequests): _deliveryRequests = deliveryRequests;
  

 final  List<DeliveryRequestModel> _deliveryRequests;
 List<DeliveryRequestModel> get deliveryRequests {
  if (_deliveryRequests is EqualUnmodifiableListView) return _deliveryRequests;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_deliveryRequests);
}


/// Create a copy of AgentDeliveryListState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AgentDeliveryListLoadedCopyWith<AgentDeliveryListLoaded> get copyWith => _$AgentDeliveryListLoadedCopyWithImpl<AgentDeliveryListLoaded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AgentDeliveryListLoaded&&const DeepCollectionEquality().equals(other._deliveryRequests, _deliveryRequests));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_deliveryRequests));

@override
String toString() {
  return 'AgentDeliveryListState.loaded(deliveryRequests: $deliveryRequests)';
}


}

/// @nodoc
abstract mixin class $AgentDeliveryListLoadedCopyWith<$Res> implements $AgentDeliveryListStateCopyWith<$Res> {
  factory $AgentDeliveryListLoadedCopyWith(AgentDeliveryListLoaded value, $Res Function(AgentDeliveryListLoaded) _then) = _$AgentDeliveryListLoadedCopyWithImpl;
@useResult
$Res call({
 List<DeliveryRequestModel> deliveryRequests
});




}
/// @nodoc
class _$AgentDeliveryListLoadedCopyWithImpl<$Res>
    implements $AgentDeliveryListLoadedCopyWith<$Res> {
  _$AgentDeliveryListLoadedCopyWithImpl(this._self, this._then);

  final AgentDeliveryListLoaded _self;
  final $Res Function(AgentDeliveryListLoaded) _then;

/// Create a copy of AgentDeliveryListState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? deliveryRequests = null,}) {
  return _then(AgentDeliveryListLoaded(
null == deliveryRequests ? _self._deliveryRequests : deliveryRequests // ignore: cast_nullable_to_non_nullable
as List<DeliveryRequestModel>,
  ));
}


}

/// @nodoc


class AgentDeliveryListEmpty implements AgentDeliveryListState {
  const AgentDeliveryListEmpty();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AgentDeliveryListEmpty);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AgentDeliveryListState.empty()';
}


}




/// @nodoc


class AgentDeliveryListError implements AgentDeliveryListState {
  const AgentDeliveryListError(this.message);
  

 final  String message;

/// Create a copy of AgentDeliveryListState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AgentDeliveryListErrorCopyWith<AgentDeliveryListError> get copyWith => _$AgentDeliveryListErrorCopyWithImpl<AgentDeliveryListError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AgentDeliveryListError&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'AgentDeliveryListState.error(message: $message)';
}


}

/// @nodoc
abstract mixin class $AgentDeliveryListErrorCopyWith<$Res> implements $AgentDeliveryListStateCopyWith<$Res> {
  factory $AgentDeliveryListErrorCopyWith(AgentDeliveryListError value, $Res Function(AgentDeliveryListError) _then) = _$AgentDeliveryListErrorCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$AgentDeliveryListErrorCopyWithImpl<$Res>
    implements $AgentDeliveryListErrorCopyWith<$Res> {
  _$AgentDeliveryListErrorCopyWithImpl(this._self, this._then);

  final AgentDeliveryListError _self;
  final $Res Function(AgentDeliveryListError) _then;

/// Create a copy of AgentDeliveryListState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(AgentDeliveryListError(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
