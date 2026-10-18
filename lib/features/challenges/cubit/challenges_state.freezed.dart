// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'challenges_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ChallengesState {

 ChallengesStatus get status; List<ChallengeItem> get challenges;/// `null`: every difficulty.
 Difficulty? get difficulty;/// `null`: every status.
 ChallengeStatus? get challengeStatus;
/// Create a copy of ChallengesState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ChallengesStateCopyWith<ChallengesState> get copyWith => _$ChallengesStateCopyWithImpl<ChallengesState>(this as ChallengesState, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as ChallengesState;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChallengesState&&(identical(other.status, _this.status) || other.status == _this.status)&&const DeepCollectionEquality().equals(other.challenges, _this.challenges)&&(identical(other.difficulty, _this.difficulty) || other.difficulty == _this.difficulty)&&(identical(other.challengeStatus, _this.challengeStatus) || other.challengeStatus == _this.challengeStatus));
}


@override
int get hashCode {
  final _this = this as ChallengesState;
  return Object.hash(runtimeType,_this.status,const DeepCollectionEquality().hash(_this.challenges),_this.difficulty,_this.challengeStatus);
}

@override
String toString() {
  final _this = this as ChallengesState;
  return 'ChallengesState(status: ${_this.status}, challenges: ${_this.challenges}, difficulty: ${_this.difficulty}, challengeStatus: ${_this.challengeStatus})';
}


}

/// @nodoc
abstract mixin class $ChallengesStateCopyWith<$Res>  {
  factory $ChallengesStateCopyWith(ChallengesState value, $Res Function(ChallengesState) _then) = _$ChallengesStateCopyWithImpl;
@useResult
$Res call({
 ChallengesStatus status, List<ChallengeItem> challenges, Difficulty? difficulty, ChallengeStatus? challengeStatus
});




}
/// @nodoc
class _$ChallengesStateCopyWithImpl<$Res>
    implements $ChallengesStateCopyWith<$Res> {
  _$ChallengesStateCopyWithImpl(this._self, this._then);

  final ChallengesState _self;
  final $Res Function(ChallengesState) _then;

/// Create a copy of ChallengesState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = null,Object? challenges = null,Object? difficulty = freezed,Object? challengeStatus = freezed,}) {
  return _then(ChallengesState(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as ChallengesStatus,challenges: null == challenges ? _self.challenges : challenges // ignore: cast_nullable_to_non_nullable
as List<ChallengeItem>,difficulty: freezed == difficulty ? _self.difficulty : difficulty // ignore: cast_nullable_to_non_nullable
as Difficulty?,challengeStatus: freezed == challengeStatus ? _self.challengeStatus : challengeStatus // ignore: cast_nullable_to_non_nullable
as ChallengeStatus?,
  ));
}

}


/// Adds pattern-matching-related methods to [ChallengesState].
extension ChallengesStatePatterns on ChallengesState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ChallengesState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ChallengesState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ChallengesState value)  $default,){
final _that = this;
switch (_that) {
case _ChallengesState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ChallengesState value)?  $default,){
final _that = this;
switch (_that) {
case _ChallengesState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( ChallengesStatus status,  List<ChallengeItem> challenges,  Difficulty? difficulty,  ChallengeStatus? challengeStatus)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ChallengesState() when $default != null:
return $default(_that.status,_that.challenges,_that.difficulty,_that.challengeStatus);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( ChallengesStatus status,  List<ChallengeItem> challenges,  Difficulty? difficulty,  ChallengeStatus? challengeStatus)  $default,) {final _that = this;
switch (_that) {
case _ChallengesState():
return $default(_that.status,_that.challenges,_that.difficulty,_that.challengeStatus);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( ChallengesStatus status,  List<ChallengeItem> challenges,  Difficulty? difficulty,  ChallengeStatus? challengeStatus)?  $default,) {final _that = this;
switch (_that) {
case _ChallengesState() when $default != null:
return $default(_that.status,_that.challenges,_that.difficulty,_that.challengeStatus);case _:
  return null;

}
}

}

/// @nodoc


class _ChallengesState extends ChallengesState {
  const _ChallengesState({this.status = ChallengesStatus.loading,  List<ChallengeItem> challenges = const <ChallengeItem>[], this.difficulty, this.challengeStatus}): _challenges = challenges,super._();
  

@override@JsonKey() final  ChallengesStatus status;
 final  List<ChallengeItem> _challenges;
@override@JsonKey() List<ChallengeItem> get challenges {
  if (_challenges is EqualUnmodifiableListView) return _challenges;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_challenges);
}

/// `null`: every difficulty.
@override final  Difficulty? difficulty;
/// `null`: every status.
@override final  ChallengeStatus? challengeStatus;

/// Create a copy of ChallengesState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ChallengesStateCopyWith<_ChallengesState> get copyWith => __$ChallengesStateCopyWithImpl<_ChallengesState>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _ChallengesState&&(identical(other.status, status) || other.status == status)&&const DeepCollectionEquality().equals(other.challenges, _challenges)&&(identical(other.difficulty, difficulty) || other.difficulty == difficulty)&&(identical(other.challengeStatus, challengeStatus) || other.challengeStatus == challengeStatus));
}


@override
int get hashCode {
    return Object.hash(runtimeType,status,const DeepCollectionEquality().hash(_challenges),difficulty,challengeStatus);
}

@override
String toString() {
    return 'ChallengesState(status: $status, challenges: $challenges, difficulty: $difficulty, challengeStatus: $challengeStatus)';
}


}

/// @nodoc
abstract mixin class _$ChallengesStateCopyWith<$Res> implements $ChallengesStateCopyWith<$Res> {
  factory _$ChallengesStateCopyWith(_ChallengesState value, $Res Function(_ChallengesState) _then) = __$ChallengesStateCopyWithImpl;
@override @useResult
$Res call({
 ChallengesStatus status, List<ChallengeItem> challenges, Difficulty? difficulty, ChallengeStatus? challengeStatus
});




}
/// @nodoc
class __$ChallengesStateCopyWithImpl<$Res>
    implements _$ChallengesStateCopyWith<$Res> {
  __$ChallengesStateCopyWithImpl(this._self, this._then);

  final _ChallengesState _self;
  final $Res Function(_ChallengesState) _then;

/// Create a copy of ChallengesState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = null,Object? challenges = null,Object? difficulty = freezed,Object? challengeStatus = freezed,}) {
  return _then(_ChallengesState(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as ChallengesStatus,challenges: null == challenges ? _self._challenges : challenges // ignore: cast_nullable_to_non_nullable
as List<ChallengeItem>,difficulty: freezed == difficulty ? _self.difficulty : difficulty // ignore: cast_nullable_to_non_nullable
as Difficulty?,challengeStatus: freezed == challengeStatus ? _self.challengeStatus : challengeStatus // ignore: cast_nullable_to_non_nullable
as ChallengeStatus?,
  ));
}


}

// dart format on
