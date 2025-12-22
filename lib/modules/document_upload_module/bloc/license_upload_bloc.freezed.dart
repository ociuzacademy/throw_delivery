// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'license_upload_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$LicenseUploadEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LicenseUploadEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'LicenseUploadEvent()';
}


}

/// @nodoc
class $LicenseUploadEventCopyWith<$Res>  {
$LicenseUploadEventCopyWith(LicenseUploadEvent _, $Res Function(LicenseUploadEvent) __);
}


/// Adds pattern-matching-related methods to [LicenseUploadEvent].
extension LicenseUploadEventPatterns on LicenseUploadEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Started value)?  started,TResult Function( _UploadLicense value)?  uploadLicense,TResult Function( _ResetDocumentUpload value)?  reset,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Started() when started != null:
return started(_that);case _UploadLicense() when uploadLicense != null:
return uploadLicense(_that);case _ResetDocumentUpload() when reset != null:
return reset(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Started value)  started,required TResult Function( _UploadLicense value)  uploadLicense,required TResult Function( _ResetDocumentUpload value)  reset,}){
final _that = this;
switch (_that) {
case _Started():
return started(_that);case _UploadLicense():
return uploadLicense(_that);case _ResetDocumentUpload():
return reset(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Started value)?  started,TResult? Function( _UploadLicense value)?  uploadLicense,TResult? Function( _ResetDocumentUpload value)?  reset,}){
final _that = this;
switch (_that) {
case _Started() when started != null:
return started(_that);case _UploadLicense() when uploadLicense != null:
return uploadLicense(_that);case _ResetDocumentUpload() when reset != null:
return reset(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  started,TResult Function( File image)?  uploadLicense,TResult Function()?  reset,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Started() when started != null:
return started();case _UploadLicense() when uploadLicense != null:
return uploadLicense(_that.image);case _ResetDocumentUpload() when reset != null:
return reset();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  started,required TResult Function( File image)  uploadLicense,required TResult Function()  reset,}) {final _that = this;
switch (_that) {
case _Started():
return started();case _UploadLicense():
return uploadLicense(_that.image);case _ResetDocumentUpload():
return reset();}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  started,TResult? Function( File image)?  uploadLicense,TResult? Function()?  reset,}) {final _that = this;
switch (_that) {
case _Started() when started != null:
return started();case _UploadLicense() when uploadLicense != null:
return uploadLicense(_that.image);case _ResetDocumentUpload() when reset != null:
return reset();case _:
  return null;

}
}

}

/// @nodoc


class _Started implements LicenseUploadEvent {
  const _Started();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Started);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'LicenseUploadEvent.started()';
}


}




/// @nodoc


class _UploadLicense implements LicenseUploadEvent {
  const _UploadLicense({required this.image});
  

 final  File image;

/// Create a copy of LicenseUploadEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UploadLicenseCopyWith<_UploadLicense> get copyWith => __$UploadLicenseCopyWithImpl<_UploadLicense>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UploadLicense&&(identical(other.image, image) || other.image == image));
}


@override
int get hashCode => Object.hash(runtimeType,image);

@override
String toString() {
  return 'LicenseUploadEvent.uploadLicense(image: $image)';
}


}

/// @nodoc
abstract mixin class _$UploadLicenseCopyWith<$Res> implements $LicenseUploadEventCopyWith<$Res> {
  factory _$UploadLicenseCopyWith(_UploadLicense value, $Res Function(_UploadLicense) _then) = __$UploadLicenseCopyWithImpl;
@useResult
$Res call({
 File image
});




}
/// @nodoc
class __$UploadLicenseCopyWithImpl<$Res>
    implements _$UploadLicenseCopyWith<$Res> {
  __$UploadLicenseCopyWithImpl(this._self, this._then);

  final _UploadLicense _self;
  final $Res Function(_UploadLicense) _then;

/// Create a copy of LicenseUploadEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? image = null,}) {
  return _then(_UploadLicense(
image: null == image ? _self.image : image // ignore: cast_nullable_to_non_nullable
as File,
  ));
}


}

/// @nodoc


