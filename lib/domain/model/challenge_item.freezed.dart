// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'challenge_item.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ChallengeProgress {

 ChallengeStatus get status; String get solutionNotes;/// When it first went in progress.
 DateTime? get startedAt;/// The day it was done: it counts for the streak and challenge goals.
 CalendarDate? get completedOn;/// The last change, for "recent challenges".
 DateTime? get updatedAt;
/// Create a copy of ChallengeProgress
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ChallengeProgressCopyWith<ChallengeProgress> get copyWith => _$ChallengeProgressCopyWithImpl<ChallengeProgress>(this as ChallengeProgress, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as ChallengeProgress;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChallengeProgress&&(identical(other.status, _this.status) || other.status == _this.status)&&(identical(other.solutionNotes, _this.solutionNotes) || other.solutionNotes == _this.solutionNotes)&&(identical(other.startedAt, _this.startedAt) || other.startedAt == _this.startedAt)&&(identical(other.completedOn, _this.completedOn) || other.completedOn == _this.completedOn)&&(identical(other.updatedAt, _this.updatedAt) || other.updatedAt == _this.updatedAt));
}


@override
int get hashCode {
  final _this = this as ChallengeProgress;
  return Object.hash(runtimeType,_this.status,_this.solutionNotes,_this.startedAt,_this.completedOn,_this.updatedAt);
}

@override
String toString() {
  final _this = this as ChallengeProgress;
  return 'ChallengeProgress(status: ${_this.status}, solutionNotes: ${_this.solutionNotes}, startedAt: ${_this.startedAt}, completedOn: ${_this.completedOn}, updatedAt: ${_this.updatedAt})';
}


}

