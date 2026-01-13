// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'feedbacks_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$FeedbacksState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FeedbacksState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'FeedbacksState()';
}


}

/// @nodoc
class $FeedbacksStateCopyWith<$Res>  {
$FeedbacksStateCopyWith(FeedbacksState _, $Res Function(FeedbacksState) __);
}


/// Adds pattern-matching-related methods to [FeedbacksState].
extension FeedbacksStatePatterns on FeedbacksState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( FeedbacksInitial value)?  initial,TResult Function( FeedbacksLoading value)?  loading,TResult Function( FeedbacksSuccess value)?  success,TResult Function( FeedbacksEmpty value)?  empty,TResult Function( FeedbacksError value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case FeedbacksInitial() when initial != null:
return initial(_that);case FeedbacksLoading() when loading != null:
return loading(_that);case FeedbacksSuccess() when success != null:
return success(_that);case FeedbacksEmpty() when empty != null:
return empty(_that);case FeedbacksError() when error != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( FeedbacksInitial value)  initial,required TResult Function( FeedbacksLoading value)  loading,required TResult Function( FeedbacksSuccess value)  success,required TResult Function( FeedbacksEmpty value)  empty,required TResult Function( FeedbacksError value)  error,}){
final _that = this;
switch (_that) {
case FeedbacksInitial():
return initial(_that);case FeedbacksLoading():
return loading(_that);case FeedbacksSuccess():
return success(_that);case FeedbacksEmpty():
return empty(_that);case FeedbacksError():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( FeedbacksInitial value)?  initial,TResult? Function( FeedbacksLoading value)?  loading,TResult? Function( FeedbacksSuccess value)?  success,TResult? Function( FeedbacksEmpty value)?  empty,TResult? Function( FeedbacksError value)?  error,}){
final _that = this;
switch (_that) {
case FeedbacksInitial() when initial != null:
return initial(_that);case FeedbacksLoading() when loading != null:
return loading(_that);case FeedbacksSuccess() when success != null:
return success(_that);case FeedbacksEmpty() when empty != null:
return empty(_that);case FeedbacksError() when error != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( List<FeedbackModel> feedbacks)?  success,TResult Function()?  empty,TResult Function( String message)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case FeedbacksInitial() when initial != null:
return initial();case FeedbacksLoading() when loading != null:
return loading();case FeedbacksSuccess() when success != null:
return success(_that.feedbacks);case FeedbacksEmpty() when empty != null:
return empty();case FeedbacksError() when error != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( List<FeedbackModel> feedbacks)  success,required TResult Function()  empty,required TResult Function( String message)  error,}) {final _that = this;
switch (_that) {
case FeedbacksInitial():
return initial();case FeedbacksLoading():
return loading();case FeedbacksSuccess():
return success(_that.feedbacks);case FeedbacksEmpty():
return empty();case FeedbacksError():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( List<FeedbackModel> feedbacks)?  success,TResult? Function()?  empty,TResult? Function( String message)?  error,}) {final _that = this;
switch (_that) {
case FeedbacksInitial() when initial != null:
return initial();case FeedbacksLoading() when loading != null:
return loading();case FeedbacksSuccess() when success != null:
return success(_that.feedbacks);case FeedbacksEmpty() when empty != null:
return empty();case FeedbacksError() when error != null:
return error(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class FeedbacksInitial implements FeedbacksState {
  const FeedbacksInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FeedbacksInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'FeedbacksState.initial()';
}


}




/// @nodoc


class FeedbacksLoading implements FeedbacksState {
  const FeedbacksLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FeedbacksLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'FeedbacksState.loading()';
}


}




/// @nodoc


class FeedbacksSuccess implements FeedbacksState {
  const FeedbacksSuccess(final  List<FeedbackModel> feedbacks): _feedbacks = feedbacks;
  

 final  List<FeedbackModel> _feedbacks;
 List<FeedbackModel> get feedbacks {
  if (_feedbacks is EqualUnmodifiableListView) return _feedbacks;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_feedbacks);
}


/// Create a copy of FeedbacksState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FeedbacksSuccessCopyWith<FeedbacksSuccess> get copyWith => _$FeedbacksSuccessCopyWithImpl<FeedbacksSuccess>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FeedbacksSuccess&&const DeepCollectionEquality().equals(other._feedbacks, _feedbacks));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_feedbacks));

@override
String toString() {
  return 'FeedbacksState.success(feedbacks: $feedbacks)';
}


}

/// @nodoc
abstract mixin class $FeedbacksSuccessCopyWith<$Res> implements $FeedbacksStateCopyWith<$Res> {
  factory $FeedbacksSuccessCopyWith(FeedbacksSuccess value, $Res Function(FeedbacksSuccess) _then) = _$FeedbacksSuccessCopyWithImpl;
@useResult
$Res call({
 List<FeedbackModel> feedbacks
});




}
/// @nodoc
class _$FeedbacksSuccessCopyWithImpl<$Res>
    implements $FeedbacksSuccessCopyWith<$Res> {
  _$FeedbacksSuccessCopyWithImpl(this._self, this._then);

  final FeedbacksSuccess _self;
  final $Res Function(FeedbacksSuccess) _then;

/// Create a copy of FeedbacksState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? feedbacks = null,}) {
  return _then(FeedbacksSuccess(
null == feedbacks ? _self._feedbacks : feedbacks // ignore: cast_nullable_to_non_nullable
as List<FeedbackModel>,
  ));
}


}

/// @nodoc


class FeedbacksEmpty implements FeedbacksState {
  const FeedbacksEmpty();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FeedbacksEmpty);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'FeedbacksState.empty()';
}


}




/// @nodoc


class FeedbacksError implements FeedbacksState {
  const FeedbacksError(this.message);
  

 final  String message;

/// Create a copy of FeedbacksState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FeedbacksErrorCopyWith<FeedbacksError> get copyWith => _$FeedbacksErrorCopyWithImpl<FeedbacksError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FeedbacksError&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'FeedbacksState.error(message: $message)';
}


}

/// @nodoc
abstract mixin class $FeedbacksErrorCopyWith<$Res> implements $FeedbacksStateCopyWith<$Res> {
  factory $FeedbacksErrorCopyWith(FeedbacksError value, $Res Function(FeedbacksError) _then) = _$FeedbacksErrorCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$FeedbacksErrorCopyWithImpl<$Res>
    implements $FeedbacksErrorCopyWith<$Res> {
  _$FeedbacksErrorCopyWithImpl(this._self, this._then);

  final FeedbacksError _self;
  final $Res Function(FeedbacksError) _then;

/// Create a copy of FeedbacksState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(FeedbacksError(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
