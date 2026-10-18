// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'challenge_detail_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ChallengeDetailState {

 ChallengeDetailStatus get status; ChallengeItem? get item;/// How many hints are showing: they're revealed one at a time, and stay
/// hidden again next time (a hint is a nudge, not a setting).
 int get hintsShown;/// The notes as typed (the field's text), which run ahead of what's saved.
 String get notes; NotesSaveStatus get notesSave; String? get message; int get messageSerial;
/// Create a copy of ChallengeDetailState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ChallengeDetailStateCopyWith<ChallengeDetailState> get copyWith => _$ChallengeDetailStateCopyWithImpl<ChallengeDetailState>(this as ChallengeDetailState, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as ChallengeDetailState;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChallengeDetailState&&(identical(other.status, _this.status) || other.status == _this.status)&&(identical(other.item, _this.item) || other.item == _this.item)&&(identical(other.hintsShown, _this.hintsShown) || other.hintsShown == _this.hintsShown)&&(identical(other.notes, _this.notes) || other.notes == _this.notes)&&(identical(other.notesSave, _this.notesSave) || other.notesSave == _this.notesSave)&&(identical(other.message, _this.message) || other.message == _this.message)&&(identical(other.messageSerial, _this.messageSerial) || other.messageSerial == _this.messageSerial));
}


@override
int get hashCode {
  final _this = this as ChallengeDetailState;
  return Object.hash(runtimeType,_this.status,_this.item,_this.hintsShown,_this.notes,_this.notesSave,_this.message,_this.messageSerial);
}

@override
String toString() {
  final _this = this as ChallengeDetailState;
  return 'ChallengeDetailState(status: ${_this.status}, item: ${_this.item}, hintsShown: ${_this.hintsShown}, notes: ${_this.notes}, notesSave: ${_this.notesSave}, message: ${_this.message}, messageSerial: ${_this.messageSerial})';
}


}

/// @nodoc
abstract mixin class $ChallengeDetailStateCopyWith<$Res>  {
  factory $ChallengeDetailStateCopyWith(ChallengeDetailState value, $Res Function(ChallengeDetailState) _then) = _$ChallengeDetailStateCopyWithImpl;
@useResult
$Res call({
 ChallengeDetailStatus status, ChallengeItem? item, int hintsShown, String notes, NotesSaveStatus notesSave, String? message, int messageSerial
});


$ChallengeItemCopyWith<$Res>? get item;

}
/// @nodoc
class _$ChallengeDetailStateCopyWithImpl<$Res>
    implements $ChallengeDetailStateCopyWith<$Res> {
  _$ChallengeDetailStateCopyWithImpl(this._self, this._then);

  final ChallengeDetailState _self;
  final $Res Function(ChallengeDetailState) _then;

/// Create a copy of ChallengeDetailState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = null,Object? item = freezed,Object? hintsShown = null,Object? notes = null,Object? notesSave = null,Object? message = freezed,Object? messageSerial = null,}) {
  return _then(ChallengeDetailState(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as ChallengeDetailStatus,item: freezed == item ? _self.item : item // ignore: cast_nullable_to_non_nullable
as ChallengeItem?,hintsShown: null == hintsShown ? _self.hintsShown : hintsShown // ignore: cast_nullable_to_non_nullable
as int,notes: null == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String,notesSave: null == notesSave ? _self.notesSave : notesSave // ignore: cast_nullable_to_non_nullable
as NotesSaveStatus,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,messageSerial: null == messageSerial ? _self.messageSerial : messageSerial // ignore: cast_nullable_to_non_nullable
as int,
  ));
}
/// Create a copy of ChallengeDetailState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ChallengeItemCopyWith<$Res>? get item {
    if (_self.item == null) {
    return null;
  }

  return $ChallengeItemCopyWith<$Res>(_self.item!, (value) {
    return _then(_self.copyWith(item: value));
  });
}
}


/// Adds pattern-matching-related methods to [ChallengeDetailState].
extension ChallengeDetailStatePatterns on ChallengeDetailState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ChallengeDetailState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ChallengeDetailState() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ChallengeDetailState value)  $default,){
final _that = this;
switch (_that) {
case _ChallengeDetailState():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ChallengeDetailState value)?  $default,){
final _that = this;
switch (_that) {
case _ChallengeDetailState() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( ChallengeDetailStatus status,  ChallengeItem? item,  int hintsShown,  String notes,  NotesSaveStatus notesSave,  String? message,  int messageSerial)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ChallengeDetailState() when $default != null:
return $default(_that.status,_that.item,_that.hintsShown,_that.notes,_that.notesSave,_that.message,_that.messageSerial);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( ChallengeDetailStatus status,  ChallengeItem? item,  int hintsShown,  String notes,  NotesSaveStatus notesSave,  String? message,  int messageSerial)  $default,) {final _that = this;
switch (_that) {
case _ChallengeDetailState():
return $default(_that.status,_that.item,_that.hintsShown,_that.notes,_that.notesSave,_that.message,_that.messageSerial);case _:
  throw StateError('Unexpected subclass');

}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( ChallengeDetailStatus status,  ChallengeItem? item,  int hintsShown,  String notes,  NotesSaveStatus notesSave,  String? message,  int messageSerial)?  $default,) {final _that = this;
switch (_that) {
case _ChallengeDetailState() when $default != null:
return $default(_that.status,_that.item,_that.hintsShown,_that.notes,_that.notesSave,_that.message,_that.messageSerial);case _:
  return null;

}
}

}

