// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'active_delivery_list_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ActiveDeliveryListState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ActiveDeliveryListState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ActiveDeliveryListState()';
}


}

/// @nodoc
class $ActiveDeliveryListStateCopyWith<$Res>  {
$ActiveDeliveryListStateCopyWith(ActiveDeliveryListState _, $Res Function(ActiveDeliveryListState) __);
}


/// Adds pattern-matching-related methods to [ActiveDeliveryListState].
extension ActiveDeliveryListStatePatterns on ActiveDeliveryListState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( ActiveDeliveryListInitial value)?  initial,TResult Function( ActiveDeliveryListLoading value)?  loading,TResult Function( ActiveDeliveryListSuccess value)?  success,TResult Function( ActiveDeliveryListEmpty value)?  empty,TResult Function( ActiveDeliveryListError value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case ActiveDeliveryListInitial() when initial != null:
return initial(_that);case ActiveDeliveryListLoading() when loading != null:
return loading(_that);case ActiveDeliveryListSuccess() when success != null:
return success(_that);case ActiveDeliveryListEmpty() when empty != null:
return empty(_that);case ActiveDeliveryListError() when error != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( ActiveDeliveryListInitial value)  initial,required TResult Function( ActiveDeliveryListLoading value)  loading,required TResult Function( ActiveDeliveryListSuccess value)  success,required TResult Function( ActiveDeliveryListEmpty value)  empty,required TResult Function( ActiveDeliveryListError value)  error,}){
final _that = this;
switch (_that) {
case ActiveDeliveryListInitial():
return initial(_that);case ActiveDeliveryListLoading():
return loading(_that);case ActiveDeliveryListSuccess():
return success(_that);case ActiveDeliveryListEmpty():
return empty(_that);case ActiveDeliveryListError():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( ActiveDeliveryListInitial value)?  initial,TResult? Function( ActiveDeliveryListLoading value)?  loading,TResult? Function( ActiveDeliveryListSuccess value)?  success,TResult? Function( ActiveDeliveryListEmpty value)?  empty,TResult? Function( ActiveDeliveryListError value)?  error,}){
final _that = this;
switch (_that) {
case ActiveDeliveryListInitial() when initial != null:
return initial(_that);case ActiveDeliveryListLoading() when loading != null:
return loading(_that);case ActiveDeliveryListSuccess() when success != null:
return success(_that);case ActiveDeliveryListEmpty() when empty != null:
return empty(_that);case ActiveDeliveryListError() when error != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( List<DeliveryRequestModel> activeDeliveryRequests)?  success,TResult Function()?  empty,TResult Function( String message)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case ActiveDeliveryListInitial() when initial != null:
return initial();case ActiveDeliveryListLoading() when loading != null:
return loading();case ActiveDeliveryListSuccess() when success != null:
return success(_that.activeDeliveryRequests);case ActiveDeliveryListEmpty() when empty != null:
return empty();case ActiveDeliveryListError() when error != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( List<DeliveryRequestModel> activeDeliveryRequests)  success,required TResult Function()  empty,required TResult Function( String message)  error,}) {final _that = this;
switch (_that) {
case ActiveDeliveryListInitial():
return initial();case ActiveDeliveryListLoading():
return loading();case ActiveDeliveryListSuccess():
return success(_that.activeDeliveryRequests);case ActiveDeliveryListEmpty():
return empty();case ActiveDeliveryListError():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( List<DeliveryRequestModel> activeDeliveryRequests)?  success,TResult? Function()?  empty,TResult? Function( String message)?  error,}) {final _that = this;
switch (_that) {
case ActiveDeliveryListInitial() when initial != null:
return initial();case ActiveDeliveryListLoading() when loading != null:
return loading();case ActiveDeliveryListSuccess() when success != null:
return success(_that.activeDeliveryRequests);case ActiveDeliveryListEmpty() when empty != null:
return empty();case ActiveDeliveryListError() when error != null:
return error(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class ActiveDeliveryListInitial implements ActiveDeliveryListState {
  const ActiveDeliveryListInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ActiveDeliveryListInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ActiveDeliveryListState.initial()';
}


}




/// @nodoc


class ActiveDeliveryListLoading implements ActiveDeliveryListState {
  const ActiveDeliveryListLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ActiveDeliveryListLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ActiveDeliveryListState.loading()';
}


}




/// @nodoc


class ActiveDeliveryListSuccess implements ActiveDeliveryListState {
  const ActiveDeliveryListSuccess(final  List<DeliveryRequestModel> activeDeliveryRequests): _activeDeliveryRequests = activeDeliveryRequests;
  

 final  List<DeliveryRequestModel> _activeDeliveryRequests;
 List<DeliveryRequestModel> get activeDeliveryRequests {
  if (_activeDeliveryRequests is EqualUnmodifiableListView) return _activeDeliveryRequests;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_activeDeliveryRequests);
}


/// Create a copy of ActiveDeliveryListState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ActiveDeliveryListSuccessCopyWith<ActiveDeliveryListSuccess> get copyWith => _$ActiveDeliveryListSuccessCopyWithImpl<ActiveDeliveryListSuccess>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ActiveDeliveryListSuccess&&const DeepCollectionEquality().equals(other._activeDeliveryRequests, _activeDeliveryRequests));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_activeDeliveryRequests));

@override
String toString() {
  return 'ActiveDeliveryListState.success(activeDeliveryRequests: $activeDeliveryRequests)';
}


}