/// @nodoc
abstract mixin class $ChallengeProgressCopyWith<$Res>  {
  factory $ChallengeProgressCopyWith(ChallengeProgress value, $Res Function(ChallengeProgress) _then) = _$ChallengeProgressCopyWithImpl;
@useResult
$Res call({
 ChallengeStatus status, String solutionNotes, DateTime? startedAt, CalendarDate? completedOn, DateTime? updatedAt
});




}
/// @nodoc
class _$ChallengeProgressCopyWithImpl<$Res>
    implements $ChallengeProgressCopyWith<$Res> {
  _$ChallengeProgressCopyWithImpl(this._self, this._then);

  final ChallengeProgress _self;
  final $Res Function(ChallengeProgress) _then;

/// Create a copy of ChallengeProgress
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = null,Object? solutionNotes = null,Object? startedAt = freezed,Object? completedOn = freezed,Object? updatedAt = freezed,}) {
  return _then(ChallengeProgress(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as ChallengeStatus,solutionNotes: null == solutionNotes ? _self.solutionNotes : solutionNotes // ignore: cast_nullable_to_non_nullable
as String,startedAt: freezed == startedAt ? _self.startedAt : startedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,completedOn: freezed == completedOn ? _self.completedOn : completedOn // ignore: cast_nullable_to_non_nullable
as CalendarDate?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [ChallengeProgress].
extension ChallengeProgressPatterns on ChallengeProgress {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ChallengeProgress value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ChallengeProgress() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ChallengeProgress value)  $default,){
final _that = this;
switch (_that) {
case _ChallengeProgress():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ChallengeProgress value)?  $default,){
final _that = this;
switch (_that) {
case _ChallengeProgress() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( ChallengeStatus status,  String solutionNotes,  DateTime? startedAt,  CalendarDate? completedOn,  DateTime? updatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ChallengeProgress() when $default != null:
return $default(_that.status,_that.solutionNotes,_that.startedAt,_that.completedOn,_that.updatedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( ChallengeStatus status,  String solutionNotes,  DateTime? startedAt,  CalendarDate? completedOn,  DateTime? updatedAt)  $default,) {final _that = this;
switch (_that) {
case _ChallengeProgress():
return $default(_that.status,_that.solutionNotes,_that.startedAt,_that.completedOn,_that.updatedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( ChallengeStatus status,  String solutionNotes,  DateTime? startedAt,  CalendarDate? completedOn,  DateTime? updatedAt)?  $default,) {final _that = this;
switch (_that) {
case _ChallengeProgress() when $default != null:
return $default(_that.status,_that.solutionNotes,_that.startedAt,_that.completedOn,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc


class _ChallengeProgress implements ChallengeProgress {
  const _ChallengeProgress({this.status = ChallengeStatus.todo, this.solutionNotes = '', this.startedAt, this.completedOn, this.updatedAt});
  

@override@JsonKey() final  ChallengeStatus status;
@override@JsonKey() final  String solutionNotes;
/// When it first went in progress.
@override final  DateTime? startedAt;
/// The day it was done: it counts for the streak and challenge goals.
@override final  CalendarDate? completedOn;
/// The last change, for "recent challenges".
@override final  DateTime? updatedAt;

/// Create a copy of ChallengeProgress
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ChallengeProgressCopyWith<_ChallengeProgress> get copyWith => __$ChallengeProgressCopyWithImpl<_ChallengeProgress>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _ChallengeProgress&&(identical(other.status, status) || other.status == status)&&(identical(other.solutionNotes, solutionNotes) || other.solutionNotes == solutionNotes)&&(identical(other.startedAt, startedAt) || other.startedAt == startedAt)&&(identical(other.completedOn, completedOn) || other.completedOn == completedOn)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}


@override
int get hashCode {
    return Object.hash(runtimeType,status,solutionNotes,startedAt,completedOn,updatedAt);
}

@override
String toString() {
    return 'ChallengeProgress(status: $status, solutionNotes: $solutionNotes, startedAt: $startedAt, completedOn: $completedOn, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$ChallengeProgressCopyWith<$Res> implements $ChallengeProgressCopyWith<$Res> {
  factory _$ChallengeProgressCopyWith(_ChallengeProgress value, $Res Function(_ChallengeProgress) _then) = __$ChallengeProgressCopyWithImpl;
@override @useResult
$Res call({
 ChallengeStatus status, String solutionNotes, DateTime? startedAt, CalendarDate? completedOn, DateTime? updatedAt
});




}
/// @nodoc
class __$ChallengeProgressCopyWithImpl<$Res>
    implements _$ChallengeProgressCopyWith<$Res> {
  __$ChallengeProgressCopyWithImpl(this._self, this._then);

  final _ChallengeProgress _self;
  final $Res Function(_ChallengeProgress) _then;

/// Create a copy of ChallengeProgress
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = null,Object? solutionNotes = null,Object? startedAt = freezed,Object? completedOn = freezed,Object? updatedAt = freezed,}) {
  return _then(_ChallengeProgress(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as ChallengeStatus,solutionNotes: null == solutionNotes ? _self.solutionNotes : solutionNotes // ignore: cast_nullable_to_non_nullable
as String,startedAt: freezed == startedAt ? _self.startedAt : startedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,completedOn: freezed == completedOn ? _self.completedOn : completedOn // ignore: cast_nullable_to_non_nullable
as CalendarDate?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

/// @nodoc
mixin _$ChallengeItem {

 Challenge get challenge; ChallengeProgress get progress;
/// Create a copy of ChallengeItem
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ChallengeItemCopyWith<ChallengeItem> get copyWith => _$ChallengeItemCopyWithImpl<ChallengeItem>(this as ChallengeItem, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as ChallengeItem;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChallengeItem&&(identical(other.challenge, _this.challenge) || other.challenge == _this.challenge)&&(identical(other.progress, _this.progress) || other.progress == _this.progress));
}


@override
int get hashCode {
  final _this = this as ChallengeItem;
  return Object.hash(runtimeType,_this.challenge,_this.progress);
}

@override
String toString() {
  final _this = this as ChallengeItem;
  return 'ChallengeItem(challenge: ${_this.challenge}, progress: ${_this.progress})';
}


}

/// @nodoc
abstract mixin class $ChallengeItemCopyWith<$Res>  {
  factory $ChallengeItemCopyWith(ChallengeItem value, $Res Function(ChallengeItem) _then) = _$ChallengeItemCopyWithImpl;
@useResult
$Res call({
 Challenge challenge, ChallengeProgress progress
});


$ChallengeCopyWith<$Res> get challenge;$ChallengeProgressCopyWith<$Res> get progress;

}
/// @nodoc
class _$ChallengeItemCopyWithImpl<$Res>
    implements $ChallengeItemCopyWith<$Res> {
  _$ChallengeItemCopyWithImpl(this._self, this._then);

  final ChallengeItem _self;
  final $Res Function(ChallengeItem) _then;

/// Create a copy of ChallengeItem
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? challenge = null,Object? progress = null,}) {
  return _then(ChallengeItem(
challenge: null == challenge ? _self.challenge : challenge // ignore: cast_nullable_to_non_nullable
as Challenge,progress: null == progress ? _self.progress : progress // ignore: cast_nullable_to_non_nullable
as ChallengeProgress,
  ));
}
/// Create a copy of ChallengeItem
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ChallengeCopyWith<$Res> get challenge {
  
  return $ChallengeCopyWith<$Res>(_self.challenge, (value) {
    return _then(_self.copyWith(challenge: value));
  });
}/// Create a copy of ChallengeItem
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ChallengeProgressCopyWith<$Res> get progress {
  
  return $ChallengeProgressCopyWith<$Res>(_self.progress, (value) {
    return _then(_self.copyWith(progress: value));
  });
}
}


/// Adds pattern-matching-related methods to [ChallengeItem].
extension ChallengeItemPatterns on ChallengeItem {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ChallengeItem value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ChallengeItem() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ChallengeItem value)  $default,){
final _that = this;
switch (_that) {
case _ChallengeItem():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ChallengeItem value)?  $default,){
final _that = this;
switch (_that) {
case _ChallengeItem() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( Challenge challenge,  ChallengeProgress progress)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ChallengeItem() when $default != null:
return $default(_that.challenge,_that.progress);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( Challenge challenge,  ChallengeProgress progress)  $default,) {final _that = this;
switch (_that) {
case _ChallengeItem():
return $default(_that.challenge,_that.progress);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( Challenge challenge,  ChallengeProgress progress)?  $default,) {final _that = this;
switch (_that) {
case _ChallengeItem() when $default != null:
return $default(_that.challenge,_that.progress);case _:
  return null;

}
}

}

/// @nodoc


class _ChallengeItem extends ChallengeItem {
  const _ChallengeItem({required this.challenge, this.progress = const ChallengeProgress()}): super._();
  

@override final  Challenge challenge;
@override@JsonKey() final  ChallengeProgress progress;

/// Create a copy of ChallengeItem
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ChallengeItemCopyWith<_ChallengeItem> get copyWith => __$ChallengeItemCopyWithImpl<_ChallengeItem>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _ChallengeItem&&(identical(other.challenge, challenge) || other.challenge == challenge)&&(identical(other.progress, progress) || other.progress == progress));
}


@override
int get hashCode {
    return Object.hash(runtimeType,challenge,progress);
}

@override
String toString() {
    return 'ChallengeItem(challenge: $challenge, progress: $progress)';
}


}

/// @nodoc
abstract mixin class _$ChallengeItemCopyWith<$Res> implements $ChallengeItemCopyWith<$Res> {
  factory _$ChallengeItemCopyWith(_ChallengeItem value, $Res Function(_ChallengeItem) _then) = __$ChallengeItemCopyWithImpl;
@override @useResult
$Res call({
 Challenge challenge, ChallengeProgress progress
});


@override $ChallengeCopyWith<$Res> get challenge;@override $ChallengeProgressCopyWith<$Res> get progress;

}
/// @nodoc
class __$ChallengeItemCopyWithImpl<$Res>
    implements _$ChallengeItemCopyWith<$Res> {
  __$ChallengeItemCopyWithImpl(this._self, this._then);

  final _ChallengeItem _self;
  final $Res Function(_ChallengeItem) _then;

/// Create a copy of ChallengeItem
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? challenge = null,Object? progress = null,}) {
  return _then(_ChallengeItem(
challenge: null == challenge ? _self.challenge : challenge // ignore: cast_nullable_to_non_nullable
as Challenge,progress: null == progress ? _self.progress : progress // ignore: cast_nullable_to_non_nullable
as ChallengeProgress,
  ));
}

/// Create a copy of ChallengeItem
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ChallengeCopyWith<$Res> get challenge {
  
  return $ChallengeCopyWith<$Res>(_self.challenge, (value) {
    return _then(_self.copyWith(challenge: value));
  });
}/// Create a copy of ChallengeItem
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ChallengeProgressCopyWith<$Res> get progress {
  
  return $ChallengeProgressCopyWith<$Res>(_self.progress, (value) {
    return _then(_self.copyWith(progress: value));
  });
}
}

// dart format on