/// @nodoc


class _ChallengeDetailState extends ChallengeDetailState {
  const _ChallengeDetailState({this.status = ChallengeDetailStatus.loading, this.item, this.hintsShown = 0, this.notes = '', this.notesSave = NotesSaveStatus.saved, this.message, this.messageSerial = 0}): super._();
  

@override@JsonKey() final  ChallengeDetailStatus status;
@override final  ChallengeItem? item;
/// How many hints are showing: they're revealed one at a time, and stay
/// hidden again next time (a hint is a nudge, not a setting).
@override@JsonKey() final  int hintsShown;
/// The notes as typed (the field's text), which run ahead of what's saved.
@override@JsonKey() final  String notes;
@override@JsonKey() final  NotesSaveStatus notesSave;
@override final  String? message;
@override@JsonKey() final  int messageSerial;

/// Create a copy of ChallengeDetailState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ChallengeDetailStateCopyWith<_ChallengeDetailState> get copyWith => __$ChallengeDetailStateCopyWithImpl<_ChallengeDetailState>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _ChallengeDetailState&&(identical(other.status, status) || other.status == status)&&(identical(other.item, item) || other.item == item)&&(identical(other.hintsShown, hintsShown) || other.hintsShown == hintsShown)&&(identical(other.notes, notes) || other.notes == notes)&&(identical(other.notesSave, notesSave) || other.notesSave == notesSave)&&(identical(other.message, message) || other.message == message)&&(identical(other.messageSerial, messageSerial) || other.messageSerial == messageSerial));
}


@override
int get hashCode {
    return Object.hash(runtimeType,status,item,hintsShown,notes,notesSave,message,messageSerial);
}

@override
String toString() {
    return 'ChallengeDetailState(status: $status, item: $item, hintsShown: $hintsShown, notes: $notes, notesSave: $notesSave, message: $message, messageSerial: $messageSerial)';
}


}

/// @nodoc
abstract mixin class _$ChallengeDetailStateCopyWith<$Res> implements $ChallengeDetailStateCopyWith<$Res> {
  factory _$ChallengeDetailStateCopyWith(_ChallengeDetailState value, $Res Function(_ChallengeDetailState) _then) = __$ChallengeDetailStateCopyWithImpl;
@override @useResult
$Res call({
 ChallengeDetailStatus status, ChallengeItem? item, int hintsShown, String notes, NotesSaveStatus notesSave, String? message, int messageSerial
});


@override $ChallengeItemCopyWith<$Res>? get item;

}
/// @nodoc
class __$ChallengeDetailStateCopyWithImpl<$Res>
    implements _$ChallengeDetailStateCopyWith<$Res> {
  __$ChallengeDetailStateCopyWithImpl(this._self, this._then);

  final _ChallengeDetailState _self;
  final $Res Function(_ChallengeDetailState) _then;

/// Create a copy of ChallengeDetailState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = null,Object? item = freezed,Object? hintsShown = null,Object? notes = null,Object? notesSave = null,Object? message = freezed,Object? messageSerial = null,}) {
  return _then(_ChallengeDetailState(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as ChallengeDetailStatus,item: freezed == item ? _self.item : item // ignore: cast_nullable_to_non_nullable
as ChallengeItem?,hintsShown: null == hintsShown ? _self.hintsShown : hintsShown // ignore: cast_nullable_to_non_nullable
as int,notes: null == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String,notesSave: null == notesSave ? _self.notesSave : notesSave // ignore: cast_nullable_to_non_nullable
as NotesSaveStatus,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,messageSerial: null == messageSerial ? _self.messageSerial : messageSerial // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

/// Create a copy of ChallengeDetailState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ChallengeItemCopyWith<$Res>? get item {
    if (_self.item == null) {
    return null;
  }

  return $ChallengeItemCopyWith<$Res>(_self.item!, (value) {
    return _then(_self.copyWith(item: value));
  });
}
}

// dart format on