/// @nodoc
abstract mixin class $ActiveDeliveryListSuccessCopyWith<$Res> implements $ActiveDeliveryListStateCopyWith<$Res> {
  factory $ActiveDeliveryListSuccessCopyWith(ActiveDeliveryListSuccess value, $Res Function(ActiveDeliveryListSuccess) _then) = _$ActiveDeliveryListSuccessCopyWithImpl;
@useResult
$Res call({
 List<DeliveryRequestModel> activeDeliveryRequests
});




}
/// @nodoc
class _$ActiveDeliveryListSuccessCopyWithImpl<$Res>
    implements $ActiveDeliveryListSuccessCopyWith<$Res> {
  _$ActiveDeliveryListSuccessCopyWithImpl(this._self, this._then);

  final ActiveDeliveryListSuccess _self;
  final $Res Function(ActiveDeliveryListSuccess) _then;

/// Create a copy of ActiveDeliveryListState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? activeDeliveryRequests = null,}) {
  return _then(ActiveDeliveryListSuccess(
null == activeDeliveryRequests ? _self._activeDeliveryRequests : activeDeliveryRequests // ignore: cast_nullable_to_non_nullable
as List<DeliveryRequestModel>,
  ));
}


}

/// @nodoc


class ActiveDeliveryListEmpty implements ActiveDeliveryListState {
  const ActiveDeliveryListEmpty();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ActiveDeliveryListEmpty);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ActiveDeliveryListState.empty()';
}


}




/// @nodoc


class ActiveDeliveryListError implements ActiveDeliveryListState {
  const ActiveDeliveryListError(this.message);
  

 final  String message;

/// Create a copy of ActiveDeliveryListState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ActiveDeliveryListErrorCopyWith<ActiveDeliveryListError> get copyWith => _$ActiveDeliveryListErrorCopyWithImpl<ActiveDeliveryListError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ActiveDeliveryListError&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'ActiveDeliveryListState.error(message: $message)';
}


}

/// @nodoc
abstract mixin class $ActiveDeliveryListErrorCopyWith<$Res> implements $ActiveDeliveryListStateCopyWith<$Res> {
  factory $ActiveDeliveryListErrorCopyWith(ActiveDeliveryListError value, $Res Function(ActiveDeliveryListError) _then) = _$ActiveDeliveryListErrorCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$ActiveDeliveryListErrorCopyWithImpl<$Res>
    implements $ActiveDeliveryListErrorCopyWith<$Res> {
  _$ActiveDeliveryListErrorCopyWithImpl(this._self, this._then);

  final ActiveDeliveryListError _self;
  final $Res Function(ActiveDeliveryListError) _then;

/// Create a copy of ActiveDeliveryListState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(ActiveDeliveryListError(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
