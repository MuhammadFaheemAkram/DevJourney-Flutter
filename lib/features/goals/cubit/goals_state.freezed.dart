// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'goals_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$GoalsState {

 CalendarDate get today; GoalsStatus get status;/// Every goal, with its progress now.
 List<GoalProgress> get goals; GoalPeriod get period;/// One-time SnackBar text; [messageSerial] makes each one distinct.
 String? get message; int get messageSerial;
/// Create a copy of GoalsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GoalsStateCopyWith<GoalsState> get copyWith => _$GoalsStateCopyWithImpl<GoalsState>(this as GoalsState, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as GoalsState;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GoalsState&&(identical(other.today, _this.today) || other.today == _this.today)&&(identical(other.status, _this.status) || other.status == _this.status)&&const DeepCollectionEquality().equals(other.goals, _this.goals)&&(identical(other.period, _this.period) || other.period == _this.period)&&(identical(other.message, _this.message) || other.message == _this.message)&&(identical(other.messageSerial, _this.messageSerial) || other.messageSerial == _this.messageSerial));
}


@override
int get hashCode {
  final _this = this as GoalsState;
  return Object.hash(runtimeType,_this.today,_this.status,const DeepCollectionEquality().hash(_this.goals),_this.period,_this.message,_this.messageSerial);
}

@override
String toString() {
  final _this = this as GoalsState;
  return 'GoalsState(today: ${_this.today}, status: ${_this.status}, goals: ${_this.goals}, period: ${_this.period}, message: ${_this.message}, messageSerial: ${_this.messageSerial})';
}


}

/// @nodoc
abstract mixin class $GoalsStateCopyWith<$Res>  {
  factory $GoalsStateCopyWith(GoalsState value, $Res Function(GoalsState) _then) = _$GoalsStateCopyWithImpl;
@useResult
$Res call({
 CalendarDate today, GoalsStatus status, List<GoalProgress> goals, GoalPeriod period, String? message, int messageSerial
});




}
/// @nodoc
class _$GoalsStateCopyWithImpl<$Res>
    implements $GoalsStateCopyWith<$Res> {
  _$GoalsStateCopyWithImpl(this._self, this._then);

  final GoalsState _self;
  final $Res Function(GoalsState) _then;

/// Create a copy of GoalsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? today = null,Object? status = null,Object? goals = null,Object? period = null,Object? message = freezed,Object? messageSerial = null,}) {
  return _then(GoalsState(
today: null == today ? _self.today : today // ignore: cast_nullable_to_non_nullable
as CalendarDate,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as GoalsStatus,goals: null == goals ? _self.goals : goals // ignore: cast_nullable_to_non_nullable
as List<GoalProgress>,period: null == period ? _self.period : period // ignore: cast_nullable_to_non_nullable
as GoalPeriod,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,messageSerial: null == messageSerial ? _self.messageSerial : messageSerial // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [GoalsState].
extension GoalsStatePatterns on GoalsState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _GoalsState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _GoalsState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _GoalsState value)  $default,){
final _that = this;
switch (_that) {
case _GoalsState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _GoalsState value)?  $default,){
final _that = this;
switch (_that) {
case _GoalsState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( CalendarDate today,  GoalsStatus status,  List<GoalProgress> goals,  GoalPeriod period,  String? message,  int messageSerial)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _GoalsState() when $default != null:
return $default(_that.today,_that.status,_that.goals,_that.period,_that.message,_that.messageSerial);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( CalendarDate today,  GoalsStatus status,  List<GoalProgress> goals,  GoalPeriod period,  String? message,  int messageSerial)  $default,) {final _that = this;
switch (_that) {
case _GoalsState():
return $default(_that.today,_that.status,_that.goals,_that.period,_that.message,_that.messageSerial);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( CalendarDate today,  GoalsStatus status,  List<GoalProgress> goals,  GoalPeriod period,  String? message,  int messageSerial)?  $default,) {final _that = this;
switch (_that) {
case _GoalsState() when $default != null:
return $default(_that.today,_that.status,_that.goals,_that.period,_that.message,_that.messageSerial);case _:
  return null;

}
}

}

/// @nodoc


class _GoalsState extends GoalsState {
  const _GoalsState({required this.today, this.status = GoalsStatus.loading,  List<GoalProgress> goals = const <GoalProgress>[], this.period = GoalPeriod.daily, this.message, this.messageSerial = 0}): _goals = goals,super._();
  

@override final  CalendarDate today;
@override@JsonKey() final  GoalsStatus status;
/// Every goal, with its progress now.
 final  List<GoalProgress> _goals;
/// Every goal, with its progress now.
@override@JsonKey() List<GoalProgress> get goals {
  if (_goals is EqualUnmodifiableListView) return _goals;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_goals);
}

@override@JsonKey() final  GoalPeriod period;
/// One-time SnackBar text; [messageSerial] makes each one distinct.
@override final  String? message;
@override@JsonKey() final  int messageSerial;

/// Create a copy of GoalsState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GoalsStateCopyWith<_GoalsState> get copyWith => __$GoalsStateCopyWithImpl<_GoalsState>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _GoalsState&&(identical(other.today, today) || other.today == today)&&(identical(other.status, status) || other.status == status)&&const DeepCollectionEquality().equals(other.goals, _goals)&&(identical(other.period, period) || other.period == period)&&(identical(other.message, message) || other.message == message)&&(identical(other.messageSerial, messageSerial) || other.messageSerial == messageSerial));
}


@override
int get hashCode {
    return Object.hash(runtimeType,today,status,const DeepCollectionEquality().hash(_goals),period,message,messageSerial);
}

@override
String toString() {
    return 'GoalsState(today: $today, status: $status, goals: $goals, period: $period, message: $message, messageSerial: $messageSerial)';
}


}

/// @nodoc
abstract mixin class _$GoalsStateCopyWith<$Res> implements $GoalsStateCopyWith<$Res> {
  factory _$GoalsStateCopyWith(_GoalsState value, $Res Function(_GoalsState) _then) = __$GoalsStateCopyWithImpl;
@override @useResult
$Res call({
 CalendarDate today, GoalsStatus status, List<GoalProgress> goals, GoalPeriod period, String? message, int messageSerial
});




}
/// @nodoc
class __$GoalsStateCopyWithImpl<$Res>
    implements _$GoalsStateCopyWith<$Res> {
  __$GoalsStateCopyWithImpl(this._self, this._then);

  final _GoalsState _self;
  final $Res Function(_GoalsState) _then;

/// Create a copy of GoalsState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? today = null,Object? status = null,Object? goals = null,Object? period = null,Object? message = freezed,Object? messageSerial = null,}) {
  return _then(_GoalsState(
today: null == today ? _self.today : today // ignore: cast_nullable_to_non_nullable
as CalendarDate,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as GoalsStatus,goals: null == goals ? _self._goals : goals // ignore: cast_nullable_to_non_nullable
as List<GoalProgress>,period: null == period ? _self.period : period // ignore: cast_nullable_to_non_nullable
as GoalPeriod,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,messageSerial: null == messageSerial ? _self.messageSerial : messageSerial // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