class _ResetDocumentUpload implements LicenseUploadEvent {
  const _ResetDocumentUpload();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ResetDocumentUpload);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'LicenseUploadEvent.reset()';
}


}




/// @nodoc
mixin _$LicenseUploadState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LicenseUploadState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'LicenseUploadState()';
}


}

/// @nodoc
class $LicenseUploadStateCopyWith<$Res>  {
$LicenseUploadStateCopyWith(LicenseUploadState _, $Res Function(LicenseUploadState) __);
}


/// Adds pattern-matching-related methods to [LicenseUploadState].
extension LicenseUploadStatePatterns on LicenseUploadState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( LicenseUploadInitial value)?  initial,TResult Function( LicenseUploadLoading value)?  loading,TResult Function( LicenseUploadSuccess value)?  success,TResult Function( LicenseUploadError value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case LicenseUploadInitial() when initial != null:
return initial(_that);case LicenseUploadLoading() when loading != null:
return loading(_that);case LicenseUploadSuccess() when success != null:
return success(_that);case LicenseUploadError() when error != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( LicenseUploadInitial value)  initial,required TResult Function( LicenseUploadLoading value)  loading,required TResult Function( LicenseUploadSuccess value)  success,required TResult Function( LicenseUploadError value)  error,}){
final _that = this;
switch (_that) {
case LicenseUploadInitial():
return initial(_that);case LicenseUploadLoading():
return loading(_that);case LicenseUploadSuccess():
return success(_that);case LicenseUploadError():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( LicenseUploadInitial value)?  initial,TResult? Function( LicenseUploadLoading value)?  loading,TResult? Function( LicenseUploadSuccess value)?  success,TResult? Function( LicenseUploadError value)?  error,}){
final _that = this;
switch (_that) {
case LicenseUploadInitial() when initial != null:
return initial(_that);case LicenseUploadLoading() when loading != null:
return loading(_that);case LicenseUploadSuccess() when success != null:
return success(_that);case LicenseUploadError() when error != null:
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
case LicenseUploadInitial() when initial != null:
return initial();case LicenseUploadLoading() when loading != null:
return loading();case LicenseUploadSuccess() when success != null:
return success();case LicenseUploadError() when error != null:
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
case LicenseUploadInitial():
return initial();case LicenseUploadLoading():
return loading();case LicenseUploadSuccess():
return success();case LicenseUploadError():
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
case LicenseUploadInitial() when initial != null:
return initial();case LicenseUploadLoading() when loading != null:
return loading();case LicenseUploadSuccess() when success != null:
return success();case LicenseUploadError() when error != null:
return error(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class LicenseUploadInitial implements LicenseUploadState {
  const LicenseUploadInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LicenseUploadInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'LicenseUploadState.initial()';
}


}




/// @nodoc


class LicenseUploadLoading implements LicenseUploadState {
  const LicenseUploadLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LicenseUploadLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'LicenseUploadState.loading()';
}


}




/// @nodoc


class LicenseUploadSuccess implements LicenseUploadState {
  const LicenseUploadSuccess();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LicenseUploadSuccess);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'LicenseUploadState.success()';
}


}




/// @nodoc


class LicenseUploadError implements LicenseUploadState {
  const LicenseUploadError(this.message);
  

 final  String message;

/// Create a copy of LicenseUploadState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LicenseUploadErrorCopyWith<LicenseUploadError> get copyWith => _$LicenseUploadErrorCopyWithImpl<LicenseUploadError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LicenseUploadError&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'LicenseUploadState.error(message: $message)';
}


}

/// @nodoc
abstract mixin class $LicenseUploadErrorCopyWith<$Res> implements $LicenseUploadStateCopyWith<$Res> {
  factory $LicenseUploadErrorCopyWith(LicenseUploadError value, $Res Function(LicenseUploadError) _then) = _$LicenseUploadErrorCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$LicenseUploadErrorCopyWithImpl<$Res>
    implements $LicenseUploadErrorCopyWith<$Res> {
  _$LicenseUploadErrorCopyWithImpl(this._self, this._then);

  final LicenseUploadError _self;
  final $Res Function(LicenseUploadError) _then;

/// Create a copy of LicenseUploadState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(LicenseUploadError(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
